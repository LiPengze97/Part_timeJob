//
//  TPDetailToolBar.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/13.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class TPDetailToolBar: UIToolbar {
    let contactBtn = UIBarButtonItem()//联系
    let collectBtn = UIBarButtonItem()//收藏
    let friendsBtn = UIBarButtonItem()//加好友
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configueBtn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configueBtn(){
        self.contactBtn.title = "联系Ta"
        self.contactBtn.tintColor = UIColor.init(red: 30/255.0, green: 168/255.0, blue: 134/255.0, alpha: 1)
        
        self.collectBtn.title = "收藏"
        self.collectBtn.tintColor = UIColor.init(red: 30/255.0, green: 168/255.0, blue: 134/255.0, alpha: 0.8)
        
        self.friendsBtn.title = "加好友"
        self.friendsBtn.tintColor = UIColor.init(red: 30/255.0, green: 168/255.0, blue: 134/255.0, alpha: 0.6)
        
    }
}
