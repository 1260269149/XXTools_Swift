//
//  Define.swift
//  Calculator
//
//  Created by wangxu on 2020/9/29.
//  Copyright © 2020 wangxu. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
let navigationBarHeight: CGFloat = 44
let allNavHeight = statusBarHeight + navigationBarHeight
let isIphoneX = statusBarHeight > 20
var bottomSafeAreaHeight: CGFloat = isIphoneX ? 34 : 0
let tabBarHeight: CGFloat = 49 //+ bottomSafeAreaHeight
let themFontSize: CGFloat = 18// 计算记录是主要字体
let appstoreId = "6742146177"

var themColor: UIColor{
    
    return .systemGroupedBackground
}


