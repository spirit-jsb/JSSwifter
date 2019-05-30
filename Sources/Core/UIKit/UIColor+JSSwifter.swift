//
//  UIColor+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/14.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UIColor {
    
    // MARK:
    
    /// 随机颜色
    static var random: UIColor {
        let red = Int.random(in: 0...255)
        let green = Int.random(in: 0...255)
        let blue = Int.random(in: 0...255)
        return UIColor(red: red, green: green, blue: blue)!
    }
    
    /// RGBA 颜色组件，(0.0~1.0)
    ///
    /// http://colorizer.org/
    ///
    var rgbaComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// HSBA 颜色组件，(0.0~1.0)
    ///
    /// http://colorizer.org/
    ///
    var hsbaComponents: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        return (hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    /// CMKYA 颜色组件，(0.0~1.0)
    ///
    /// http://colorizer.org/
    ///
    var cmykaComponents: (cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, black: CGFloat, alpha: CGFloat) {
        var cyan: CGFloat = 0.0
        var magenta: CGFloat = 0.0
        var yellow: CGFloat = 0.0
        var black: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        self.getCyan(&cyan, magenta: &magenta, yellow: &yellow, black: &black, alpha: &alpha)
        
        return (cyan: cyan, magenta: magenta, yellow: yellow, black: black, alpha: alpha)
    }
    
    /// 指定 UIColor 的十六进制字符串
    var hexString: String {
        let components: [Int] = {
            let comps = self.cgColor.components!
            let components = comps.count == 4 ? comps : [comps[0], comps[0], comps[0], comps[1]]
            return components.map { Int($0 * 255.0) }
        }()
        return String(format: "#%02X%02X%02X", components[0], components[1], components[2])
    }
    
    /// 指定 UIColor 的短十六进制字符串
    var shortHexString: String? {
        let string = self.hexString.replacingOccurrences(of: "#", with: "")
        let chrs = Array(string)
        guard chrs[0] == chrs[1], chrs[2] == chrs[3], chrs[4] == chrs[5] else {
            return nil
        }
        return "#\(chrs[0])\(chrs[2])\(chrs[4])"
    }
    
    /// 指定 UIColor 的透明度
    var alpha: CGFloat {
        return self.cgColor.alpha
    }
    
    /// 指定 UIColor 的 UInt 值
    var uInt: UInt {
        let components: [CGFloat] = {
            let comps = self.cgColor.components!
            return comps.count == 4 ? comps : [comps[0], comps[0], comps[0], comps[1]]
        }()
        
        var colorAsUInt32: UInt32 = 0
        colorAsUInt32 += UInt32(components[0] * 255.0) << 16
        colorAsUInt32 += UInt32(components[1] * 255.0) << 8
        colorAsUInt32 += UInt32(components[2] * 255.0)
        
        return UInt(colorAsUInt32)
    }
    
    /// 指定 UIColor 的互补颜色
    var complementary: UIColor? {
        let colorSpaceRGB = CGColorSpaceCreateDeviceRGB()
        let convertColorToRGBSpace: ((_ color: UIColor) -> UIColor?) = { (color) -> UIColor? in
            if self.cgColor.colorSpace!.model == CGColorSpaceModel.monochrome {
                let oldComponents = color.cgColor.components
                let components: [CGFloat] = [oldComponents![0], oldComponents![0], oldComponents![0], oldComponents![1]]
                let colorRef = CGColor(colorSpace: colorSpaceRGB, components: components)
                let colorOut = UIColor(cgColor: colorRef!)
                return colorOut
            }
            else {
                return self
            }
        }
        
        let color = convertColorToRGBSpace(self)
        guard let componentColors = color?.cgColor.components else { return nil }
        
        let red: CGFloat   = sqrt(pow(255.0, 2.0) - pow((componentColors[0] * 255.0), 2.0)) / 255.0
        let green: CGFloat = sqrt(pow(255.0, 2.0) - pow((componentColors[1] * 255.0), 2.0)) / 255.0
        let blue: CGFloat  = sqrt(pow(255.0, 2.0) - pow((componentColors[2] * 255.0), 2.0)) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    // MARK:
    
    /// 依照 RGB 颜色空间和可选透明度数值初始化可选颜色
    ///
    /// - Parameters:
    ///   - red: Red 组件(0~255)
    ///   - green: Green 组件(0~255)
    ///   - blue: Blue 组件(0~255)
    ///   - transparency: 可选透明度，默认值为 1.0
    convenience init?(red: Int, green: Int, blue: Int, transparency: CGFloat = 1.0) {
        guard red >= 0 && red <= 255 else { return nil }
        guard green >= 0 && green <= 255 else { return nil }
        guard blue >= 0 && blue <= 255 else { return nil }
        
        var trans = transparency
        if trans < 0.0 { trans = 0.0 }
        if trans > 1.0 { trans = 1.0 }
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: trans)
    }
    
    /// 依照 CMYB 颜色空间和可选透明度数值初始化可选颜色
    ///
    /// - Parameters:
    ///   - cyan: Cyan 组件(0.0~1.0)
    ///   - magenta: Magenta 组件(0.0~1.0)
    ///   - yellow: Yellow 组件(0.0~1.0)
    ///   - black: Black 组件(0.0~1.0)
    ///   - transparency: 可选透明度，默认值为 1.0
    convenience init?(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, black: CGFloat, transparency: CGFloat = 1.0) {
        guard cyan >= 0.0 && cyan <= 1.0 else { return nil }
        guard magenta >= 0.0 && magenta <= 1.0 else { return nil }
        guard yellow >= 0.0 && yellow <= 1.0 else { return nil }
        guard black >= 0.0 && black <= 1.0 else { return nil }
        
        var trans = transparency
        if trans < 0.0 { trans = 0.0 }
        if trans > 1.0 { trans = 1.0 }
        
        let red: CGFloat = (1.0 - cyan) * (1.0 - black)
        let green: CGFloat = (1.0 - magenta) * (1.0 - black)
        let blue: CGFloat = (1.0 - yellow) * (1.0 - black)
        
        self.init(red: red, green: green, blue: blue, alpha: trans)
    }
    
    /// 依照十六进制数字和可选透明度数值初始化可选颜色
    ///
    /// - Parameters:
    ///   - hex: 十六进制数字，例如：0xDECEB5
    ///   - transparency: 可选透明度，默认值为 1.0
    convenience init?(hex: Int, transparency: CGFloat = 1.0) {
        var trans = transparency
        if trans < 0.0 { trans = 0.0 }
        if trans > 1.0 { trans = 1.0 }
        
        let red = (hex >> 16) & 0xFF
        let green = (hex >> 8) & 0xFF
        let blue = hex & 0xFF
        
        self.init(red: red, green: green, blue: blue, transparency: trans)
    }
    
    /// 依照十六进制字符串和可选透明度数值初始化可选颜色
    ///
    /// - Parameters:
    ///   - hexString: 十六进制字符串，例如："0xDECEB5"
    ///   - transparency: 可选透明度，默认值为 1.0
    convenience init?(hexString: String, transparency: CGFloat = 1.0) {
        var string = ""
        if hexString.lowercased().hasPrefix("0x") {
            string = hexString.replacingOccurrences(of: "0x", with: "")
        }
        else if hexString.hasPrefix("#") {
            string = hexString.replacingOccurrences(of: "#", with: "")
        }
        else {
            string = hexString
        }
        
        if string.count == 3 {
            var str = ""
            string.forEach { str.append(String(repeating: String($0), count: 2)) }
            string = str
        }
        
        guard let hexValue = Int(string, radix: 16) else {
            return nil
        }
        
        var trans = transparency
        if trans < 0.0 { trans = 0.0 }
        if trans > 1.0 { trans = 1.0 }
        
        let red = (hexValue >> 16) & 0xFF
        let green = (hexValue >> 8) & 0xFF
        let blue = hexValue & 0xFF
        
        self.init(red: red, green: green, blue: blue, transparency: trans)
    }
    
    /// 依据给定 UIColor 初始化可选互补颜色
    convenience init?(complementaryFor color: UIColor) {
        let colorSpaceRGB = CGColorSpaceCreateDeviceRGB()
        let convertColorToRGBSpace: ((_ color: UIColor) -> UIColor?) = { (color) -> UIColor? in
            if color.cgColor.colorSpace!.model == CGColorSpaceModel.monochrome {
                let oldComponents = color.cgColor.components
                let components: [CGFloat] = [oldComponents![0], oldComponents![0], oldComponents![0], oldComponents![1]]
                let colorRef = CGColor(colorSpace: colorSpaceRGB, components: components)
                let colorOut = UIColor(cgColor: colorRef!)
                return colorOut
            }
            else {
                return color
            }
        }
        
        let color = convertColorToRGBSpace(color)
        guard let componentColors = color?.cgColor.components else { return nil }
        
        let red: CGFloat   = sqrt(pow(255.0, 2.0) - pow((componentColors[0] * 255.0), 2.0)) / 255.0
        let green: CGFloat = sqrt(pow(255.0, 2.0) - pow((componentColors[1] * 255.0), 2.0)) / 255.0
        let blue: CGFloat  = sqrt(pow(255.0, 2.0) - pow((componentColors[2] * 255.0), 2.0)) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    // MARK:
    
    /// 将两给定 UIColor 混合
    ///
    /// - Parameters:
    ///   - color1: 第一个混合颜色
    ///   - intensity1: 第一个混合颜色所占比重，默认值为 0.5
    ///   - color2: 第二个混合颜色
    ///   - intensity2: 第二个混合颜色所占比重，默认值为 0.5
    /// - Returns: 返回混合后的颜色
    static func blend(_ color1: UIColor, intensity1: CGFloat = 0.5, with color2: UIColor, intensity2: CGFloat = 0.5) -> UIColor {
        let total = intensity1 + intensity2
        let level1 = intensity1 / total
        let level2 = intensity2 / total
        
        guard level1 > 0.0 else { return color2 }
        guard level2 > 0.0 else { return color1 }
        
        let components1: [CGFloat] = {
            let comps = color1.cgColor.components!
            return comps.count == 4 ? comps : [comps[0], comps[0], comps[0], comps[1]]
        }()
        let components2: [CGFloat] = {
            let comps = color2.cgColor.components!
            return comps.count == 4 ? comps : [comps[0], comps[0], comps[0], comps[1]]
        }()
        
        let red1 = components1[0]
        let red2 = components2[0]
        
        let green1 = components1[1]
        let green2 = components2[1]
        
        let blue1 = components1[2]
        let blue2 = components2[2]
        
        let alpha1 = color1.cgColor.alpha
        let alpha2 = color2.cgColor.alpha
        
        let red = level1 * red1 + level2 * red2
        let green = level1 * green1 + level2 * green2
        let blue = level1 * blue1 + level2 * blue2
        let alpha = level1 * alpha1 + level2 * alpha2
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// 将指定 UIColor 变亮
    ///
    /// - Parameter percentage: 增亮程度，默认值为 0.2
    /// - Returns: 返回增亮后的颜色
    func lighten(by percentage: CGFloat = 0.2) -> UIColor {
        var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 0.0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        red = min(red + percentage, 1.0)
        green = min(green + percentage, 1.0)
        blue = min(blue + percentage, 1.0)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// 将指定 UIColor 变暗
    ///
    /// - Parameter percentage: 增暗程度，默认值为 0.2
    /// - Returns: 返回增暗后的颜色
    func darken(by percentage: CGFloat = 0.2) -> UIColor {
        var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 0.0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        red = max(red - percentage, 0.0)
        green = max(green - percentage, 0.0)
        blue = max(blue - percentage, 0.0)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// 返回 CMKY 颜色空间中的颜色组件
    @discardableResult
    func getCyan(_ cyan: UnsafeMutablePointer<CGFloat>?, magenta: UnsafeMutablePointer<CGFloat>?, yellow: UnsafeMutablePointer<CGFloat>?, black: UnsafeMutablePointer<CGFloat>?, alpha: UnsafeMutablePointer<CGFloat>?) -> Bool {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        
        guard self.getRed(&r, green: &g, blue: &b, alpha: &a) else {
            return false
        }
        
        var c: CGFloat = 1.0 - r
        var m: CGFloat = 1.0 - g
        var y: CGFloat = 1.0 - b
        
        let k: CGFloat = min(c, min(m, y))
        
        c = k == 1.0 ? 0.0 : (c - k) / (1 - k)
        m = k == 1.0 ? 0.0 : (m - k) / (1 - k)
        y = k == 1.0 ? 0.0 : (y - k) / (1 - k)

        cyan?.initialize(to: c)
        magenta?.initialize(to: m)
        yellow?.initialize(to: y)
        black?.initialize(to: k)
        alpha?.initialize(to: a)
        
        return true
    }
}
