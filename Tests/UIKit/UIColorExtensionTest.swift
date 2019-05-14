//
//  UIColorExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/14.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest

class UIColorExtensionTest: XCTestCase {

    func test_random() {
        let color1 = UIColor.random
        let color2 = UIColor.random
        
        XCTAssertNotEqual(color1, color2)
    }
    
    func test_rgba_components() {
        XCTAssertEqual(UIColor.red.rgbaComponents.red, 1.0)
        XCTAssertEqual(UIColor.red.rgbaComponents.green, 0.0)
        XCTAssertEqual(UIColor.red.rgbaComponents.blue, 0.0)
        XCTAssertEqual(UIColor.red.rgbaComponents.alpha, 1.0)
        
        XCTAssertEqual(UIColor.green.rgbaComponents.red, 0.0)
        XCTAssertEqual(UIColor.green.rgbaComponents.green, 1.0)
        XCTAssertEqual(UIColor.green.rgbaComponents.blue, 0.0)
        XCTAssertEqual(UIColor.green.rgbaComponents.alpha, 1.0)
        
        XCTAssertEqual(UIColor.blue.rgbaComponents.red, 0.0)
        XCTAssertEqual(UIColor.blue.rgbaComponents.green, 0.0)
        XCTAssertEqual(UIColor.blue.rgbaComponents.blue, 1.0)
        XCTAssertEqual(UIColor.blue.rgbaComponents.alpha, 1.0)
        
        XCTAssertEqual(UIColor.white.rgbaComponents.red, 1.0)
        XCTAssertEqual(UIColor.white.rgbaComponents.green, 1.0)
        XCTAssertEqual(UIColor.white.rgbaComponents.blue, 1.0)
        XCTAssertEqual(UIColor.white.rgbaComponents.alpha, 1.0)
        
        XCTAssertEqual(UIColor.black.rgbaComponents.red, 0.0)
        XCTAssertEqual(UIColor.black.rgbaComponents.green, 0.0)
        XCTAssertEqual(UIColor.black.rgbaComponents.blue, 0.0)
        XCTAssertEqual(UIColor.black.rgbaComponents.alpha, 1.0)
        
        XCTAssertEqual(Int(UIColor(hex: 0x12FFFF)!.rgbaComponents.red * 255.0), 0x12)
        XCTAssertEqual(Int(UIColor(hex: 0x12FFFF)!.rgbaComponents.green * 255.0), 0xFF)
        XCTAssertEqual(Int(UIColor(hex: 0x12FFFF)!.rgbaComponents.blue * 255.0), 0xFF)
        XCTAssertEqual(UIColor(hex: 0x12FFFF)!.rgbaComponents.alpha, 1.0)
        
        XCTAssertEqual(Int(UIColor(hex: 0x282B35)!.withAlphaComponent(0.4).rgbaComponents.red * 255.0), 0x28)
        XCTAssertEqual(Int(UIColor(hex: 0x282B35)!.withAlphaComponent(0.4).rgbaComponents.green * 255.0), 0x2B)
        XCTAssertEqual(Int(UIColor(hex: 0x282B35)!.withAlphaComponent(0.4).rgbaComponents.blue * 255.0), 0x35)
        XCTAssertEqual(UIColor(hex: 0x282B35)!.withAlphaComponent(0.4).rgbaComponents.alpha, 0.4)
    }
    
    func test_hsba_components() {
        var color = UIColor(hex: 0x00FF00, transparency: 1.0)!
        XCTAssertEqual(CGFloat(round(1000.0 * color.hsbaComponents.hue) / 1000.0), CGFloat(round(1000.0 * (120.0 / 360.0)) / 1000.0))
        XCTAssertEqual(color.hsbaComponents.saturation, 1.0)
        XCTAssertEqual(color.hsbaComponents.brightness, 1.0)
        
        color = UIColor(hex: 0x0000FF, transparency: 1.0)!
        XCTAssertEqual(CGFloat(round(1000.0 * color.hsbaComponents.hue) / 1000.0), CGFloat(round(1000.0 * (240.0 / 360.0)) / 1000.0))
        XCTAssertEqual(color.hsbaComponents.saturation, 1.0)
        XCTAssertEqual(color.hsbaComponents.brightness, 1.0)
        
        color = UIColor(hex: 0x000000, transparency: 1.0)!
        XCTAssertEqual(color.hsbaComponents.hue, 0.0)
        XCTAssertEqual(color.hsbaComponents.saturation, 0.0)
        XCTAssertEqual(color.hsbaComponents.brightness, 0.0)
        
        color = UIColor(hex: 0xFFFFFF, transparency: 1.0)!
        XCTAssertEqual(color.hsbaComponents.hue, 0.0)
        XCTAssertEqual(color.hsbaComponents.saturation, 0.0)
        XCTAssertEqual(color.hsbaComponents.brightness, 1.0)
        
        color = UIColor(hex: 0x123456, transparency: 1.0)!
        XCTAssertEqual(CGFloat(round(1000.0 * color.hsbaComponents.hue) / 1000.0), CGFloat(round(1000.0 * (210.0 / 360.0)) / 1000.0))
        XCTAssertEqual((color.hsbaComponents.saturation * 100.0).rounded(), 79.0)
        XCTAssertEqual((color.hsbaComponents.brightness * 100.0).rounded(), 34.0)
        
        color = UIColor(hex: 0xFCA864, transparency: 1.0)!
        XCTAssertEqual(CGFloat(round(1000.0 * color.hsbaComponents.hue) / 1000.0), CGFloat(round(1000.0 * (27.0 / 360.0)) / 1000.0))
        XCTAssertEqual((color.hsbaComponents.saturation * 100.0).rounded(), 60.0)
        XCTAssertEqual((color.hsbaComponents.brightness * 100.0).rounded(), 99.0)
        
        color = UIColor(hex: 0x1F2D3C, transparency: 1.0)!
        XCTAssertEqual(CGFloat(round(1000.0 * color.hsbaComponents.hue) / 1000.0), CGFloat(round(1000.0 * (211.0 / 360.0)) / 1000.0))
        XCTAssertEqual((color.hsbaComponents.saturation * 100.0).rounded(), 48.0)
        XCTAssertEqual((color.hsbaComponents.brightness * 100.0).rounded(), 24.0)
        
        color = UIColor(hex: 0xF9BD2F, transparency: 0.3)!
        XCTAssertEqual(CGFloat(round(1000.0 * color.hsbaComponents.hue) / 1000.0), CGFloat(round(1000.0 * (42.0 / 360.0)) / 1000.0))
        XCTAssertEqual((color.hsbaComponents.saturation * 100.0).rounded(), 81.0)
        XCTAssertEqual((color.hsbaComponents.brightness * 100.0).rounded(), 98.0)
        XCTAssertEqual(color.hsbaComponents.alpha, 0.3)
    }
    
    func test_cmyka_components() {
        var color = UIColor(hex: 0x00FF00, transparency: 1.0)!
        XCTAssertEqual((color.cmykaComponents.cyan * 100.0).rounded(), 100.0)
        XCTAssertEqual((color.cmykaComponents.magenta * 100.0).rounded(), 0.0)
        XCTAssertEqual((color.cmykaComponents.yellow * 100.0).rounded(), 100.0)
        XCTAssertEqual((color.cmykaComponents.black * 100.0).rounded(), 0.0)
        
        color = UIColor(hex: 0x0000FF, transparency: 1.0)!
        XCTAssertEqual((color.cmykaComponents.cyan * 100.0).rounded(), 100.0)
        XCTAssertEqual((color.cmykaComponents.magenta * 100.0).rounded(), 100.0)
        XCTAssertEqual((color.cmykaComponents.yellow * 100.0).rounded(), 0.0)
        XCTAssertEqual((color.cmykaComponents.black * 100.0).rounded(), 0.0)

        color = UIColor(hex: 0x000000, transparency: 1.0)!
        XCTAssertEqual((color.cmykaComponents.cyan * 100.0).rounded(), 0.0)
        XCTAssertEqual((color.cmykaComponents.magenta * 100.0).rounded(), 0.0)
        XCTAssertEqual((color.cmykaComponents.yellow * 100.0).rounded(), 0.0)
        XCTAssertEqual((color.cmykaComponents.black * 100.0).rounded(), 100.0)

        color = UIColor(hex: 0xFFFFFF, transparency: 1.0)!
        XCTAssertEqual((color.cmykaComponents.cyan * 100.0).rounded(), 0.0)
        XCTAssertEqual((color.cmykaComponents.magenta * 100.0).rounded(), 0.0)
        XCTAssertEqual((color.cmykaComponents.yellow * 100.0).rounded(), 0.0)
        XCTAssertEqual((color.cmykaComponents.black * 100.0).rounded(), 0.0)

        color = UIColor(hex: 0x123456, transparency: 1.0)!
        XCTAssertEqual((color.cmykaComponents.cyan * 100.0).rounded(), 79.0)
        XCTAssertEqual((color.cmykaComponents.magenta * 100.0).rounded(), 40.0)
        XCTAssertEqual((color.cmykaComponents.yellow * 100.0).rounded(), 0.0)
        XCTAssertEqual((color.cmykaComponents.black * 100.0).rounded(), 66.0)

        color = UIColor(hex: 0xFCA864, transparency: 1.0)!
        XCTAssertEqual((color.cmykaComponents.cyan * 100.0).rounded(), 0.0)
        XCTAssertEqual((color.cmykaComponents.magenta * 100.0).rounded(), 33.0)
        XCTAssertEqual((color.cmykaComponents.yellow * 100.0).rounded(), 60.0)
        XCTAssertEqual((color.cmykaComponents.black * 100.0).rounded(), 1.0)

        color = UIColor(hex: 0x1F2D3C, transparency: 1.0)!
        XCTAssertEqual((color.cmykaComponents.cyan * 100.0).rounded(), 48.0)
        XCTAssertEqual((color.cmykaComponents.magenta * 100.0).rounded(), 25.0)
        XCTAssertEqual((color.cmykaComponents.yellow * 100.0).rounded(), 0.0)
        XCTAssertEqual((color.cmykaComponents.black * 100.0).rounded(), 76.0)

        color = UIColor(hex: 0xF9BD2F, transparency: 0.3)!
        XCTAssertEqual((color.cmykaComponents.cyan * 100.0).rounded(), 0.0)
        XCTAssertEqual((color.cmykaComponents.magenta * 100.0).rounded(), 24.0)
        XCTAssertEqual((color.cmykaComponents.yellow * 100.0).rounded(), 81.0)
        XCTAssertEqual((color.cmykaComponents.black * 100.0).rounded(), 2.0)
        XCTAssertEqual(color.hsbaComponents.alpha, 0.3)
    }
    
    func test_hex_string() {
        var color = UIColor.red
        XCTAssertEqual(color.hexString, "#FF0000")
        
        color = UIColor.blue
        XCTAssertEqual(color.hexString, "#0000FF")
        
        color = UIColor(hex: 0xABCDEF)!
        XCTAssertEqual(color.hexString, "#ABCDEF")
        
        color = UIColor(hex: 0xABC)!
        XCTAssertEqual(color.hexString, "#000ABC")
        
        color = UIColor.black
        XCTAssertEqual(color.hexString, "#000000")
    }
    
    func test_short_hex_string() {
        var color: UIColor? = UIColor.red
        XCTAssertEqual(color?.shortHexString, "#F00")
        
        color = UIColor.blue
        XCTAssertEqual(color?.shortHexString, "#00F")
        
        color = UIColor(hexString: "#0F120F")
        XCTAssertNil(color?.shortHexString)
        
        color = UIColor(hexString: "#8FFFF")
        XCTAssertNil(color?.shortHexString)
    }
    
    func test_alpha() {
        var color = UIColor.red
        XCTAssertEqual(color.alpha, 1.0)
        
        color = UIColor.white.withAlphaComponent(0.5)
        XCTAssertEqual(color.alpha, 0.5)
        
        color = UIColor(red: 0, green: 0, blue: 0, transparency: 0.7)!
        XCTAssertEqual(color.alpha, 0.7)
        
        color = UIColor(red: 1, green: 1, blue: 1, transparency: 1.1)!
        XCTAssertEqual(color.alpha, 1.0)
    }
    
    func test_uInt() {
        var color = UIColor(hex: 0xFF0000, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0xFF0000)
        
        color = UIColor(hex: 0x00FF00, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0x00FF00)
        
        color = UIColor(hex: 0x0000FF, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0x0000FF)
        
        color = UIColor(hex: 0x000000, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0x000000)
        
        color = UIColor(hex: 0xFFFFFF, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0xFFFFFF)
        
        color = UIColor(hex: 0x123456, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0x123456)
        
        color = UIColor(hex: 0xFCA864, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0xFCA864)
        
        color = UIColor(hex: 0xFCA864, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0xFCA864)
        
        color = UIColor(hex: 0x1F2D3C, transparency: 1.0)
        XCTAssertEqual(color?.uInt, 0x1F2D3C)
    }
    
    func test_complementary() {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        
        var color = UIColor.black
        color.complementary?.getRed(&red, green: &green, blue: &blue, alpha: nil)
        XCTAssertEqual(red, 1.0)
        XCTAssertEqual(green, 1.0)
        XCTAssertEqual(blue, 1.0)
        
        color = UIColor.white
        color.complementary?.getRed(&red, green: &green, blue: &blue, alpha: nil)
        XCTAssertEqual(red, 0.0)
        XCTAssertEqual(green, 0.0)
        XCTAssertEqual(blue, 0.0)
        
        color = UIColor.red
        color.complementary?.getRed(&red, green: &green, blue: &blue, alpha: nil)
        XCTAssertEqual(red, 0.0)
        XCTAssertEqual(green, 1.0)
        XCTAssertEqual(blue, 1.0)
    }
    
    func test_initialize() {
        var color = UIColor(hex: 0xFFF)
        XCTAssertEqual(Int(color!.rgbaComponents.red * 255.0), 0)
        XCTAssertEqual(Int(color!.rgbaComponents.green * 255.0), 0xF)
        XCTAssertEqual(Int(color!.rgbaComponents.blue * 255.0), 0xFF)
        XCTAssertEqual(color?.rgbaComponents.alpha, 1.0)
        
        color = UIColor(hex: 0xFFFFFFF)
        XCTAssertEqual(Int(color!.rgbaComponents.red * 255.0), 0xFF)
        XCTAssertEqual(Int(color!.rgbaComponents.green * 255.0), 0xFF)
        XCTAssertEqual(Int(color!.rgbaComponents.blue * 255.0), 0xFF)
        XCTAssertEqual(color?.rgbaComponents.alpha, 1.0)
        
        color = UIColor(hex: 0x123456, transparency: 1.0)
        XCTAssertEqual(Int(color!.rgbaComponents.red * 255.0), 0x12)
        XCTAssertEqual(Int(color!.rgbaComponents.green * 255.0), 0x34)
        XCTAssertEqual(Int(color!.rgbaComponents.blue * 255.0), 0x56)
        XCTAssertEqual(color?.rgbaComponents.alpha, 1.0)
        
        color = UIColor(hexString: "0x123456", transparency: 1.0)
        XCTAssertEqual(Int(color!.rgbaComponents.red * 255.0), 0x12)
        XCTAssertEqual(Int(color!.rgbaComponents.green * 255.0), 0x34)
        XCTAssertEqual(Int(color!.rgbaComponents.blue * 255.0), 0x56)
        XCTAssertEqual(color?.rgbaComponents.alpha, 1.0)
        
        color = UIColor(hexString: "#999", transparency: 1.0)
        XCTAssertEqual(Int(color!.rgbaComponents.red * 255.0), 0x99)
        XCTAssertEqual(Int(color!.rgbaComponents.green * 255.0), 0x99)
        XCTAssertEqual(Int(color!.rgbaComponents.blue * 255.0), 0x99)
        XCTAssertEqual(color?.rgbaComponents.alpha, 1.0)
        
        color = UIColor(hex: 0x999, transparency: 2.0)
        XCTAssertEqual(Int(color!.rgbaComponents.red * 255.0), 0)
        XCTAssertEqual(Int(color!.rgbaComponents.green * 255.0), 0x09)
        XCTAssertEqual(Int(color!.rgbaComponents.blue * 255.0), 0x99)
        XCTAssertEqual(color?.alpha, 1.0)
        
        color = UIColor(hex: 0xaabbcc, transparency: 0.0)
        XCTAssertEqual(Int(color!.rgbaComponents.red * 255.0), 0xaa)
        XCTAssertEqual(Int(color!.rgbaComponents.green * 255.0), 0xbb)
        XCTAssertEqual(Int(color!.rgbaComponents.blue * 255.0), 0xCC)
        XCTAssertEqual(color?.alpha, 0.0)
        
        color = UIColor(hex: 0x1, transparency: 0.5)
        XCTAssertEqual(Int(color!.rgbaComponents.red * 255.0), 0)
        XCTAssertEqual(Int(color!.rgbaComponents.green * 255.0), 0)
        XCTAssertEqual(Int(color!.rgbaComponents.blue * 255.0), 0x1)
        XCTAssertEqual(color?.alpha, 0.5)
        
        color = UIColor(cyan: 1.0, magenta: 0.0, yellow: 0.0, black: 0.0)
        XCTAssertEqual(Int(color!.rgbaComponents.red * 255.0), 0)
        XCTAssertEqual(Int(color!.rgbaComponents.green * 255.0), 0xff)
        XCTAssertEqual(Int(color!.rgbaComponents.blue * 255.0), 0xff)
        XCTAssertEqual(color?.alpha, 1.0)
        
        color = UIColor(complementaryFor: UIColor.green)
        XCTAssertEqual(Int(color!.rgbaComponents.red * 255.0), 0xFF)
        XCTAssertEqual(Int(color!.rgbaComponents.green * 255.0), 0)
        XCTAssertEqual(Int(color!.rgbaComponents.blue * 255.0), 0xff)
        XCTAssertEqual(color?.alpha, 1.0)
        
        let color1 = UIColor(hex: 0xFFF, transparency: -0.4)
        let color2 = UIColor(hex: 0xFFF, transparency: 0)
        XCTAssertEqual(color1, color2)
        
        let color3 = UIColor(hex: 0xFFF, transparency: 1.5)
        let color4 = UIColor(hex: 0xFFF, transparency: 1)
        XCTAssertEqual(color3, color4)
    }
    
    func test_blend() {
        var color1 = UIColor.white
        var color2 = UIColor.black
        
        var blendColor = UIColor.blend(color1, with: color2)
        XCTAssertEqual(Int(blendColor.rgbaComponents.red * 255.0), 0xFF / 2)
        XCTAssertEqual(Int(blendColor.rgbaComponents.green * 255.0), 0xFF / 2)
        XCTAssertEqual(Int(blendColor.rgbaComponents.blue * 255.0), 0xFF / 2)
        
        color1 = UIColor(hex: 0x123456, transparency: 0.5)!
        color2 = UIColor(hex: 0x665544, transparency: 0.7)!
        
        blendColor = UIColor.blend(color1, with: color2)
        XCTAssertEqual(Int(blendColor.rgbaComponents.red * 255.0), (0x12 + 0x66) / 2)
        XCTAssertEqual(Int(blendColor.rgbaComponents.green * 255.0), (0x34 + 0x55) / 2)
        XCTAssertEqual(Int(blendColor.rgbaComponents.blue * 255.0), (0x56 + 0x44) / 2)
        XCTAssertEqual(blendColor.rgbaComponents.alpha, (0.7 + 0.5) / 2.0)
        
        blendColor = UIColor.blend(color1, intensity1: 0.7, with: color2, intensity2: 0.3)
        var output: CGFloat = 0x12 * 0.7 + 0x66 * 0.3
        XCTAssertEqual(Int(blendColor.rgbaComponents.red * 255.0), Int(output))
        output = 0x34 * 0.7 + 0x55 * 0.3
        XCTAssertEqual(Int(blendColor.rgbaComponents.green * 255.0), Int(output))
        output = 0x56 * 0.7 + 0x44 * 0.3
        XCTAssertEqual(Int(blendColor.rgbaComponents.blue * 255.0), Int(output))
        output = 0.5 * 0.7 + 0.7 * 0.3
        XCTAssertEqual(blendColor.rgbaComponents.alpha, output)
        
        blendColor = UIColor.blend(color1, intensity1: 0.0, with: color2, intensity2: 0.3)
        XCTAssertEqual(blendColor, color2)

        blendColor = UIColor.blend(color1, intensity1: 1.0, with: color2, intensity2: 0.0)
        XCTAssertEqual(blendColor, color1)
    }
    
    func test_lighten() {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        
        var lightRed: CGFloat = 0.0
        var lightGreen: CGFloat = 0.0
        var lightBlue: CGFloat = 0.0
        
        let color = UIColor.red
        color.getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        let lightenColor = color.lighten(by: 0.3)
        lightenColor.getRed(&lightRed, green: &lightGreen, blue: &lightBlue, alpha: nil)
        
        XCTAssertEqual(lightRed, min(red + 0.3, 1.0))
        XCTAssertEqual(lightGreen, min(green + 0.3, 1.0))
        XCTAssertEqual(lightBlue, min(blue + 0.3, 1.0))
    }
    
    func test_darken() {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        
        var darkRed: CGFloat = 0.0
        var darkGreen: CGFloat = 0.0
        var darkBlue: CGFloat = 0.0
        
        let color = UIColor.red
        color.getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        let darkenColor = color.darken(by: 0.3)
        darkenColor.getRed(&darkRed, green: &darkGreen, blue: &darkBlue, alpha: nil)
        
        XCTAssertEqual(darkRed, max(red - 0.3, 0.0))
        XCTAssertEqual(darkGreen, max(green - 0.3, 0.0))
        XCTAssertEqual(darkBlue, max(blue - 0.3, 0.0))
    }
    
    func test_get_cyan() {
        var cyan: CGFloat = 0.0
        var magenta: CGFloat = 0.0
        var yellow: CGFloat = 0.0
        var black: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        let color: UIColor = UIColor(cyan: 0.3, magenta: 1.0, yellow: 0.0, black: 0.8)!
        XCTAssertTrue(color.getCyan(&cyan, magenta: &magenta, yellow: &yellow, black: &black, alpha: &alpha))
        XCTAssertEqual((cyan * 100.0).rounded(), 30.0)
        XCTAssertEqual((magenta * 100.0).rounded(), 100.0)
        XCTAssertEqual((yellow * 100.0).rounded(), 0.0)
        XCTAssertEqual((black * 100.0).rounded(), 80.0)
        XCTAssertEqual(alpha, 1.0)
    }
}

/**


// MARK: - Test methods
func testBlend() {

    
    blendColor = Color.blend(color1, intensity1: 0.7, with: color2, intensity2: 0.3)
    var output: Double = 0x12 * 0.7 + 0x66 * 0.3
    XCTAssertEqual(blendColor.rgbComponents.red, Int(output))
    output = 0x34 * 0.7 + 0x55 * 0.3
    XCTAssertEqual(blendColor.rgbComponents.green, Int(output))
    output = 0x56 * 0.7 + 0x44 * 0.3
    XCTAssertEqual(blendColor.rgbComponents.blue, Int(output))
    output = 0.5 * 0.7 + 0.7 * 0.3
    XCTAssertEqual(blendColor.alpha, CGFloat(output))
    
    blendColor = Color.blend(color1, intensity1: 0.0, with: color2, intensity2: 0.3)
    output = (0x12 * 0.0 + 0x66 * 0.3) / 0.3
    XCTAssertEqual(blendColor.rgbComponents.red, Int(output))
    output = (0x34 * 0.0 + 0x55 * 0.3) / 0.3
    XCTAssertEqual(blendColor.rgbComponents.green, Int(output))
    output = (0x56 * 0.0 + 0x44 * 0.3) / 0.3
    XCTAssertEqual(blendColor.rgbComponents.blue, Int(output))
    output = (0.5 * 0.0 + 0.7 * 0.3 / 0.3)
    XCTAssertEqual(blendColor.alpha, CGFloat(output))
    
    blendColor = Color.blend(color1, intensity1: 1.0, with: color2, intensity2: 0.0)
    XCTAssertEqual(blendColor, color1)
}
 
*/
