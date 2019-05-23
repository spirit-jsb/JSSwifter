//
//  UIGestureRecognizer+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/22.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

private var key: String = "com.sibo.jian.JSSwifter.gesture.recognizer.action"

public extension UIGestureRecognizer {
    
    // MARK:
    var actionHandler: ((UIGestureRecognizer) -> Void)? {
        set {
            let target = JSUIGestureRecognizerClosureTarget(actionHandler: newValue)
            objc_setAssociatedObject(self, &key, target, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.addTarget(target, action: #selector(JSUIGestureRecognizerClosureTarget.invoke(_:)))
        }
        get {
            let target = objc_getAssociatedObject(self, &key) as! JSUIGestureRecognizerClosureTarget
            return target.actionHandler
        }
    }
    
    // MAKR:
    func removeFromView() {
        self.view?.removeGestureRecognizer(self)
    }
}

private class JSUIGestureRecognizerClosureTarget: NSObject {
    
    // MARK:
    var actionHandler: ((UIGestureRecognizer) -> Void)?
    
    // MARK:
    init(actionHandler: ((UIGestureRecognizer) -> Void)?) {
        super.init()
        self.actionHandler = actionHandler
    }
    
    // MARK:
    @objc func invoke(_ gesture: UIGestureRecognizer) {
        if let actionHandler = self.actionHandler {
            actionHandler(gesture)
        }
    }
}
