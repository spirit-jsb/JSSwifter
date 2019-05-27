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
    var isBold: Bool {
        return self.fontDescriptor.symbolicTraits.contains(.traitBold)
    }
    
    var isItalic: Bool {
        return self.fontDescriptor.symbolicTraits.contains(.traitItalic)
    }
    
    var isBoldItalic: Bool {
        return self.fontDescriptor.symbolicTraits.contains([.traitBold, .traitItalic])
    }
    
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
    
    var bold: UIFont {
        return UIFont(descriptor: self.fontDescriptor.withSymbolicTraits(.traitBold)!, size: self.pointSize)
    }
    
    var italic: UIFont {
        return UIFont(descriptor: self.fontDescriptor.withSymbolicTraits(.traitItalic)!, size: self.pointSize)
    }
    
    var boldItalic: UIFont {
        return UIFont(descriptor: self.fontDescriptor.withSymbolicTraits([.traitBold, .traitItalic])!, size: self.pointSize)
    }
    
    var monospaced: UIFont {
        let settings = [[UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
                         UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector]]
        let attributes = [UIFontDescriptor.AttributeName.featureSettings: settings]
        let newDescriptor = self.fontDescriptor.addingAttributes(attributes)
        return UIFont(descriptor: newDescriptor, size: self.pointSize)
    }
}
