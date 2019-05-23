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
    func removeFromView() {
        self.view?.removeGestureRecognizer(self)
    }
}
