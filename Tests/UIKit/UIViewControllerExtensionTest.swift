//
//  UIViewControllerExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/21.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class UIViewControllerExtensionTest: XCTestCase {

    class MockNotificationViewController: UIViewController {
        
        var notificationFired: Bool = false
        
        @objc func testSelector() {
            self.notificationFired = true
        }
    }
    
    let notificationIdentifier = Notification.Name("MockNotification")
    
    func test_is_visible() {
        let viewController = UIViewController()
        XCTAssertFalse(viewController.isVisible)
    }
    
    func test_add_notification_observer() {
        let viewController = MockNotificationViewController()
        let selector = #selector(MockNotificationViewController.testSelector)
        viewController.addNotificationObserver(name: self.notificationIdentifier, selector: selector)
        NotificationCenter.default.post(name: self.notificationIdentifier, object: nil)
        XCTAssertTrue(viewController.notificationFired)
    }
    
    func test_remove_notification_observer() {
        let viewController = MockNotificationViewController()
        let selector = #selector(MockNotificationViewController.testSelector)
        viewController.addNotificationObserver(name: self.notificationIdentifier, selector: selector)
        viewController.removeNotificationObserver(name: self.notificationIdentifier)
        NotificationCenter.default.post(name: self.notificationIdentifier, object: nil)
        XCTAssertFalse(viewController.notificationFired)
    }
    
    func test_remove_notifications_observer() {
        let viewController = MockNotificationViewController()
        let selector = #selector(MockNotificationViewController.testSelector)
        viewController.addNotificationObserver(name: self.notificationIdentifier, selector: selector)
        viewController.removeNotificationsObserver()
        NotificationCenter.default.post(name: self.notificationIdentifier, object: nil)
        XCTAssertFalse(viewController.notificationFired)
    }
}
