//
//  UserManager.swift
//  CampusRepair
//
//  Created by 李鹏泽 on 16/9/17.
//  Copyright © 2016年 INGSwifters. All rights reserved.
//

import Alamofire
//import SwiftyJSON

open class UserManager{
    fileprivate var isLogIn = false
    fileprivate var api_token = ""
    var nickName = ""
    var phone = ""
    var school = ""
    var avtar = ""//头像
    var type = ""
    var username = ""
    var sex = 0
    var credit = 3//用户信誉
    
    fileprivate var password = ""
    
    open static let sharedInstance: UserManager = UserManager()
    
    let userDefaults = UserDefaults.standard
    
//    func userSignIn(_ username: String, password: String, nickname: String, phone: String, school: String,type: String, avatar: String) {
//        Alamofire.request(Router.register(username, password, nickname, phone, school, type, avatar)).responseJSON { json in
//            switch json.result {
//            case .success:
//                if let value = json.result.value {
//                    let json = JSON(value)
//                    let code = json["code"]
//                    if code != 0 {
//                        print("sign in failure")
//                        print(code)
//                        NotificationCenter.default.post(name: Notification.Name(rawValue: "didFailToSignIn"), object: nil)
//                    }else{
//                        print("sign in success")
//                        //self.userLogIn(username, password: password)
//                        NotificationCenter.default.post(name: Notification.Name(rawValue: "didSignIn"), object: nil)
//                    }
//                }
//            case .failure(let error):
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "didFailToSignIn"), object: nil)
//                print(error)
//            }
//        }
//    }
//    
//    func userLogIn(_ username: String, password: String) {
//        Alamofire.request(Router.logIn(username, password)).responseJSON { json in
//            switch json.result {
//            case .success:
//                if let value = json.result.value {
//                    let json = JSON(value)
//                    let code = json["code"]
//                    if code != 0 {
//                        print("log in failure")
//                        NotificationCenter.default.post(name: Notification.Name(rawValue: "didFailToLogIn"), object: nil)
//                    }else{
//                        self.api_token = json["data"]["token"].string!
//                        print(self.api_token)
//                        self.isLogIn = true
//                        
//                        self.getUserInfo(self.api_token)
//                        
//                        self.username = username
//                        self.password = password
//                        
//                        self.userDefaults.set(true, forKey: "didLogIn")
//                        self.userDefaults.set(self.username, forKey: "username")
//                        self.userDefaults.set(self.password, forKey: "password")
//                        self.userDefaults.synchronize()
//                    }
//                    
//                }
//            case .failure(let error):
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "didFailToLogIn"), object: nil)
//                print(error)
//            }
//        }
//    }
//    func getUserInfo(_ api_token: String) {
//        Alamofire.request(Router.getUserInfo(api_token)).responseJSON { json in
//            switch json.result {
//            case .success:
//                if let value = json.result.value {
//                    let json = JSON(value)
//                    //print(json)
//                    let code = json["code"]
//                    if code != 0 {
//                        print("get user info failure")
//                    }
//                    //                    self.userID = json["data"]["_id"].string
//                    self.username = json["data"]["username"].string!
//                    self.phone = json["data"]["phone"].string!
//                    self.type = json["data"]["type"].string!
//                    self.school = json["data"]["school"].string!
//                    self.nickName = json["data"]["nickname"].string!
//                    if let picString = json["data"]["pic"].string {
//                        self.avtar = picString
//                    }
//                    self.getRongCloudToken(self.api_token)
//                    
//                    //                self.getUserAvatar(api_token)
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//    
//    //    func getUserAvatar(api_token: String) {
//    //        Alamofire.request(Router.GetUserAvatar(api_token)).responseImage { response in
//    //            if let image = response.result.value {
//    //                userAvatar = image
//    //            }else{
//    //                userAvatar = UIImage(named: "image_defaultAvatar")
//    //            }
//    //            NSNotificationCenter.defaultCenter().postNotificationName("didGetUserInfo", object: nil)
//    //        }
//    //    }
//    
//    func userLogOut() -> Bool{
//        self.username = ""
//        self.password = ""
//        self.nickName = ""
//        self.school = ""
//        self.avtar = ""
//        self.api_token = ""
//        self.isLogIn = false
//        self.type = ""
//        
//        
//        self.userDefaults.set(false, forKey: "didLogIn")
//        self.userDefaults.set("", forKey: "username")
//        self.userDefaults.set("", forKey: "password")
//        self.userDefaults.synchronize()
//        
//        return true
//    }
//    
//    
//    
//    func getAPI_TOKEN() -> String {
//        return self.api_token
//    }
//    
//    func getUserStatus() -> Bool {
//        return self.isLogIn
//    }
//    
//    func checkLastUserStatus() {
//        if userDefaults.bool(forKey: "didLogIn") {
//            let username = userDefaults.string(forKey: "username")
//            let password = userDefaults.string(forKey: "password")
//            print(username)
//            print(password)
//            self.userLogIn(username!, password: password!)
//        }
//    }
//
}

