//
//  IMConversationViewController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/4/27.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class IMConversationViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
 
    override func viewWillAppear(_ animated: Bool) {
//        RCIM.shared().userInfoDataSource = self
        self.tabBarController?.tabBar.isHidden = true
    }
    
//    func getUserInfo(withUserId userId: String!, completion: ((RCUserInfo?) -> Void)!) {
//        let user = RCUserInfo.init()
//        user.portraitUri = "http://img1.skqkw.cn:888/2014/12/06/08/21ofdtyslqn-62877.jpg"
//        user.userId = "13605361772"
//        user.name = "BohemianRey"
//        return completion(user)
////        let user = RCIM.getUserInfoCache(userId)
//    }
 
}
