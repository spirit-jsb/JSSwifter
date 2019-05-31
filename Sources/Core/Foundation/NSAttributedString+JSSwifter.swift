//
//  NSAttributedString+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/27.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    
    // MARK:
    
    /// Bolded String
    var bolded: NSAttributedString {
        return self.applying(attributes: [.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// Italicized String
    var italicized: NSAttributedString {
        return self.applying(attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// Underlined String
    var underlined: NSAttributedString {
        return self.applying(attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    /// Strikethrough String
    var strikethrough: NSAttributedString {
        return self.applying(attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
    }
    
    /// 应用于指定 NSAttributedString 的属性列表
    var attributes: [NSAttributedString.Key: Any] {
        guard self.length > 0 else { return [:] }
        return self.attributes(at: 0, effectiveRange: nil)
    }
    
    // MARK:
    
    /// 向指定 NSAttributedString 添加颜色
    ///
    /// - Parameter color: 文本颜色
    /// - Returns: 返回用给定文本颜色着色的 NSAttributedString
    func colored(with color: UIColor) -> NSAttributedString {
        return self.applying(attributes: [.foregroundColor: color])
    }
    
    /// 向指定 NSAttributedString 中依据正则表达式匹配的子 NSAttributedString 中的 attributes 中添加给定 attributes，并返回添加后的结果
    ///
    /// - Parameters:
    ///   - attributes: attributes
    ///   - pattern: 用于目标匹配的正则表达式
    func applying(attributes: [NSAttributedString.Key: Any], toRangesMatching pattern: String) -> NSAttributedString {
        guard let pattern = try? NSRegularExpression(pattern: pattern, options: []) else { return self }
        let matches = pattern.matches(in: self.string, options: [], range: NSRange(0..<self.length))
        let result = NSMutableAttributedString(attributedString: self)
        for match in matches {
            result.addAttributes(attributes, range: match.range)
        }
        return result
    }
    
    /// 向指定 NSAttributedString 中依据给定字符串匹配的子 NSAttributedString 中的 attributes 中添加给定 attributes，并返回添加后的结果
    ///
    /// - Parameters:
    ///   - attributes: attributes
    ///   - target: 用于目标匹配的字符串
    func applying<T: StringProtocol>(attributes: [NSAttributedString.Key: Any], toOccurrencesOf target: T) -> NSAttributedString {
        let pattern = "\\Q\(target)\\E"
        return self.applying(attributes: attributes, toRangesMatching: pattern)
    }
    
    // MARK:
    
    /// 将给定 NSAttributedString 拼接至指定 NSAttributedString 上
    ///
    /// - Parameters:
    ///   - lhs: 指定 NSAttributedString
    ///   - rhs: 给定 NSAttributedString
    static func += (lhs: inout NSAttributedString, rhs: NSAttributedString) {
        let string = NSMutableAttributedString(attributedString: lhs)
        string.append(rhs)
        lhs = string
    }
    
    /// 将给定 NSAttributedString 拼接至指定 NSAttributedString 上，并返回拼接后的结果
    ///
    /// - Parameters:
    ///   - lhs: 指定 NSAttributedString
    ///   - rhs: 指定 NSAttributedString
    static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        let string = NSMutableAttributedString(attributedString: lhs)
        string.append(rhs)
        return NSAttributedString(attributedString: string)
    }
    
    /// 将给定 String 拼接至指定 NSAttributedString 上，并返回拼接后的结果
    ///
    /// - Parameters:
    ///   - lhs: 指定 NSAttributedString
    ///   - rhs: 给定 String
    static func += (lhs: inout NSAttributedString, rhs: String) {
        lhs += NSAttributedString(string: rhs)
    }
    
    /// 将给定 String 拼接至指定 NSAttributedString 上，并返回拼接后的结果
    ///
    /// - Parameters:
    ///   - lhs: 指定 NSAttributedString
    ///   - rhs: 给定 String
    static func + (lhs: NSAttributedString, rhs: String) -> NSAttributedString {
        return lhs + NSAttributedString(string: rhs)
    }
    
    // MARK:
    fileprivate func applying(attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        let copy = NSMutableAttributedString(attributedString: self)
        let range = (self.string as NSString).range(of: self.string)
        copy.addAttributes(attributes, range: range)
        return copy
    }
}
