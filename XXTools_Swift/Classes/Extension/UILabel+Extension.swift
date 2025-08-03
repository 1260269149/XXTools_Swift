//
//  UILabel+Extension.swift
//  DoctorProject
//
//  Created by Ly on 2020/7/20.
//  Copyright © 2020 Ly. All rights reserved.
//

import UIKit

public extension UILabel {
    
    class func wxCreateLabel(text: String, font: UIFont = UIFont.systemFont(ofSize: 17), textColor: UIColor? = .black, backgroundColor: UIColor? = .clear, textAlignment: NSTextAlignment? = .center, numberOfLines: Int? = 1) -> UILabel {
        return creatLab(text: text, textColor: textColor, backgroundColor: .clear, font: font, textAlignment: textAlignment, numberOfLines: numberOfLines)
    }
    class func wxCreateLabel(text: String, fontSize: CGFloat = 17 , textColor: UIColor? = .black, backgroundColor: UIColor? = .clear, textAlignment: NSTextAlignment? = .center, numberOfLines: Int? = 1) -> UILabel {
        return creatLab(text: text, textColor: textColor, backgroundColor: backgroundColor, font: UIFont.systemFont(ofSize: fontSize), textAlignment: textAlignment, numberOfLines: numberOfLines)
    }
    
    
}
fileprivate extension UILabel {
    
    class func creatLab(text: String?, textColor: UIColor?, backgroundColor: UIColor?, font: UIFont?, textAlignment: NSTextAlignment?, numberOfLines: Int?) -> Self {
        let label = self.init()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignment ?? .center
        label.numberOfLines = numberOfLines ?? 1
        label.backgroundColor = backgroundColor
        return label
    }
}
