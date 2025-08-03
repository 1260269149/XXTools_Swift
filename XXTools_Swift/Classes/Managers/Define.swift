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
public let tabBarHeight: CGFloat = 49
public let allTabBarHeight: CGFloat = 49 + bottomSafeAreaHeight

//以下字段需要自己配置才有值
public var appstoreId: String { return XXTools.appstoreId }
public var themColor: UIColor{ return XXTools.themColor }

