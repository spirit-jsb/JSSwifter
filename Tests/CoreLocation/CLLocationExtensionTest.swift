
//
//  CLLocationExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

#if canImport(CoreLocation)
import CoreLocation

class CLLocationExtensionTest: XCTestCase {

    func test_mid_location() {
        let aLoc = CLLocation(latitude: -15.822877, longitude: -47.941839)
        let bLoc = CLLocation(latitude: -15.692030, longitude: -47.594397)
        let mid = CLLocation.midLocation(start: aLoc, end: bLoc)
        
        XCTAssertEqual(mid.coordinate.latitude, -15.7575223324019, accuracy: 0.0000000000001)
        XCTAssertEqual(mid.coordinate.longitude, -47.7680620274339, accuracy: 0.0000000000001)
        
        XCTAssertEqual(aLoc.midLocation(to: bLoc).coordinate.latitude, -15.7575223324019, accuracy: 0.0000000000001)
        XCTAssertEqual(aLoc.midLocation(to: bLoc).coordinate.longitude, -47.7680620274339, accuracy: 0.0000000000001)
    }
    
    func test_bearing() {
        let aLoc = CLLocation(latitude: 38.6318909290283, longitude: -90.2828979492187)
        let bLoc = CLLocation(latitude: 38.5352759115441, longitude: -89.8448181152343)
        let bearing = aLoc.bearing(to: bLoc)
        
        XCTAssertEqual(bearing, 105.619, accuracy: 0.001)
    }
}

#endif
