//
//  UIStackView+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/21.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UIStackView {
    
    // MARK:
    convenience init(
        arrangedSubviews: [UIView],
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat = 0.0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill)
    {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
    
    // MARK:
    func addArrangedSubviews(_ subviews: [UIView]) {
        for subview in subviews {
            self.addArrangedSubview(subview)
        }
    }
    
    func removeArrangedSubviews() {
        for subview in self.arrangedSubviews {
            self.removeArrangedSubview(subview)
        }
    }
}
