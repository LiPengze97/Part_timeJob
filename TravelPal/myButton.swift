//
//  myButton.swift
//  ShiXun
//
//  Created by macbook on 2017/4/24.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit

class myButton: UIButton {
    // 屏蔽按钮高亮效果
    override var isHighlighted: Bool{
        get{
            return false
        }
        set{
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.white
        imageView?.contentMode = .scaleAspectFill
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 12)
        titleLabel?.textColor = kRGBColorFromHex(rgbValue: 0x7a7a7a)
        setTitleColor(kRGBColorFromHex(rgbValue: 0x7a7a7a), for: UIControlState.normal)
        isUserInteractionEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 对其子控件重新布局
    override func layoutSubviews() {
        super.layoutSubviews()
        // 设置imageView
        imageView?.frame = CGRect(x: self.frame.width/2-11, y: 10, width: 22, height: 22)
        // 设置title
        titleLabel?.frame = CGRect(x: 0, y: 30, width: self.frame.width, height: self.frame.height-30)
    }
    
     

}
