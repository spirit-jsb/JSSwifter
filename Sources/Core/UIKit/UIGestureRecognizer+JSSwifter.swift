//
//  UIGestureRecognizer+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/22.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UIGestureRecognizer {
    
    // MAKR:
    
    /// 将 Gesture Recognizer 从视图上移除
    func removeFromView() {
        self.view?.removeGestureRecognizer(self)
    }
}
