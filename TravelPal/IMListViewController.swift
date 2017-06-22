//
//  IMViewController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/4/26.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class IMListViewController: RCConversationListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDisplayConversationTypes([
        RCConversationType.ConversationType_PRIVATE.rawValue,
        RCConversationType.ConversationType_DISCUSSION.rawValue,
        RCConversationType.ConversationType_CHATROOM.rawValue,
        RCConversationType.ConversationType_GROUP.rawValue,
        RCConversationType.ConversationType_APPSERVICE.rawValue,
        RCConversationType.ConversationType_SYSTEM.rawValue])
        //设置需要将哪些类型的会话在会话列表中聚合显示
        self.setCollectionConversationType([
        RCConversationType.ConversationType_DISCUSSION.rawValue,
        RCConversationType.ConversationType_GROUP.rawValue])

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
    override func onSelectedTableRow(_ conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, at indexPath: IndexPath!) {
        //打开会话界面
        let chat = IMConversationViewController(conversationType: model.conversationType, targetId: model.targetId)
        chat?.title = "BohemianRey"
        
        self.navigationController?.pushViewController(chat!, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
