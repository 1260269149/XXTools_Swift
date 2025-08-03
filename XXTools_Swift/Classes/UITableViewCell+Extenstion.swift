//
//  UITableViewCell+Extenstion.swift
//  DoctorProject
//
//  Created by wangxu on 2020/7/23.
//  Copyright © 2020 Ly. All rights reserved.
//

import UIKit

extension UITableViewCell{
    public class func tableCellFromNib<T>(_ aClass: T.Type) -> T {
        let name = String(describing: aClass)
        if Bundle.main.path(forResource: name, ofType: "nib") != nil {
            return UINib(nibName: name, bundle:nil).instantiate(withOwner: nil, options: nil)[0] as! T
        } else {
            fatalError("\(String(describing: aClass)) nib is not exist")
        }
    }
    
    public static var reuseID: String {
        return NSStringFromClass(self.classForCoder())
    }
    
}
//extension UICollectionViewCell{
//    class func collectionCellFormNib<T>(_ aClass: T.Type)->T{
//        let name = String(describing: aClass)
//        if Bundle.main.path(forResource: name, ofType: "nib") != nil{
//            return UINib.init(nibName: name, bundle: nil).instantiate(withOwner: nil, options: nil).first as! T
//        }else {
//            fatalError("\(String(describing: aClass)) nib is not exist")
//        }
//    }
//    @objc static var reuseId: String{
//        return NSStringFromClass(self.classForCoder())
//    }
//}
extension UICollectionReusableView {
    public static var reuseID: String {
        return NSStringFromClass(self.classForCoder())
    }
    public static func reuseableForNib<T>(aClass: T.Type) -> T?{
        let name = String(describing: aClass)
        if Bundle.main.path(forResource: name, ofType: "nib") != nil{
            return UINib.init(nibName: name, bundle: nil).instantiate(withOwner: nil, options: nil).first as? T
        }else{
            fatalError("\(String(describing: aClass)) nib is not exist")
        }
    }
}

extension UITableViewHeaderFooterView {
    public static var reuseID: String {
        return NSStringFromClass(self.classForCoder())
    }
    public static func headerFooterForNib<T>(aClass: T.Type) -> T?{
        let name = String(describing: aClass)
        if Bundle.main.path(forResource: name, ofType: "nib") != nil{
            return UINib.init(nibName: name, bundle: nil).instantiate(withOwner: nil, options: nil).first as? T
        }else{
            fatalError("\(String(describing: aClass)) nib is not exist")
        }
    }
    public static func headerFooterForClass<T>(aClass: T.Type) -> T?{
        let name = String(describing: aClass)
        return UITableViewHeaderFooterView.init(reuseIdentifier: name) as? T
    }
}
