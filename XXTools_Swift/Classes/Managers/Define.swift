//
//  Define.swift
//  Calculator
//
//  Created by wangxu on 2020/9/29.
//  Copyright © 2020 wangxu. All rights reserved.
//

import UIKit

public let screenWidth = UIScreen.main.bounds.width
public let screenHeight = UIScreen.main.bounds.height
public let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
public let navigationBarHeight: CGFloat = 44
public let allNavHeight = statusBarHeight + navigationBarHeight
public let isIphoneX = statusBarHeight > 20
public var bottomSafeAreaHeight: CGFloat = isIphoneX ? 34 : 0
public let tabBarHeight: CGFloat = 49 //+ bottomSafeAreaHeight
public let themFontSize: CGFloat = 18// 计算记录是主要字体

var themColor: UIColor{
    
    return .systemGroupedBackground
}

// App Store ID，需要根据实际应用设置
public let appstoreId = "1234567890"


