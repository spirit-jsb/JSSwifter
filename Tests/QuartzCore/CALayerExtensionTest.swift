//
//  CALayerExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/28.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class CALayerExtensionTest: XCTestCase {

    func test_left() {
        let layer = CALayer()
        layer.frame = CGRect(x: 50.0, y: 20.0, width: 100.0, height: 100.0)
        XCTAssertEqual(layer.left, 50.0)
        layer.left = 100.0
        XCTAssertEqual(layer.frame.origin.x, 100.0)
    }
    
    func test_top() {
        let layer = CALayer()
        layer.frame = CGRect(x: 50.0, y: 20.0, width: 100.0, height: 100.0)
        XCTAssertEqual(layer.top, 20.0)
        layer.top = 100.0
        XCTAssertEqual(layer.frame.origin.y, 100.0)
    }
    
    func test_right() {
        let layer = CALayer()
        layer.frame = CGRect(x: 50.0, y: 20.0, width: 100.0, height: 100.0)
        XCTAssertEqual(layer.right, 150.0)
        layer.right = 100.0
        XCTAssertEqual(layer.frame.origin.x, 0.0)
    }
    
    func test_bottom() {
        let layer = CALayer()
        layer.frame = CGRect(x: 50.0, y: 20.0, width: 100.0, height: 100.0)
        XCTAssertEqual(layer.bottom, 120.0)
        layer.bottom = 80.0
        XCTAssertEqual(layer.frame.origin.y, -20.0)
    }
    
    func test_width() {
        let layer = CALayer()
        layer.frame = CGRect(x: 50.0, y: 20.0, width: 100.0, height: 100.0)
        XCTAssertEqual(layer.width, 100.0)
        layer.width = 60.0
        XCTAssertEqual(layer.frame.size.width, 60.0)
    }
    
    func test_height() {
        let layer = CALayer()
        layer.frame = CGRect(x: 50.0, y: 20.0, width: 100.0, height: 100.0)
        XCTAssertEqual(layer.height, 100.0)
        layer.height = 80.0
        XCTAssertEqual(layer.frame.size.height, 80.0)
    }
    
    func test_center_x() {
        let layer = CALayer()
        layer.frame = CGRect(x: 50.0, y: 20.0, width: 100.0, height: 100.0)
        XCTAssertEqual(layer.centerX, 100.0)
        layer.centerX = 80.0
        XCTAssertEqual(layer.frame.origin.x, 30.0)
    }
    
    func test_center_y() {
        let layer = CALayer()
        layer.frame = CGRect(x: 50.0, y: 20.0, width: 100.0, height: 100.0)
        XCTAssertEqual(layer.centerY, 70.0)
        layer.centerY = 80.0
        XCTAssertEqual(layer.frame.origin.y, 30.0)
    }
    
    func test_center() {
        let layer = CALayer()
        layer.frame = CGRect(x: 50.0, y: 20.0, width: 100.0, height: 100.0)
        XCTAssertEqual(layer.center, CGPoint(x: 100.0, y: 70.0))
        layer.center = CGPoint(x: 50.0, y: 50.0)
        XCTAssertEqual(layer.frame.origin.x, 0.0)
        XCTAssertEqual(layer.frame.origin.y, 0.0)
    }

    func test_origin() {
        let layer = CALayer()
        layer.frame = CGRect(x: 50.0, y: 20.0, width: 100.0, height: 100.0)
        XCTAssertEqual(layer.origin, CGPoint(x: 50.0, y: 20.0))
        layer.origin = CGPoint(x: 20.0, y: 30.0)
        XCTAssertEqual(layer.frame.origin, CGPoint(x: 20.0, y: 30.0))
    }

    func test_size() {
        let layer = CALayer()
        layer.frame = CGRect(x: 50.0, y: 20.0, width: 100.0, height: 100.0)
        XCTAssertEqual(layer.size, CGSize(width: 100.0, height: 100.0))
        layer.size = CGSize(width: 80.0, height: 120.0)
        XCTAssertEqual(layer.frame.size, CGSize(width: 80.0, height: 120.0))
    }
    
    func test_snapshot_image() {
        let layer1 = CALayer()
        layer1.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        layer1.backgroundColor = UIColor.blue.cgColor
        XCTAssertNotNil(layer1.snapshotImage)
        let layer2 = CALayer()
        XCTAssertNil(layer2.snapshotImage)
    }
    
    func test_round_corners() {
        let layer = CALayer()
        layer.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        layer.roundCorners([.allCorners], radius: 5.0)
        let maskPath = UIBezierPath(roundedRect: layer.bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: 5.0, height: 5.0))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        XCTAssertEqual(layer.mask?.bounds, shape.bounds)
        XCTAssertEqual(layer.mask?.cornerRadius, shape.cornerRadius)
    }
    
    func test_add_shadow() {
        let layer = CALayer()
        layer.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        layer.addShadow(ofColor: UIColor.red, radius: 5.0, offset: .zero, opacity: 0.5)
        XCTAssertEqual(layer.shadowColor, UIColor.red.cgColor)
        XCTAssertEqual(layer.shadowRadius, 5.0)
        XCTAssertEqual(layer.shadowOffset, .zero)
        XCTAssertEqual(layer.shadowOpacity, 0.5)
    }
    
    func test_add_subviews() {
        let layer = CALayer()
        layer.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        XCTAssertNil(layer.sublayers)
        
        layer.addSublayers([CALayer(), CALayer()])
        XCTAssertEqual(layer.sublayers?.count, 2)
    }
    
    func test_remove_subviews() {
        let layer = CALayer()
        layer.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        XCTAssertNil(layer.sublayers)
        
        layer.addSublayers([CALayer(), CALayer()])
        XCTAssertEqual(layer.sublayers?.count, 2)
        
        layer.removeSublayers()
        XCTAssertNil(layer.sublayers)
    }
}
