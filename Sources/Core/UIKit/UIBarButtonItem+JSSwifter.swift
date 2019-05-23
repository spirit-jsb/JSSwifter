//
//  UIBarButtonItem+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/22.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

private var key: String = "com.sibo.jian.JSSwifter.bar.button.item.action"

public extension UIBarButtonItem {
    
    // MARK:
    var actionHandler: ((UIBarButtonItem) -> Void)? {
        set {
            let target = JSUIBarButtonItemClosureTarget(actionHandler: newValue)
            objc_setAssociatedObject(self, &key, target, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.target = target
            self.action = #selector(JSUIBarButtonItemClosureTarget.invoke(_:))
        }
        get {
            let target = objc_getAssociatedObject(self, &key) as! JSUIBarButtonItemClosureTarget
            return target.actionHandler
        }
    }
}

private class JSUIBarButtonItemClosureTarget: NSObject {

    // MARK:
    var actionHandler: ((UIBarButtonItem) -> Void)?
    
    // MARK:
    init(actionHandler: ((UIBarButtonItem) -> Void)?) {
        super.init()
        self.actionHandler = actionHandler
    }
    
    // MARK:
    @objc func invoke(_ sender: UIBarButtonItem) {
        if let actionHandler = self.actionHandler {
            actionHandler(sender)
        }
    }
}
