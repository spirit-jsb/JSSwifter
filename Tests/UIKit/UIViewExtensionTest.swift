//
//  UIViewExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/22.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest

class UIViewExtensionTest: XCTestCase {

    // MARK:
    func test_border_color() {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0)))
        view.borderColor = nil
        XCTAssertNil(view.borderColor)
        view.borderColor = UIColor.red
        XCTAssertNotNil(view.borderColor)
        XCTAssertEqual(view.borderColor, UIColor.red)
        XCTAssertEqual(view.layer.borderColor?.uiColor, UIColor.red)
    }
    
    func test_border_width() {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0)))
        view.borderWidth = 0.0
        XCTAssertEqual(view.borderWidth, 0.0)
        view.borderWidth = 5.0
        XCTAssertEqual(view.borderWidth, 5.0)
    }
    
    func test_corner_radius() {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0)))
        XCTAssertEqual(view.cornerRadius, 0.0)
        view.cornerRadius = 5.0
        XCTAssertEqual(view.cornerRadius, 5.0)
    }
    
    func test_shadow_color() {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0)))
        view.layer.shadowColor = nil
        XCTAssertNil(view.shadowColor)
        view.shadowColor = UIColor.orange
        XCTAssertNotNil(view.shadowColor)
        XCTAssertEqual(view.shadowColor, UIColor.orange)
        XCTAssertEqual(view.layer.shadowColor?.uiColor, UIColor.orange)
    }
    
    func test_shadow_offset() {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0)))
        view.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        XCTAssertEqual(view.shadowOffset, CGSize(width: 5.0, height: 5.0))
        view.shadowOffset = CGSize.zero
        XCTAssertEqual(view.shadowOffset, CGSize.zero)
    }
    
    func test_shadow_opacity() {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0)))
        view.layer.shadowOpacity = 0.0
        XCTAssertEqual(view.shadowOpacity, 0.0)
        view.shadowOpacity = 0.3
        XCTAssertEqual(view.shadowOpacity, 0.3)
    }
    
    func test_shadow_radius() {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0)))
        view.layer.shadowRadius = 0.0
        XCTAssertEqual(view.shadowRadius, 0.0)
        view.shadowRadius = 0.3
        XCTAssertEqual(view.layer.shadowRadius, 0.3)
    }
    
    func test_left() {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 50.0, y: 20.0), size: CGSize(width: 100.0, height: 100.0)))
        XCTAssertEqual(view.left, 50.0)
        view.left = 100.0
        XCTAssertEqual(view.frame.origin.x, 100.0)
    }
    
    func test_top() {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 50.0, y: 20.0), size: CGSize(width: 100.0, height: 100.0)))
        XCTAssertEqual(view.top, 20.0)
        view.top = 100.0
        XCTAssertEqual(view.frame.origin.y, 100.0)
    }
    
    func test_right() {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 50.0, y: 20.0), size: CGSize(width: 100.0, height: 100.0)))
        XCTAssertEqual(view.right, 150.0)
        view.right = 100.0
        XCTAssertEqual(view.frame.origin.x, 0.0)
    }
    
    func test_bottom() {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 50.0, y: 20.0), size: CGSize(width: 100.0, height: 100.0)))
        XCTAssertEqual(view.bottom, 120.0)
        view.bottom = 80.0
        XCTAssertEqual(view.frame.origin.y, -20.0)
    }
    
    func test_width() {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 50.0, y: 20.0), size: CGSize(width: 100.0, height: 100.0)))
        XCTAssertEqual(view.width, 100.0)
        view.width = 60.0
        XCTAssertEqual(view.frame.size.width, 60.0)
    }
    
    func test_height() {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 50.0, y: 20.0), size: CGSize(width: 100.0, height: 100.0)))
        XCTAssertEqual(view.height, 100.0)
        view.height = 80.0
        XCTAssertEqual(view.frame.size.height, 80.0)
    }
    
    func test_center_x() {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 50.0, y: 20.0), size: CGSize(width: 100.0, height: 100.0)))
        XCTAssertEqual(view.centerX, 100.0)
        view.centerX = 80.0
        XCTAssertEqual(view.center.x, 80.0)
    }
    
    func test_center_y() {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 50.0, y: 20.0), size: CGSize(width: 100.0, height: 100.0)))
        XCTAssertEqual(view.centerY, 70.0)
        view.centerY = 80.0
        XCTAssertEqual(view.center.y, 80.0)
    }
    
    func test_origin() {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 50.0, y: 20.0), size: CGSize(width: 100.0, height: 100.0)))
        XCTAssertEqual(view.origin, CGPoint(x: 50.0, y: 20.0))
        view.origin = CGPoint(x: 20.0, y: 30.0)
        XCTAssertEqual(view.frame.origin, CGPoint(x: 20.0, y: 30.0))
    }
    
    func test_size() {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 50.0, y: 20.0), size: CGSize(width: 100.0, height: 100.0)))
        XCTAssertEqual(view.size, CGSize(width: 100.0, height: 100.0))
        view.size = CGSize(width: 80.0, height: 120.0)
        XCTAssertEqual(view.frame.size, CGSize(width: 80.0, height: 120.0))
    }
    
    func test_snapshot_image() {
        let view1 = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0)))
        view1.backgroundColor = UIColor.blue
        XCTAssertNotNil(view1.snapshotImage)
        let view2 = UIView()
        XCTAssertNil(view2.snapshotImage)
    }
    
    func test_parent_view_controller() {
        let viewController = UIViewController()
        XCTAssertNotNil(viewController.view.parentViewController)
        XCTAssertEqual(viewController.view.parentViewController, viewController)
        
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0)))
        XCTAssertNil(view.parentViewController)
    }
    
    func test_first_responder() {
        XCTAssertNil(UIView().firstResponder())
        
        let window = UIWindow()
        
        let textField = UITextField(frame: .zero)
        window.addSubview(textField)
        textField.becomeFirstResponder()
        XCTAssertTrue(textField.firstResponder() === textField)
        
        let superView = UIView()
        window.addSubview(superView)
        let subView = UITextField(frame: .zero)
        superView.addSubview(subView)
        subView.becomeFirstResponder()
        XCTAssertTrue(superView.firstResponder() === subView)
        
        XCTAssertTrue(window.firstResponder() === subView)
    }
    
    func test_round_corners() {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0)))
        view.roundCorners([.allCorners], radius: 5.0)
        let maskPath = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: 5.0, height: 5.0))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        XCTAssertEqual(view.layer.mask?.bounds, shape.bounds)
        XCTAssertEqual(view.layer.mask?.cornerRadius, shape.cornerRadius)
    }
    
    func test_add_shadow() {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0)))
        view.addShadow(ofColor: UIColor.red, radius: 5.0, offset: .zero, opacity: 0.5)
        XCTAssertEqual(view.shadowColor, UIColor.red)
        XCTAssertEqual(view.shadowRadius, 5.0)
        XCTAssertEqual(view.shadowOffset, .zero)
        XCTAssertEqual(view.shadowOpacity, 0.5)
    }
    
    func test_add_subviews() {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        XCTAssertEqual(view.subviews.count, 0)
        
        view.addSubviews([UIView(), UIView()])
        XCTAssertEqual(view.subviews.count, 2)
    }
    
    func test_remove_subviews() {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        XCTAssertEqual(view.subviews.count, 0)
        
        view.addSubviews([UIView(), UIView()])
        XCTAssertEqual(view.subviews.count, 2)
        
        view.removeSubviews()
        XCTAssertEqual(view.subviews.count, 0)
    }
    
    func test_add_gesture_recognizers() {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        XCTAssertNil(view.gestureRecognizers)

        let tap = UITapGestureRecognizer(target: nil, action: nil)
        let pan = UIPanGestureRecognizer(target: nil, action: nil)
        let swipe = UISwipeGestureRecognizer(target: nil, action: nil)
        
        view.addGestureRecognizers([tap, pan, swipe])
        XCTAssertNotNil(view.gestureRecognizers)
        XCTAssertEqual(view.gestureRecognizers?.count, 3)
    }
    
    func test_remove_gesture_recognizers() {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        XCTAssertNil(view.gestureRecognizers)
        view.removeGestureRecognizers()
        XCTAssertNil(view.gestureRecognizers)
        
        let tap = UITapGestureRecognizer(target: nil, action: nil)
        let pan = UIPanGestureRecognizer(target: nil, action: nil)
        let swipe = UISwipeGestureRecognizer(target: nil, action: nil)
        
        view.addGestureRecognizers([tap, pan, swipe])
        XCTAssertNotNil(view.gestureRecognizers)
        XCTAssertEqual(view.gestureRecognizers?.count, 3)
        view.removeGestureRecognizers()
        XCTAssertEqual(view.gestureRecognizers?.count, 0)
        
        view.addGestureRecognizers([tap, pan, swipe])
        XCTAssertEqual(view.gestureRecognizers?.count, 3)
        view.removeGestureRecognizers([tap])
        XCTAssertEqual(view.gestureRecognizers?.count, 2)
    }
    
    func test_fade_in() {
        let view1 = UIView()
        view1.isHidden = true
        view1.alpha = 0.0
        
        view1.fadeIn(duration: 0.0, completion: nil)
        XCTAssertFalse(view1.isHidden)
        XCTAssertEqual(view1.alpha, 1.0)
        
        let fadeInExpectation = expectation(description: "Faded in")
        
        let view2 = UIView()
        view2.alpha = 0.0
        XCTAssertFalse(view2.isHidden)
        
        view2.fadeIn(duration: 0.5) { (_) in
            fadeInExpectation.fulfill()
        }
        
        XCTAssertEqual(view2.alpha, 1.0)
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func test_fade_out() {
        let view1 = UIView()
        view1.isHidden = true
        
        view1.fadeOut(duration: 0.0, completion: nil)
        XCTAssertFalse(view1.isHidden)
        XCTAssertEqual(view1.alpha, 0.0)
        
        let fadeOutExpectation = expectation(description: "Faded out")
        
        let view2 = UIView()
        XCTAssertFalse(view2.isHidden)
        
        view2.fadeOut(duration: 0.5) { (_) in
            fadeOutExpectation.fulfill()
        }
        
        XCTAssertEqual(view2.alpha, 0.0)
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func test_rotate_by_angle() {
        let view1 = UIView()
        let transform1 = CGAffineTransform(rotationAngle: 2.0)
        view1.rotate(byAngle: 2.0, ofType: .radians, animated: false, duration: 0.0, completion: nil)
        XCTAssertEqual(view1.transform, transform1)
        
        let view2 = UIView()
        let transform2 = CGAffineTransform(rotationAngle: .pi * 90.0 / 180.0)
        view2.rotate(byAngle: 90.0, ofType: .degrees, animated: false, duration: 0.0, completion: nil)
        XCTAssertEqual(view2.transform, transform2)
        
        let rotateExpectation = expectation(description: "Rotate")
        
        let view3 = UIView()
        let transform3 = CGAffineTransform(rotationAngle: 2.0)
        
        view3.rotate(byAngle: 2.0, ofType: .radians, animated: true, duration: 0.5) { (_) in
            rotateExpectation.fulfill()
        }
        XCTAssertEqual(view3.transform, transform3)
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func test_rotate_to_angle() {
        let view1 = UIView()
        let transform1 = CGAffineTransform(rotationAngle: 2.0)
        view1.rotate(toAngle: 2.0, ofType: .radians, animated: false, duration: 0.0, completion: nil)
        XCTAssertEqual(view1.transform, transform1)
        
        let view2 = UIView()
        let transform2 = CGAffineTransform(rotationAngle: .pi * 90.0 / 180.0)
        view2.rotate(toAngle: 90.0, ofType: .degrees, animated: false, duration: 0.0, completion: nil)
        XCTAssertEqual(view2.transform, transform2)
        
        let rotateExpectation = expectation(description: "Rotate")
        
        let view3 = UIView()
        let transform3 = CGAffineTransform(rotationAngle: 2.0)
        
        view3.rotate(toAngle: 2.0, ofType: .radians, animated: true, duration: 0.5) { (_) in
            rotateExpectation.fulfill()
        }
        XCTAssertEqual(view3.transform, transform3)
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func test_scale() {
        let view1 = UIView()
        let transform1 = CGAffineTransform(scaleX: 10.0, y: 10.0)
        view1.scale(by: CGPoint(x: 10.0, y: 10.0), animated: false, duration: 0.0, completion: nil)
        XCTAssertEqual(view1.transform, transform1)
        
        let scaleExpectation = expectation(description: "Scale")
        
        let view2 = UIView()
        let transform2 = CGAffineTransform(scaleX: 10.0, y: 10.0)
        
        view2.scale(by: CGPoint(x: 10.0, y: 10.0), animated: true, duration: 0.5) { (_) in
            scaleExpectation.fulfill()
        }
        XCTAssertEqual(view2.transform, transform2)
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func test_convert() {
        let window = UIWindow(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        let view = UIView(frame: CGRect(x: 30.0, y: 30.0, width: 10.0, height: 10.0))
        
        var point = CGPoint(x: 20.0, y: 20.0)
        var rect = CGRect(x: 10.0, y: 10.0, width: 50.0, height: 50.0)
        
        var convertToPoint = window.convert(point, toViewOrWindow: nil)
        var convertToRect = window.convert(rect, toViewOrWindow: nil)
        var convertFromPoint = window.convert(point, fromViewOrWindow: nil)
        var convertFromRect = window.convert(rect, fromViewOrWindow: nil)
        
        XCTAssertEqual(convertToPoint, point)
        XCTAssertEqual(convertToRect, rect)
        XCTAssertEqual(convertFromPoint, point)
        XCTAssertEqual(convertFromRect, rect)
        
        convertToPoint = window.convert(point, toViewOrWindow: window)
        convertToRect = window.convert(rect, toViewOrWindow: window)
        convertFromPoint = window.convert(point, fromViewOrWindow: window)
        convertFromRect = window.convert(rect, fromViewOrWindow: window)
        
        XCTAssertEqual(convertToPoint, point)
        XCTAssertEqual(convertToRect, rect)
        XCTAssertEqual(convertFromPoint, point)
        XCTAssertEqual(convertFromRect, rect)
        
        convertToPoint = window.convert(point, toViewOrWindow: view)
        convertToRect = window.convert(rect, toViewOrWindow: view)
        convertFromPoint = window.convert(point, fromViewOrWindow: view)
        convertFromRect = window.convert(rect, fromViewOrWindow: view)
        
        XCTAssertEqual(convertToPoint, CGPoint(x: -10.0, y: -10.0))
        XCTAssertEqual(convertToRect, CGRect(x: -20.0, y: -20.0, width: 50.0, height: 50.0))
        XCTAssertEqual(convertFromPoint, CGPoint(x: 50.0, y: 50.0))
        XCTAssertEqual(convertFromRect, CGRect(x: 40.0, y: 40.0, width: 50.0, height: 50.0))
        
        point = CGPoint(x: 5.0, y: 5.0)
        rect = CGRect(x: 0.0, y: 0.0, width: 5.0, height: 5.0)
        
        convertToPoint = view.convert(point, toViewOrWindow: nil)
        convertToRect = view.convert(rect, toViewOrWindow: nil)
        convertFromPoint = view.convert(point, fromViewOrWindow: nil)
        convertFromRect = view.convert(rect, fromViewOrWindow: nil)
        
        XCTAssertEqual(convertToPoint, point)
        XCTAssertEqual(convertToRect, rect)
        XCTAssertEqual(convertFromPoint, point)
        XCTAssertEqual(convertFromRect, rect)
        
        convertToPoint = view.convert(point, toViewOrWindow: view)
        convertToRect = view.convert(rect, toViewOrWindow: view)
        convertFromPoint = view.convert(point, fromViewOrWindow: view)
        convertFromRect = view.convert(rect, fromViewOrWindow: view)
        
        XCTAssertEqual(convertToPoint, point)
        XCTAssertEqual(convertToRect, rect)
        XCTAssertEqual(convertFromPoint, point)
        XCTAssertEqual(convertFromRect, rect)
        
        convertToPoint = view.convert(point, toViewOrWindow: window)
        convertToRect = view.convert(rect, toViewOrWindow: window)
        convertFromPoint = view.convert(point, fromViewOrWindow: window)
        convertFromRect = view.convert(rect, fromViewOrWindow: window)
        
        XCTAssertEqual(convertToPoint, CGPoint(x: 35.0, y: 35.0))
        XCTAssertEqual(convertToRect, CGRect(x: 30.0, y: 30.0, width: 5.0, height: 5.0))
        XCTAssertEqual(convertFromPoint, CGPoint(x: -25.0, y: -25.0))
        XCTAssertEqual(convertFromRect, CGRect(x: -30.0, y: -30.0, width: 5.0, height: 5.0))
        
        let otherWindow = UIWindow(frame: CGRect(x: 20.0, y: 20.0, width: 100.0, height: 100.0))
        otherWindow.addSubview(view)
        
        convertToPoint = view.convert(point, toViewOrWindow: window)
        convertToRect = view.convert(rect, toViewOrWindow: window)
        convertFromPoint = view.convert(point, fromViewOrWindow: window)
        convertFromRect = view.convert(rect, fromViewOrWindow: window)
        
        XCTAssertEqual(convertToPoint, CGPoint(x: 5.0, y: 5.0))
        XCTAssertEqual(convertToRect, CGRect(x: 0.0, y: 0.0, width: 5.0, height: 5.0))
        XCTAssertEqual(convertFromPoint, CGPoint(x: -25.0, y: -25.0))
        XCTAssertEqual(convertFromRect, CGRect(x: -30.0, y: -30.0, width: 5.0, height: 5.0))
    }
}
