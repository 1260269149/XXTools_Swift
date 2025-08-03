//
//  UIBarButtonItemExtension.swift
//  Calculator
//
//  Created by wangxu on 2020/9/29.
//  Copyright © 2020 wangxu. All rights reserved.
//

import UIKit
public extension UIBarButtonItem {
    
    func xx_setFontSize(fontSize:CGFloat) {
        self.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: fontSize)], for: .normal)
    }

    private class ClosureWrapper {
        var closure: (() -> Void)?
        
        init(_ closure: (() -> Void)?) {
            self.closure = closure
        }
    }
    
    fileprivate struct AssociatedKeys {
        static var HandlerKey = "HandlerKey"
    }
    
    private var handler: (()->Void)? {
        get {
            let obj = objc_getAssociatedObject(self, &AssociatedKeys.HandlerKey) as? ClosureWrapper
            return obj?.closure
        }
        
        set(newHandler) {
            objc_setAssociatedObject(self, &AssociatedKeys.HandlerKey, ClosureWrapper(newHandler), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    convenience init(image: UIImage?, style: UIBarButtonItem.Style, handler: (()->Void)?) {
        self.init(image: image, style: style, target: nil, action: nil)
        self.target = self
        self.action = #selector(UIBarButtonItem.didTapedBarButton)
        self.handler = handler
    }
    
    convenience init(title: String?, style: UIBarButtonItem.Style, handler: (()->Void)?) {
        self.init(title: title, style: style, target: nil, action: nil)
        self.target = self
        self.action = #selector(UIBarButtonItem.didTapedBarButton)
        self.handler = handler
    }
    
    @objc private func didTapedBarButton() {
        self.handler?()
    }
    
}
