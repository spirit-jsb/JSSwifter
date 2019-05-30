//
//  UIFont+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/27.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UIFont {
    
    // MARK:
    
    /// 指定 UIFont 是否为粗体字体
    var isBold: Bool {
        return self.fontDescriptor.symbolicTraits.contains(.traitBold)
    }
    
    /// 指定 UIFont 是否为斜体字体
    var isItalic: Bool {
        return self.fontDescriptor.symbolicTraits.contains(.traitItalic)
    }
    
    /// 指定 UIFont 是否为粗斜体字体
    var isBoldItalic: Bool {
        return self.fontDescriptor.symbolicTraits.contains([.traitBold, .traitItalic])
    }
    
    /// 指定 UIFont 是否为等宽字体
    var isMonoSpace: Bool {
        let attributes = self.fontDescriptor.fontAttributes
        let fontKey = UIFontDescriptor.AttributeName.featureSettings
        guard let settings = attributes[fontKey] as? [[UIFontDescriptor.AttributeName: Int]],
            let selector = settings.first?[UIFontDescriptor.AttributeName(rawValue: "CTFeatureSelectorIdentifier")],
            let space = settings.first?[UIFontDescriptor.AttributeName(rawValue: "CTFeatureTypeIdentifier")] else
        {
            return false
        }
        return (selector == kMonospacedNumbersSelector && space == kNumberSpacingType)
    }
    
    /// 设置指定 UIFont 为粗体字体
    var bold: UIFont {
        return UIFont(descriptor: self.fontDescriptor.withSymbolicTraits(.traitBold)!, size: self.pointSize)
    }
    
    /// 设置指定 UIFont 为斜体字体
    var italic: UIFont {
        return UIFont(descriptor: self.fontDescriptor.withSymbolicTraits(.traitItalic)!, size: self.pointSize)
    }
    
    /// 设置指定 UIFont 为粗斜体字体
    var boldItalic: UIFont {
        return UIFont(descriptor: self.fontDescriptor.withSymbolicTraits([.traitBold, .traitItalic])!, size: self.pointSize)
    }
    
    /// 设置指定 UIFont 为等宽字体
    var monospaced: UIFont {
        let settings = [[UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
                         UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector]]
        let attributes = [UIFontDescriptor.AttributeName.featureSettings: settings]
        let newDescriptor = self.fontDescriptor.addingAttributes(attributes)
        return UIFont(descriptor: newDescriptor, size: self.pointSize)
    }
}
