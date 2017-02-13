//
//  UIColor+Extention.swift
//  PageTitle
//
//  Created by 胡亚莉 on 17/2/12.
//  Copyright © 2017年 胡亚莉. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func radomColor() -> UIColor {
        
        let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
        let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let colorRun = UIColor.init(red:red, green:green, blue:blue , alpha: 1)
        return colorRun
    }
}
