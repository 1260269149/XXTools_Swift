//
//  UIView+Extension.swift
//  Calculator
//
//  Created by wangxu on 2020/10/14.
//  Copyright © 2020 wangxu. All rights reserved.
//

import UIKit
import SnapKit

public extension UIView{
    
    func removeSubviewsWithTags(_ tags: [Int]){
        self.subviews.forEach { (v) in
            tags.forEach({ tag in
                if v.tag == tag{
                    v.removeFromSuperview()
                }
            })
        }
    }
    func removeSubviews(){
        self.subviews.forEach { (v) in
            v.removeFromSuperview()
        }
    }
    func xx_addSelectedTap(handler: ((_ view:UIView?)->())?) {
        
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self) { (tap) in
            handler?(tap.view)
        }
        self.addGestureRecognizer(tap)
    }
    func xx_addLongTap(handler: ((_ view:UIView?)->())?){
        self.isUserInteractionEnabled = true
        let longTap = UILongPressGestureRecognizer(target: self) { (longTap) in
            handler?(longTap.view)
        }
        self.addGestureRecognizer(longTap)
    }
    
    @discardableResult
    func xx_addButtomLine(left:CGFloat = 0 ,right:CGFloat = 0, color: UIColor? = .groupTableViewBackground) -> UIView {
        var line = self.viewWithTag(9999991) as? UILabel
        if line != nil {
            line?.snp.updateConstraints({
                $0.left.equalTo(left)
                $0.right.equalTo(right)
            })
            return line!
        }
        else{
            line = UILabel()
            line?.tag = 9999991
            self.addSubview(line!)
            line?.snp.makeConstraints({ (maek) in
                maek.bottom.equalTo(0)
                maek.height.equalTo(1)
                maek.left.equalTo(left)
                maek.right.equalTo(right)
            })
            line?.backgroundColor = color
            return self
        }
    }
    @discardableResult
    func xx_addTopLine(left:CGFloat = 0 ,right:CGFloat = 0, color: UIColor? = .systemGroupedBackground) -> UIView {
        var line = self.viewWithTag(9999992) as? UILabel
        if line != nil {
            line?.snp.updateConstraints({
                $0.left.equalTo(left)
                $0.right.equalTo(right)
            })
            return line!
        }
        else{
            line = UILabel()
            line?.tag = 9999992
            self.addSubview(line!)
            line?.snp.makeConstraints({ (maek) in
                maek.top.equalTo(0)
                maek.height.equalTo(1)
                maek.left.equalTo(left)
                maek.right.equalTo(right)
            })
            line?.backgroundColor = color
            return self
        }
    }
    ///设置边框
    func xx_border(borderColor:UIColor = .black, borderWidth: CGFloat = 1)  {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    ///设置圆角和边框
    func xx_cornerAndBorder(cornerRadius: CGFloat, masksToBounds: Bool = true, borderColor:UIColor, borderWidth: CGFloat = 1)  {
        self.layer.masksToBounds = masksToBounds
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    /// 增加部分圆角
    @discardableResult
    func xx_addCorner(radius:CGFloat, corners: UIRectCorner? = nil) -> CALayer {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners:corners != nil ? corners! : [.topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        return maskLayer
    }
    /// 增加顶部圆角
    ///
    /// - Parameter radii: <#radii description#>
    /// - Returns: <#return value description#>
    @discardableResult
    func xx_addTopCorner(radius:CGFloat) -> CALayer {
        let corners:UIRectCorner = [UIRectCorner.topRight,UIRectCorner.topLeft]
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners:corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        return maskLayer
    }
    
    @discardableResult
    func xx_addLeftCorner(radius:CGFloat,size:CGSize) -> CALayer {
        let tempFrame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let corners:UIRectCorner = [UIRectCorner.bottomLeft,UIRectCorner.topLeft]
        let maskPath = UIBezierPath(roundedRect: tempFrame, byRoundingCorners:corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = tempFrame//self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        return maskLayer
    }
    
    @discardableResult
    func xx_addRightCorner(radius:CGFloat,size:CGSize) -> CALayer {
        let tempFrame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let corners:UIRectCorner = [UIRectCorner.bottomRight,UIRectCorner.topRight]
        let maskPath = UIBezierPath(roundedRect: tempFrame, byRoundingCorners:corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = tempFrame//self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        return maskLayer
    }
    @discardableResult
    func xx_addBottomCorner(radius:CGFloat) -> CALayer {
        let corners:UIRectCorner = [UIRectCorner.bottomLeft,UIRectCorner.bottomRight]
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners:corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        return maskLayer
    }
    
    /// 水平渐变
    func xx_horizontalGradientLayer(colors: [CGColor], cornerRadius:CGFloat) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        
        if colors.count == 1{
            gradient.backgroundColor = colors.first
        }else{
            gradient.colors = colors
        }
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.cornerRadius = cornerRadius
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    /// 垂直渐变
    func xx_verticalGradientLayer(colors: [CGColor], cornerRadius:CGFloat) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        
        if colors.count == 1{
            gradient.backgroundColor = colors.first
        }else{
            gradient.colors = colors
        }
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.cornerRadius = cornerRadius
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    
    /// 给view添加阴影
    /// - Parameters:
    ///   - shadowColor: 阴影颜色
    ///   - shadowOffset: 相对于左上角的偏移
    ///   - shadowOpacity: 透明度（0~1）
    ///   - shadowRadius: 阴影半径
    func xx_shadow( shadowColor:UIColor, shadowOffset:CGSize, shadowOpacity:Float, shadowRadius:CGFloat) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
    }
    
    ///给View添加阴影和边框
    func xx_shadowBorder( shadowColor:UIColor, shadowOffset:CGSize, shadowOpacity:Float, shadowRadius:CGFloat, borderColor: UIColor) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1.0
    }
    
    ///获取当前View的控制器
    func xx_viewGetcurrentVC() -> UIViewController? {
        var nextResponder: UIResponder? = self
        repeat {
            nextResponder = nextResponder?.next
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
        } while nextResponder != nil
        
        return nil
    }
    
    ///view转图片
    func xx_viewToImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

public extension UIView {
    
    var height:CGFloat {
        get {
            return frame.height
        }
        set(newValue){
            var tempFrame = self.frame
            tempFrame.size.height = newValue
            self.frame = tempFrame
        }
    }
    
    var width:CGFloat {
        get{
            return frame.width
        }
        
        set(newValue){
            var tempFrame = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    var x:CGFloat {
        get{
            return frame.origin.x
        }
        set(newValue){
            var tempFrame = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    var y:CGFloat {
        get{
            return frame.origin.y
        }
        set(newValue){
            var tempFrame = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    var centerX:CGFloat {
        get{
            return center.x
        }
        set(newValue){
            var tempCenter = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    var centerY:CGFloat {
        get{
            return center.y
        }
        set(newValue){
            var tempCenter = center
            tempCenter.y = newValue
            center = tempCenter
        }
    }
    
    /// left值
    var left: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            var tempFrame = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    /// top值
    var top: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            var tempFrame = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    /// right值
    public var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        set {
            var tempFrame = frame
            tempFrame.origin.x = newValue - frame.size.width
            frame = tempFrame
        }
    }
    
    /// bottom值
    var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        set {
            var tempFrame = frame
            tempFrame.origin.y = newValue - frame.size.height
            frame = tempFrame
        }
    }
    
    /// size值
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            var tempFrame = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    /// origin值
    var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            var tempFrame = frame
            tempFrame.origin = newValue
            frame = tempFrame
        }
    }
}
//MARK: --- 常用的方法

fileprivate extension UIView {
    
    /// 点击手势(默认代理和target相同)
    func xx_longGesture(target: Any?, action: Selector, numberOfTapsRequired: Int = 1) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        tapGesture.numberOfTapsRequired = numberOfTapsRequired
        tapGesture.delegate = target as? UIGestureRecognizerDelegate
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture)
    }
    
    /// 长按手势(默认代理和target相同)
    func xx_longGesture( target: Any?, action: Selector, minDuration: TimeInterval = 0.5) {
        let longGesture = UILongPressGestureRecognizer(target: target, action: action)
        longGesture.minimumPressDuration = minDuration
        longGesture.delegate = target as? UIGestureRecognizerDelegate
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(longGesture)
    }
    
    /// 截图(带导航则用导航控制器的view或keywindow)
    func xx_screenshotImage() -> UIImage? {
        UIGraphicsBeginImageContext(self.bounds.size)
        if self.responds(to: #selector(UIView.drawHierarchy(in:afterScreenUpdates:))) {
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: false)
        } else if self.layer.responds(to: #selector(CALayer.render(in:) )) {
            self.layer.render(in: UIGraphicsGetCurrentContext()!)
        } else {
            return nil
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

public extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var masksToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor != nil ? UIColor(cgColor: layer.borderColor!) : nil
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            return layer.shadowColor != nil ? UIColor(cgColor: layer.shadowColor!) : nil
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    var shadowPath: CGPath? {
        get {
            return layer.shadowPath
        }
        set {
            layer.shadowPath = newValue
        }
    }
    
    var controller: UIViewController? {
        get {
            var nextResponder: UIResponder?
            nextResponder = next
            repeat {
                if nextResponder is UIViewController {
                    return (nextResponder as! UIViewController)
                } else {
                    nextResponder = nextResponder?.next
                }
            } while nextResponder != nil
            return nil
        }
    }
}
