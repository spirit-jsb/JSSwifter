//
//  UIImageExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/23.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class UIImageExtensionTest: XCTestCase {
    
    func test_bytes() {
        let image = UIImage(named: "test", in: Bundle(for: UIImageExtensionTest.self), compatibleWith: nil)!
        XCTAssertEqual(image.bytes, 85230)
    }
    
    func test_kilobytes() {
        let image = UIImage(named: "test", in: Bundle(for: UIImageExtensionTest.self), compatibleWith: nil)!
        XCTAssertEqual(image.kilobytes, 83)
    }
    
    func test_original() {
        let image = UIImage(color: .blue, size: CGSize(width: 20.0, height: 20.0))
        XCTAssertEqual(image.original, image.withRenderingMode(.alwaysOriginal))
    }
    
    func test_template() {
        let image = UIImage(color: .blue, size: CGSize(width: 20.0, height: 20.0))
        XCTAssertEqual(image.template, image.withRenderingMode(.alwaysTemplate))
    }

    func test_cropped() {
        let image = UIImage(color: UIColor.red, size: CGSize(width: 20.0, height: 20.0))
        var cropped = image.cropped(to: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
        XCTAssertEqual(cropped, image)
        cropped = image.cropped(to: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
        let small = UIImage(color: UIColor.red, size: CGSize(width: 10.0, height: 10.0))
        XCTAssertEqual(cropped.jpegData(compressionQuality: 1.0)?.count, small.jpegData(compressionQuality: 1.0)?.count)
        XCTAssertEqual(cropped.size, small.size)
    }
    
    func test_scaled_to_height() {
        let image = UIImage(named: "test", in: Bundle(for: UIImageExtensionTest.self), compatibleWith: nil)!
        let scaledImage = image.scaled(toHeight: 200.0)
        XCTAssertNotNil(scaledImage)
        XCTAssertEqual(scaledImage!.size.height, 200.0, accuracy: 0.1)
    }
    
    func test_scaled_to_width() {
        let image = UIImage(named: "test", in: Bundle(for: UIImageExtensionTest.self), compatibleWith: nil)!
        let scaledImage = image.scaled(toWidth: 300.0)
        XCTAssertNotNil(scaledImage)
        XCTAssertEqual(scaledImage!.size.width, 300.0, accuracy: 0.1)
    }
    
    @available(iOS 10.0, *)
    func test_rotated_by_angle() {
        let image = UIImage(named: "test", in: Bundle(for: UIImageExtensionTest.self), compatibleWith: nil)!
        let rotatedImage1 = image.rotated(by: Measurement<UnitAngle>.init(value: 90.0, unit: .degrees))
        XCTAssertNotNil(rotatedImage1)
        XCTAssertEqual(rotatedImage1!.size, CGSize(width: image.size.height, height: image.size.width))
        XCTAssertNotEqual(rotatedImage1!.jpegData(compressionQuality: 1.0), image.jpegData(compressionQuality: 1.0))
        
        let rotatedImage2 = image.rotated(by: Measurement<UnitAngle>.init(value: 180.0, unit: .degrees))
        XCTAssertNotNil(rotatedImage2)
        XCTAssertEqual(rotatedImage2!.size, CGSize(width: image.size.width, height: image.size.height))
        XCTAssertNotEqual(rotatedImage2!.jpegData(compressionQuality: 1.0), image.jpegData(compressionQuality: 1.0))
    }
    
    func test_rotated_by_radians() {
        let image = UIImage(named: "test", in: Bundle(for: UIImageExtensionTest.self), compatibleWith: nil)!
        let rotatedImage1 = image.rotated(by: .pi / 2.0)
        XCTAssertNotNil(rotatedImage1)
        XCTAssertEqual(rotatedImage1!.size, CGSize(width: image.size.height, height: image.size.width))
        XCTAssertNotEqual(rotatedImage1!.jpegData(compressionQuality: 1.0), image.jpegData(compressionQuality: 1.0))
        
        let rotatedImage2 = image.rotated(by: .pi)
        XCTAssertNotNil(rotatedImage2)
        XCTAssertEqual(rotatedImage2!.size, CGSize(width: image.size.width, height: image.size.height))
        XCTAssertNotEqual(rotatedImage2!.jpegData(compressionQuality: 1.0), image.jpegData(compressionQuality: 1.0))
    }
    
    func test_filled() {
        let image1 = UIImage(color: UIColor.black, size: CGSize(width: 20.0, height: 20.0))
        let image2 = UIImage(color: UIColor.yellow, size: CGSize(width: 20.0, height: 20.0))
        
        XCTAssertEqual(image1.filled(UIColor.yellow).jpegData(compressionQuality: 1.0), image2.jpegData(compressionQuality: 1.0))
        
        var emptyImage = UIImage()
        var filledImage = emptyImage.filled(UIColor.red)
        XCTAssertEqual(emptyImage, filledImage)
        
        emptyImage = UIImage(color: UIColor.yellow, size: .zero)
        filledImage = emptyImage.filled(UIColor.red)
        XCTAssertEqual(emptyImage, filledImage)
    }
    
    func test_tint() {
        let image = UIImage(color: UIColor.white, size: CGSize(width: 20.0, height: 20.0))
        let tintedImage = image.tint(.black, blendMode: .overlay)
        let testImage = UIImage(color: .black, size: CGSize(width: 20.0, height: 20.0))
        XCTAssertEqual(tintedImage.jpegData(compressionQuality: 1.0), testImage.jpegData(compressionQuality: 1.0))
    }
    
    func test_with_rounded_corners() {
        let image = UIImage(color: .purple, size: CGSize(width: 20.0, height: 20.0))
        XCTAssertNotNil(image.withRoundedCorners())
        XCTAssertNotNil(image.withRoundedCorners(radius: 5.0))
        XCTAssertNotNil(image.withRoundedCorners(radius: -10.0))
        XCTAssertNotNil(image.withRoundedCorners(radius: 30.0))
    }
}
