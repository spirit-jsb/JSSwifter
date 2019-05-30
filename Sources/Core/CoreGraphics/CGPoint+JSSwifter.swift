//
//  CGPoint+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import CoreGraphics

public extension CGPoint {
    
    // MARK:
    /// 计算指定 CGPoint 到另一给定 CGPoint 间的距离
    ///
    ///     let point1 = CGPoint(x: 10.0, y: 10.0)
    ///     let point2 = CGPoint(x: 30.0, y: 30.0)
    ///     let distance = point1.distance(from: point2)
    ///     //distance = 28.28
    ///
    /// - Parameter point: 用于计算距离的另一给定 CGPoint
    /// - Returns: 返回指定 CGPoint 到另一给定 CGPoint 间的距离
    func distance(to point: CGPoint) -> CGFloat {
        return CGPoint.distance(from: self, to: point)
    }
    
    /// 计算两给定 CGPoint 间的距离
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     let distance = point1.distance(from: point2)
    ///     //distance = 28.28
    ///
    /// - Parameters:
    ///   - point1: 第一个给定 CGPoint
    ///   - point2: 第二个给定 CGPoint
    /// - Returns: 返回两给定 CGPoint 间的距离
    static func distance(from point1: CGPoint, to point2: CGPoint) -> CGFloat {
        // http://stackoverflow.com/questions/6416101/calculate-the-distance-between-two-cgpoints
        return sqrt(pow(point2.x - point1.x, 2.0) + pow(point2.y - point1.y, 2.0))
    }
    
    /// 两给定 CGPoint 相加
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     let point = point1 + point2
    ///     //point = CGPoint(x: 40, y: 40)
    ///
    /// - Parameters:
    ///   - lhs: 左侧给定 CGPoint
    ///   - rhs: 右侧给定 CGPoint
    /// - Returns: 返回两给定 CGPoint 相加结果
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    /// 指定 CGPoint 与给定 CGPoint 相加
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     point1 += point2
    ///     //point1 = CGPoint(x: 40, y: 40)
    ///
    /// - Parameters:
    ///   - lhs: 左侧指定 CGPoint
    ///   - rhs: 右侧给定 CGPoint
    static func += (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs + rhs
    }
    
    /// 两给定 CGPoint 相减
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     let point = point1 - point2
    ///     //point = CGPoint(x: -20, y: -20)
    ///
    /// - Parameters:
    ///   - lhs: 左侧给定 CGPoint
    ///   - rhs: 右侧给定 CGPoint
    /// - Returns: 返回两给定 CGPoint 相减结果
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    /// 指定 CGPoint 与给定 CGPoint 相减
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     point1 -= point2
    ///     //point1 = CGPoint(x: -20, y: -20)
    ///
    /// - Parameters:
    ///   - lhs: 左侧指定 CGPoint
    ///   - rhs: 右侧给定 CGPoint
    static func -= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs - rhs
    }
    
    /// 指定 CGPoint 与给定标量相乘
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let scalar = point1 * 5
    ///     //scalar = CGPoint(x: 50, y: 50)
    ///
    /// - Parameters:
    ///   - point: 指定 CGPoint
    ///   - scalar: 给定标量
    /// - Returns: 返回指定 CGPoint 与给定标量相乘结果
    static func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x * scalar, y: point.y * scalar)
    }
    
    /// 指定标量与给定 CGPoint 相乘
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let scalar = 5 * point1
    ///     //scalar = CGPoint(x: 50, y: 50)
    ///
    /// - Parameters:
    ///   - scalar: 指定标量
    ///   - point: 给定 CGPoint
    /// - Returns: 返回指定标量与给定 CGPoint 相乘结果
    static func * (scalar: CGFloat, point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x * scalar, y: point.y * scalar)
    }
    
    /// 指定 CGPoint 与给定标量相乘
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     point *= 5
    ///     //point1 = CGPoint(x: 50, y: 50)
    ///
    /// - Parameters:
    ///   - point: 指定 CGPoint
    ///   - scalar: 给定标量
    static func *= (point: inout CGPoint, scalar: CGFloat) {
        point = point * scalar
    }
}
