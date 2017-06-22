//
//  TPIMListViewController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/6/22.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class TPIMListViewController: RCConversationListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDisplayConversationTypes([
            RCConversationType.ConversationType_PRIVATE.rawValue,RCConversationType.ConversationType_GROUP.rawValue,RCConversationType.ConversationType_DISCUSSION.rawValue,RCConversationType.ConversationType_APPSERVICE.rawValue,RCConversationType.ConversationType_SYSTEM.rawValue
            ])
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func onSelectedTableRow(_ conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, at indexPath: IndexPath!) {
        let a = RCConversationViewController.init(conversationType: model.conversationType, targetId: model.targetId)
        a?.title = "与旅伴的聊天"
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.pushViewController(a!, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
