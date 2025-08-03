//
//  UIViewController+Extension.swift
//  Calendar
//
//  Created by wangxu on 2023/4/11.
//

import UIKit


public extension UIViewController{
    
    func pushTo(vc: UIViewController){
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func pop(_ toVc: UIViewController? = nil){
        if let vc = toVc{
            self.navigationController?.popToViewController(vc, animated: true)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    func popToRoot(){
        self.navigationController?.popToRootViewController(animated: true)
    }
}
