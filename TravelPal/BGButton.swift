//
//  BGButton.swift
//  lvban
//
//  Created by 冼啟棉 on 17/5/12.
//  Copyright © 2017年 冼啟棉. All rights reserved.
//

import UIKit

class BGButton: UIButton {
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
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 设置视图
    fileprivate func setupUI(){
        // 设置imageView
        imageView?.contentMode = .center
        
        // 设置tilte
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 15)
        setTitleColor(UIColor.darkGray, for: UIControlState())
    }
    
    // 对其子控件重新布局
    override func layoutSubviews() {
        super.layoutSubviews()
        // 设置imageView
        imageView?.frame = CGRect(x: 37, y: 28, width: 50, height: 50)
        imageView?.contentMode = .scaleAspectFit
        // 设置title
        titleLabel?.frame = CGRect(x: 0, y: 8, width: self.frame.width, height: 20)
    }
    
}
