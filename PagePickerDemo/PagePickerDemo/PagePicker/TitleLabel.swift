//
//  TitleLabel.swift
//  PageTitle
//
//  Created by 胡亚莉 on 17/2/12.
//  Copyright © 2017年 胡亚莉. All rights reserved.
//

import UIKit

class TitleLabel: UILabel {

    /// 根据比例，改变label颜色和大小
    var scale: CGFloat = 0 {
        didSet {
            
            // 标题文字颜色渐变
            textColor = UIColor(red: scale, green: 0, blue: 0, alpha: 1)
            // 大小渐变
            let transScale = 1 + scale * 0.2
            transform = CGAffineTransform(scaleX: transScale, y: transScale)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textAlignment = .center
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
