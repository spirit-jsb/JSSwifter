//
//  CLLocation+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import CoreLocation

public extension CLLocation {
    
    // MARK:
    
    /// 计算指定 CLLocation 到另一给定 CLLocation 间的中间坐标点
    ///
    ///     let aLoc = CLLocation(latitude: -15.822877, longitude: -47.941839)
    ///     let bLoc = CLLocation(latitude: -15.692030, longitude: -47.594397)
    ///     let mid = aLoc.midLocation(to: bLoc)
    ///     // mid.coordinate.latitude = -15.7575223324019, mid.coordinate.longitude = -47.7680620274339
    ///
    /// - Parameter point: 用于计算中间坐标点的另一给定 CLLocation
    /// - Returns: 返回指定 CLLocation 到另一给定 CLLocation 间的中间坐标点
    func midLocation(to point: CLLocation) -> CLLocation {
        return CLLocation.midLocation(start: self, end: point)
    }
    
    /// 计算指定 CLLocation 到另一给定 CLLocation 间的方位
    ///
    ///     let aLoc = CLLocation(latitude: 38.6318909290283, longitude: -90.2828979492187)
    ///     let bLoc = CLLocation(latitude: 38.5352759115441, longitude: -89.8448181152343)
    ///     let bearing = aLoc.bearing(to: bLoc)
    ///     // bearing = 105.619
    /// - Parameter destination: 用于计算方位的另一给定 CLLocation
    /// - Returns: 返回指定 CLLocation 到另一给定 CLLocation 间的方位(0˚～360˚)
    func bearing(to destination: CLLocation) -> Double {
        // http://stackoverflow.com/questions/3925942/cllocation-category-for-calculating-bearing-w-haversine-function
        let lat1 = Double.pi * self.coordinate.latitude / 180.0
        let long1 = Double.pi * self.coordinate.longitude / 180.0
        let lat2 = Double.pi * destination.coordinate.latitude / 180.0
        let long2 = Double.pi * destination.coordinate.longitude / 180.0
        
        // Formula: θ = atan2( sin Δλ ⋅ cos φ2 , cos φ1 ⋅ sin φ2 − sin φ1 ⋅ cos φ2 ⋅ cos Δλ )
        // Source: http://www.movable-type.co.uk/scripts/latlong.html
        
        let rads = atan2(
            sin(long2 - long1) * cos(lat2),
            cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(long2 - long1))
        let degrees = rads * 180.0 / Double.pi
        
        return (degrees + 360.0).truncatingRemainder(dividingBy: 360.0)
    }
    
    /// 计算两给定 CLLocation 间的中间坐标点
    ///
    ///     let aLoc = CLLocation(latitude: -15.822877, longitude: -47.941839)
    ///     let bLoc = CLLocation(latitude: -15.692030, longitude: -47.594397)
    ///     let mid = CLLocation.midLocation(start: aLoc, end: bLoc)
    ///     // mid.coordinate.latitude = -15.7575223324019, mid.coordinate.longitude = -47.7680620274339
    ///
    /// - Parameters:
    ///   - start: 第一个给定 CLLocation
    ///   - end: 第二个给定 CLLocation
    /// - Returns: 返回两给定 CLLocation 间的中间坐标点
    static func midLocation(start: CLLocation, end: CLLocation) -> CLLocation {
        let lat1 = Double.pi * start.coordinate.latitude / 180.0
        let long1 = Double.pi * start.coordinate.longitude / 180.0
        let lat2 = Double.pi * end.coordinate.latitude / 180.0
        let long2 = Double.pi * end.coordinate.longitude / 180.0
        
        // Formula
        //    Bx = cos φ2 ⋅ cos Δλ
        //    By = cos φ2 ⋅ sin Δλ
        //    φm = atan2( sin φ1 + sin φ2, √(cos φ1 + Bx)² + By² )
        //    λm = λ1 + atan2(By, cos(φ1)+Bx)
        // Source: http://www.movable-type.co.uk/scripts/latlong.html
        
        let bxLoc = cos(lat2) * cos(long2 - long1)
        let byLoc = cos(lat2) * sin(long2 - long1)
        let mlat = atan2(sin(lat1) + sin(lat2), sqrt((cos(lat1) + bxLoc) * (cos(lat1) + bxLoc) + (byLoc * byLoc)))
        let mlong = (long1) + atan2(byLoc, cos(lat1) + bxLoc)
        
        return CLLocation(latitude: (mlat * 180.0 / Double.pi), longitude: (mlong * 180.0 / Double.pi))
    }
}
