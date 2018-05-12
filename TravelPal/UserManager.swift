//
//  UserManager.swift
//  ShiXun
//
//  Created by macbook on 2017/6/11.
//  Copyright © 2017年 macbook. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import SwiftyJSON

public class UserManager: Notifier {
    
    public static let shared: UserManager = UserManager()
    
    fileprivate let userDefaults = UserDefaults.standard
    
    // MARK: - 用户相关
    
    var isLogIn = false
    var canRegister = false
    
    //手机号
    var tel = ""
    //密码
    private var password = ""
    //昵称
    var username = "您还没有设置昵称哦~"
    //信用等级
    private var creditLevel = ""
    //头像
    var avatar: UIImage?
    //地点
    var location = "您还没有设置所在地哦~"
    var isExist = false
    var Image : UIImage?
    //订单
    var names1: [String] = []
    var describes1: [String] = []
    var prices1: [String] = []
    var dates1: [String] = []
    var strokes1: [String] = []
    
    var names2: [String] = []
    var describes2: [String] = []
    var prices2: [String] = []
    var dates2: [String] = []
    var strokes2: [String] = []
    
    var names3: [String] = []
    var describes3: [String] = []
    var prices3: [String] = []
    var dates3: [String] = []
    var strokes3: [String] = []
    //收藏
    var images4: [String] = []
    var tits4: [String] = []
    var price4: [String] = []
    var collects4: [String] = []
    var describe4: [String] = []
    
    var images5: [String] = []
    var tits5: [String] = []
    var price5: [String] = []
    var collects5: [String] = []
    var describe5: [String] = []
    
    var images6: [String] = []
    var tits6: [String] = []
    var price6: [String] = []
    var collects6: [String] = []
    var describe6: [String] = []
    
    var images7: [String] = []
    var tits7: [String] = []
    var price7: [String] = []
    var collects7: [String] = []
    var describe7: [String] = []
    
    var images8: [String] = []
    var tits8: [String] = []
    var price8: [String] = []
    var collects8: [String] = []
    var describe8: [String] = []
    
    
    
    public enum Notification : String {
        case didGetMessage
        case didGetMessageFailure
        case didexists
        case didexistsFailure
        case didSignup
        case didSignupFailure
        case didLogin
        case didLoginFailure
        case didLogout
        case didLogoutFailure
        case didSetUserInfo
        case didSetUserInfoFailure
        case didGetUserInfo
        case didGetUserInfoFailure
        case didGetAllOrder
        case didGetAllOrderFailure
        case didGetUnpaidOrder
        case didGetUnpaidOrderFailure
        case didGetSuccessOrder
        case didGetSuccessOrderFailure
        case didGetCollected
        case didGetCollectedFailure
        case didGetEnlistInfo
        case didGetEnlistInfoFailure
        case didGetMyPal
        case didGetMyPalFailure
        case didGetWantGo
        case didGetWantGoFailure
        case didGetEverGone
        case didGetEverGoneFailure
        case didtour
        case didtourFailure
        case didGetTourism
        case didGetTrip
        case didGetTripFailure
        case didGetTourismFailure
        case shouldReloadData
    }
    
    private enum Action {
        //获取验证码
        case getMessage
        case exists
        case signUp
        case logIn
        case setUserInfo
        case getUserInfo
        case getCarInfo
        case getAllOrder
        case getTrips
        case getUnpaidOrder
        case getSuccessOrder
        case getCollected
        case getEnlistInfo
        case getMyPal
        case getWantGo
        case getEverGone
        //获取商品
        case tour
        case getTourism
    }
    
    private let actionDict: [Action: (Notification, Notification)] =
        [.getMessage: (.didGetMessage, .didGetMessageFailure),
         .exists: (.didexists, .didexistsFailure),
         .signUp: (.didSignup, .didSignupFailure),
         .logIn: (.didLogin, .didLoginFailure),
         .setUserInfo: (.didSetUserInfo, .didSetUserInfoFailure),
         .getUserInfo: (.didGetUserInfo, .didGetUserInfoFailure),
         .getAllOrder: (.didGetAllOrder, .didGetAllOrderFailure),
         .getUnpaidOrder: (.didGetUnpaidOrder, .didGetUnpaidOrderFailure),
         .getSuccessOrder: (.didGetSuccessOrder, .didGetSuccessOrderFailure),
         .getCollected: (.didGetCollected, .didGetCollectedFailure),
         .getEnlistInfo: (.didGetEnlistInfo, .didGetEnlistInfoFailure),
         .getMyPal: (.didGetMyPal, .didGetMyPalFailure),
         .getWantGo: (.didGetWantGo, .didGetWantGoFailure),
         .getEverGone: (.didGetEverGone, .didGetEverGoneFailure),
         .tour: (.didtour, .didtourFailure),
         .getTourism: (.didGetTourism,.didGetTourismFailure),
         .getTrips: (.didGetTrip, .didGetTripFailure)
            
         ]
    
    private func handleResult(_ action: Action, _ response: DataResponse<Any>, completionHandler: (JSON) -> ()) {
       
        switch response.result {
        case .success:
            guard let value = response.result.value else {
                log("response.result.value is nil", .error)
                return
            }
            let json = JSON(value)
            guard let status = json["status"].int else { return }
            
            let (successNoti, failureNoti) = actionDict[action]!
            guard status == 200 else {
                log(json, .error)
                UserManager.postNotification(failureNoti)
                return
            }
            completionHandler(json)
            UserManager.postNotification(successNoti)

            return
        case .failure(let error):
            log(error, .error)
            let (_, failureNoti) = actionDict[action]!
            UserManager.postNotification(failureNoti)
            return
        }
    }
    
    private func handleResult1(_ response: DataResponse<Any>, completionHandler: (JSON) -> ()) {
        switch response.result {
        case .success:
            guard let value = response.result.value else {
                log("response.result.value is nil", .error)
                return
            }
            let json = JSON(value)
            guard let status = json["status"].int else { return }
            guard status == 200 else {
                log(json, .error)
                return
            }
            completionHandler(json)
            return
        case .failure(let error):
            log(error, .error)
            return
        }
    }
    
    func getMessage(_ phone: String) {
        log("send message to \(phone)", .json)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            UserManager.postNotification(.didGetMessage)
        })
    }
    
    func exists(tel: String, canRegisterHandler: @escaping (()->Void)) {
        Alamofire.request(Router.exists(tel)).responseJSON { response in
            self.handleResult(.exists, response, completionHandler: { (json) in
                //log(json, .json)
                print(json["data"]["success"].int!)
                if json["data"]["success"].int!==1{
                    self.isExist = true
                    self.canRegister = false
                    print("存在")
                }
                else{
                    self.isExist = false
                    print("不存在")
                    canRegisterHandler()
                }
                
            })
        }
    }
    
    //获取旅伴消息
    func getTourism(){
        Alamofire.request(Router.getTourism).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let value = response.result.value else{
                    log("response.result.value is nil", .error)
                    return
                }
                let json = JSON(value)
                print("🙏",json)
                let array = NSArray.init(object: json["data"].arrayObject as! [Dictionary<String,String>])
                let filePath = Bundle.main.path(forResource: "Tourism", ofType: "plist")
                let url = URL.init(string: filePath!)
                array.write(to: url!, atomically: true)
                
                guard let status = json["status"].int else { return }
                
                guard status == 200 else {
                    log(json, .error)
                    
                    return
                }
                return
            case .failure(let error):
                log(error, .error)
                return
            }
            
        }
    }
    
    //发送旅伴消息
    func postTour(para:Parameters){
        Alamofire.request(Router.postTour(para)).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let value = response.result.value else {
                    log("response.result.value is nil", .error)
                    return
                }
                let json = JSON(value)
                guard let status = json["status"].int else { return }
                guard status == 200 else {
                    log(json, .error)
                    
                    return
                }
                return
            case .failure(let error):
                log(error, .error)
                return
            }

        }
    }
    
    //发送近程旅伴消息
    func postNearby(para:Parameters){
        Alamofire.request(Router.postNearby(para)).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let value = response.result.value else {
                    log("response.result.value is nil", .error)
                    return
                }
                let json = JSON(value)
                guard let status = json["status"].int else { return }
                guard status == 200 else {
                    log(json, .error)
                    
                    return
                }
                return
            case .failure(let error):
                log(error, .error)
                return
            }
            
        }

    }
    
    func signup(tel: String, password: String) {
    
        self.exists(tel: tel) {
        
            Alamofire.request(Router.signUp(tel, password)).responseJSON { response in
                self.handleResult(.signUp, response, completionHandler: { (json) in
                   
                    print(json)
                    if json["status"].int! == 200{
                        self.canRegister = true
                        self.isLogIn = true
                        self.tel = tel
                        self.password = tel
                        //用url显示头像
                        let url = "http://118.190.69.5:65530/headimg/"+UserManager.shared.tel
                    
                        let urlStr = URL(string: url)!
                        if let nsd = NSData(contentsOf: urlStr) {
                            self.Image = UIImage(data: nsd as Data)!
                        }
       
                        self.userDefaults.set(true, forKey: "didLogInLastTIme")
                        self.userDefaults.set(self.tel, forKey: "tel")
                        self.userDefaults.set(self.password, forKey: "password")
                        self.userDefaults.synchronize()
                    }
                })
            }
        }
    }
    
    func login(tel: String, password: String) {
        Alamofire.request(Router.logIn(tel, password)).responseJSON { response in
            self.handleResult(.logIn, response, completionHandler: { (json) in
       
                if json["status"].int! == 200{
                    self.isLogIn = true
                    self.tel = tel
                    self.password = password
              
                    //用url显示头像
                    let url = "http://118.190.69.5:65530/headimg/"+UserManager.shared.tel
                    let imagehead : UIImageView
                    let urlStr = NSURL(string: url)!
                    let nsd = NSData(contentsOf: urlStr as URL)
                    
                    //var img: UIImage? = nil
                    if nsd != nil {
                        imagehead = UIImageView()
                        self.Image = UIImage(data: nsd! as Data)!
                    }
                    
                    self.userDefaults.set(true, forKey: "didLogInLastTIme")
                    self.userDefaults.set(self.tel, forKey: "tel")
                    self.userDefaults.set(self.password, forKey: "password")
                    
                    //   136     JBYpKy1rUGUvfsLIcmkv0kIhz9rAQWIHhUAxahX3SGc1aigJlG4K8V4jncyurMaQMPWhnkPdCquoAqUf48wh4zqLm/gKwSJw
                    //   178     IZZ+R6gxLCclMMV9L8tjWMfvrSIfMwqzri3X7DJoFvQB0gTNkJUlQ+UuXso/TnOYjO9zM7QhVnIqEhei5fI4dnVA7y0VlSVg
                    
                    RCIM.shared().connect(withToken: USER_136_TOKEN, success: { (userid) in
                        print("登陆成功，userID为 ",userid as Any)
                        RCIM.shared().currentUserInfo = RCUserInfo.init(userId: "17864154582", name: "BohemianRey", portrait: "http://img1.skqkw.cn:888/2014/12/06/08/21ofdtyslqn-62877.jpg")
                    }, error: { (status) in
                        print("登录失败",status)
                    }) {
                        print("Token出错")
                    }

//                    http://img1.skqkw.cn:888/2014/12/06/08/21ofdtyslqn-62877.jpg   178
//                    http://img1.skqkw.cn:888/2014/12/06/08/iuzjpt23kob-62870.jpg 136
                    self.userDefaults.synchronize()
                }
            })
        }
    }
    
    func getUserInfo() {
        Alamofire.request(Router.getUserInfo()).responseJSON { response in
            self.handleResult(.getUserInfo, response, completionHandler: { (json) in
                log(json, .json)
                if json["status"].int! == 200{
                    if json["data"]["username"].string != nil{
                        self.username = (json["data"]["username"].string)!
                    }
                    if json["data"]["location"].string != nil{
                        self.location = (json["data"]["location"].string)!
                    }
                    
                }
            })
        }
    }
    
    func setUserInfo(username: String, location: String) {
        Alamofire.request(Router.setUserInfo(username, location)).responseJSON { response in
            self.handleResult(.setUserInfo, response, completionHandler: { (json) in
                log(json, .json)
                
            })
        }
    }
    
    func getTrips() {
        
        self.images4 = []
        self.tits4 = []
        self.price4 = []
        self.collects4 = []
        self.describe4 = []
        Alamofire.request(Router.getTrip()).responseJSON { response in
            
            self.handleResult(.getTrips,response, completionHandler: { (json) in
         
                if json["status"].int!==200{
                    for i in 0..<json["data"].count
                    {
                        if json["data"][i]["id"].int == nil{
                            self.images4.append("")
                        }else{
                            self.images4.append("http://118.190.69.5:65530/trip/"+"\(json["data"][i]["id"].int!)"+"-1")
                        }
                        if json["data"][i]["name"].string == nil{
                            //print(1111111111)
                            self.tits4.append("")
                        }else{
                            //print(22222222222)
                            self.tits4.append(json["data"][i]["stroke"].string!)
                        }
                        if json["data"][i]["price"].int == nil{
                            self.price4.append("")
                        }else{
                            self.price4.append("\(json["data"][i]["price"].int!)")
                        }
                        if json["data"][i]["collection"].int == nil{
                            self.collects4.append("")
                        }else{
                            self.collects4.append("\(json["data"][i]["collection"].int!)")
                        }
                        if json["data"][i]["describe"].string == nil{
                            self.describe4.append("")
                        }else{
                            self.describe4.append(json["data"][i]["describe"].string! + json["data"][i]["know"].string!)
                        }
                    }
                }
                else{
                    print("不存在")
                }
               
            })
        }
        //print(self.names.count)
    }
    
    
    func allOrder() {
        self.names1 = []
        self.describes1 = []
        self.prices1 = []
        self.dates1 = []
        self.strokes1 = []
        Alamofire.request(Router.getAllOrder()).responseJSON { response in
            
            self.handleResult(.getAllOrder,response, completionHandler: { (json) in
                //得到全部订单，传给下一页
                var successCount = 0;
                let jsDataCount = json["data"].count
             
                
                if json["status"].int! == 200{
                    for i in 0..<jsDataCount {
                       
                        Alamofire.request(Router.getTripById(json["data"][i]["tripId"].int!)).responseJSON { response in
                            self.handleResult1(response, completionHandler: { (json) in
                                successCount += 1;
                                if successCount == jsDataCount {
                                    self.postNotification(notification: .shouldReloadData)
                                }
                                if json["status"].int!==200{
                                    if json["data"]["name"].string == nil{
                                        self.names1.append("")
                                        print(self.names1.count)
                                    }else{
                                        self.names1.append(json["data"]["name"].string!)
                                    }
                                    if json["data"]["describe"].string == nil{
                                        self.describes1.append("")
                                    }else{
                                        self.describes1.append(json["data"]["describe"].string!)
                                    }
                                    if json["data"]["go"][0].string == nil{
                                        self.dates1.append("")
                                    }else{
                                        self.dates1.append(json["data"]["go"][0].string!)
                                    }
                                    if json["data"]["price"].int == nil{
                                        self.prices1.append("")
                                    }else{
                                        self.prices1.append("\(json["data"]["price"].int!)")
                                    }
                                    if json["data"]["stroke"].string == nil{
                                        self.strokes1.append("")
                                    }else{
                                        self.strokes1.append(json["data"]["stroke"].string!)
                                    }
                                    
                                }
                                else{
                                    print("不存在")
                                }
                            })
                        }
                    }
                }
                else{
                    print("不存在")
                }
            })
        }
        //print(self.names.count)
    }
    
    
    
    func unPaidOrder() {
        self.names2 = []
        self.describes2 = []
        self.prices2 = []
        self.dates2 = []
        self.strokes2 = []
        Alamofire.request(Router.getUnpaidOrder()).responseJSON { response in
            self.handleResult(.getUnpaidOrder,response, completionHandler: { (json) in
                //得到全部订单，传给下一页
                if json["status"].int!==200{
                    var successCount = 0;
                    let jsDataCount = json["data"].count
                    for i in 0..<jsDataCount
                    {
                        Alamofire.request(Router.getTripById(json["data"][i]["tripId"].int!)).responseJSON { response in
                            self.handleResult1(response, completionHandler: { (json) in
                                print(json)
                                successCount += 1;
                                if successCount == jsDataCount {
                                    self.postNotification(notification: UserManager.Notification(rawValue: "ShouldReload")!)
                                }
                                //没放进去
                                if json["status"].int!==200{
                                    if json["data"]["name"].string == nil{
//                                        print(222222222222)
                                        self.names2.append("")
                                        
                                    }else{
//                                        print(111111111111111111)
                                        self.names2.append(json["data"]["name"].string!)
                                    }
                                    if json["data"]["describe"].string == nil{
                                        self.describes2.append("")
                                    }else{
                                        self.describes2.append(json["data"]["describe"].string!)
                                    }
                                    if json["data"]["go"][0].string == nil{
                                        self.dates2.append("")
                                    }else{
                                        self.dates2.append(json["data"]["go"][0].string!)
                                    }
                                    if json["data"]["price"].int == nil{
                                        self.prices2.append("")
                                    }else{
                                        self.prices2.append("\(json["data"]["price"].int!)")
                                    }
                                    if json["data"]["stroke"].string == nil{
                                        self.strokes2.append("")
                                    }else{
                                        self.strokes2.append(json["data"]["stroke"].string!)
                                    }
                                    
                                }
                                else{
                                    print("不存在")
                                }
                            })
                        }
                    }
                }
                else{
                    print("不存在")
                }
            })
        }

    }
    func successOrder() {
        self.names3 = []
        self.describes3 = []
        self.prices3 = []
        self.dates3 = []
        self.strokes3 = []
        Alamofire.request(Router.getSuccessOrder()).responseJSON { response in
            self.handleResult(.getSuccessOrder,response, completionHandler: { (json) in
                //得到全部订单，传给下一页
                if json["status"].int!==200{
                    for i in 0..<json["data"].count
                    {
                        //self.tour(tripId: json["data"][i]["tripId"].int!)
                        Alamofire.request(Router.getTripById(json["data"][i]["tripId"].int!)).responseJSON { response in
                            self.handleResult1(response, completionHandler: { (json) in
                                //print(json)
                                //没放进去
                                if json["status"].int!==200{
                                    if json["data"]["name"].string == nil{
                                        self.names3.append("")
                                        print(self.names3.count)
                                    }else{
                                        self.names3.append(json["data"]["name"].string!)
                                    }
                                    if json["data"]["describe"].string == nil{
                                        self.describes3.append("")
                                    }else{
                                        self.describes3.append(json["data"]["describe"].string!)
                                    }
                                    if json["data"]["go"][0].string == nil{
                                        self.dates3.append("")
                                    }else{
                                        self.dates3.append(json["data"]["go"][0].string!)
                                    }
                                    if json["data"]["price"].int == nil{
                                        self.prices3.append("")
                                    }else{
                                        self.prices3.append("\(json["data"]["price"].int!)")
                                    }
                                    if json["data"]["stroke"].string == nil{
                                        self.strokes3.append("")
                                    }else{
                                        self.strokes3.append(json["data"]["stroke"].string!)
                                    }
                                    
                                }
                                else{
                                    print("不存在")
                                }
                            })
                        }
                    }
                }
                else{
                    print("不存在")
                }
            })
        }

    }
    func collected() {
        self.images4 = []
        self.tits4 = []
        self.price4 = []
        self.collects4 = []
        self.describe4 = []
        Alamofire.request(Router.getCollected()).responseJSON { response in
            self.handleResult(.getCollected,response, completionHandler: { (json) in
                print(json)
                if json["status"].int!==200{
                    for i in 0..<json["data"].count
                    {
                        if json["data"][i]["id"].int == nil{
                            self.images4.append("")
                        }else{
                            self.images4.append("http://118.190.69.5:65530/trip/"+"\(json["data"][i]["id"].int!)"+"-1")
                        }
                        if json["data"][i]["name"].string == nil{
                            //print(1111111111)
                            self.tits4.append("")
                        }else{
                            //print(22222222222)
                            self.tits4.append(json["data"][i]["name"].string!)
                        }
                        if json["data"][i]["price"].int == nil{
                            self.price4.append("")
                        }else{
                            self.price4.append("\(json["data"][i]["price"].int!)")
                        }
                        if json["data"][i]["collection"].int == nil{
                            self.collects4.append("")
                        }else{
                            self.collects4.append("\(json["data"][i]["collection"].int!)")
                        }
                        if json["data"][i]["describe"].string == nil{
                            self.describe4.append("")
                        }else{
                            self.describe4.append(json["data"][i]["describe"].string!)
                        }
                    }
                }
                else{
                    print("不存在")
                }
            })
        }
        
    }
    func enlist() {
        self.images5 = []
        self.tits5 = []
        self.price5 = []
        self.collects5 = []
        self.describe5 = []
        Alamofire.request(Router.getEnlistInfo()).responseJSON { response in
            self.handleResult(.getEnlistInfo,response, completionHandler: { (json) in
                print(json)
                if json["status"].int! == 200 {
                    for i in 0..<json["data"].count
                    {
                        if json["data"][i]["id"].int == nil{
                            self.images5.append("")
                        }else{
                            self.images5.append("http://118.190.69.5:65530/trip/"+"\(json["data"][i]["id"].int!)"+"-1")
                        }
                        if json["data"][i]["departure"].string == nil{
                            
                            self.tits5.append("")
                        }else{
                            self.tits5.append(json["data"][i]["departure"].string! + " - " + json["data"][i]["destination"].string! + " - " + json["data"][i]["transportation"].string!)
                        }
                        if let bud = json["data"][i]["budget"].string {
                   
                            self.price5.append("预算" + bud)
                        } else {
                            self.price5 .append("")
                        }
                        if let str1 = json["data"][i]["existPeople"].int {
                            var s = ""
                            if let t = json["data"][i]["departureTime"].string {
                                let end = t.index(t.startIndex,offsetBy:10)
                                s = t.substring(to: end)
                            }
                            self.collects5.append("\(str1)"+"/"+"\(json["data"][i]["planPeople"].int!)人"+" 截至"+s)
                        } else {
                            self.collects5 .append("")
                        }
                        if let str = json["data"][i]["detailed"].string {
                            self.describe5.append(str)
                        } else {
                            self.describe5 .append("")
                        }
                    }
                }
                else{
                    print("不存在")
                }
            })
        }

    }
    
    func myPal() {
        self.images6 = []
        self.tits6 = []
        self.price6 = []
        self.collects6 = []
        self.describe6 = []
        Alamofire.request(Router.getMyPal()).responseJSON { response in
            self.handleResult(.getMyPal,response) { (json) in
                print(json)
                if json["status"].int!==200{
                    for i in 0..<json["data"].count
                    {
                        if json["data"][i]["id"].int == nil{
                            self.images6.append("")
                        }else{
                            self.images6.append("http://118.190.69.5:65530/trip/"+"\(json["data"][i]["id"].int!)"+"-1")
                        }
                        if json["data"][i]["departure"].string == nil{
                            
                            self.tits6.append("")
                        }else{
                            self.tits6.append(json["data"][i]["departure"].string! + " - " + json["data"][i]["destination"].string! + " - " + json["data"][i]["transportation"].string!)
                        }
                        if let bud = json["data"][i]["budget"].string {
                            
                            self.price6.append("预算" + bud)
                        } else {
                            self.price6 .append("")
                        }
                        if let str1 = json["data"][i]["existPeople"].int {
                            var s = ""
                            if let t = json["data"][i]["departureTime"].string {
                                let end = t.index(t.startIndex,offsetBy:10)
                                s = t.substring(to: end)
                            }
                            self.collects6.append("\(str1)"+"/"+"\(json["data"][i]["planPeople"].int!)人"+" 截至"+s)
                        } else {
                            self.collects6 .append("")
                        }
                        if let str = json["data"][i]["detailed"].string {
                            self.describe6.append(str)
                        } else {
                            self.describe6 .append("")
                        }
                    }
                } else{
                    print("不存在")
                }
            }
        }
        
    
    }
    
    func wannaGo() {
        self.images7 = []
        self.tits7 = []
        self.price7 = []
        self.collects7 = []
        self.describe7 = []
        Alamofire.request(Router.getWantGo()).responseJSON { response in
            self.handleResult(.getWantGo,response, completionHandler: { (json) in
                print(json)
                if json["status"].int!==200{
                    for i in 0..<json["data"].count
                    {
                        if json["data"][i]["id"].int == nil{
                            self.images7.append("")
                        }else{
                            self.images7.append("http://118.190.69.5:65530/trip/"+json["data"][i]["id"].string!+"-1")
                        }
                        if json["data"][i]["id"].string == nil{
                            //print(1111111111)
                            self.tits7.append("")
                        }else{
                            //print(22222222222)
                            self.tits7.append(json["data"][i]["id"].string!)
                        }
                        if json["data"][i]["goTime"].string == nil{
                            self.price7.append("")
                        }else{
                            self.price7.append(json["data"][i]["goTime"].string!)
                        }
                        if json["data"][i]["grade"].int == nil{
                            self.collects7.append("")
                        }else{
                            self.collects7.append("\(json["data"][i]["grade"].int!)")
                        }
                        if json["data"][i]["orderTime"].string == nil{
                            self.describe7.append("")
                        }else{
                            self.describe7.append(json["data"][i]["orderTime"].string!)
                        }
                    }
                }
                else{
                    print("不存在")
                }
            })
        }

    }
    func everGone() {
        self.images8 = []
        self.tits8 = []
        self.price8 = []
        self.collects8 = []
        self.describe8 = []
        Alamofire.request(Router.getEverGone()).responseJSON { response in
            self.handleResult(.getEverGone,response, completionHandler: { (json) in
                print(json)
                if json["status"].int!==200{
                    for i in 0..<json["data"].count
                    {
                        if json["data"][i]["id"].int == nil{
                            self.images8.append("")
                        }else{
                            self.images8.append("http://118.190.69.5:65530/trip/"+json["data"][i]["id"].string!+"-1")
                        }
                        if json["data"][i]["id"].string == nil{
                            //print(1111111111)
                            self.tits8.append("")
                        }else{
                            //print(22222222222)
                            self.tits8.append(json["data"][i]["id"].string!)
                        }
                        if json["data"][i]["goTime"].string == nil{
                            self.price8.append("")
                        }else{
                            self.price8.append(json["data"][i]["goTime"].string!)
                        }
                        if json["data"][i]["grade"].int == nil{
                            self.collects8.append("")
                        }else{
                            self.collects8.append("\(json["data"][i]["grade"].int!)")
                        }
                        if json["data"][i]["orderTime"].string == nil{
                            self.describe8.append("")
                        }else{
                            self.describe8.append(json["data"][i]["orderTime"].string!)
                        }
                    }
                }
                else{
                    print("不存在")
                }
            })
        }

    }
//    func tour(tripId:Int) {
//        Alamofire.request(Router.tour(tripId)).responseJSON { response in
//            self.handleResult1(response, completionHandler: { (json) in
//                //print(json)
//                //没放进去
//                if json["status"].int!==200{
//                    if json["data"]["name"].string == nil{
//                        print(1)
//                        self.names.append("")
//                        print(self.names.count)
//                    }else{
//                        self.names.append(json["data"]["name"].string!)
//                    }
//                    if json["data"]["describe"].string == nil{
//                        self.describes.append("")
//                    }else{
//                        self.describes.append(json["data"]["describe"].string!)
//                    }
//                    if json["data"]["go"][0].string == nil{
//                        self.dates.append("")
//                    }else{
//                        self.dates.append(json["data"]["go"][0].string!)
//                    }
//                    if json["data"]["price"].int == nil{
//                        self.prices.append("")
//                    }else{
//                        self.prices.append("\(json["data"]["price"].int!)")
//                    }
//                    if json["data"]["stroke"].string == nil{
//                        self.strokes.append("")
//                    }else{
//                        self.strokes.append(json["data"]["stroke"].string!)
//                    }
//
//                }
//                else{
//                    print("不存在")
//                }
//            })
//        }
//        //没打印
//        print(self.names.count)
//    }
    func setUserAvatar() {
        Alamofire.request(Router.setUserAvatar()).responseJSON { response in
            log(response, .url)
//            guard let image = response.result.value as? UIImage else {
//                log("convert to image failure", .error)
//                log(response, .error)
//                self.avatar = UIImage(named: "left_icon_defaultAvatar")
//                UserManager.postNotification(.didGetUserAvatarFailure)
//                return
//            }
//            self.avatar = image
//            UserManager.postNotification(.didGetUserAvatar)
        }
    }
    
    func userLogOut(){
        
        isLogIn = false
        
        password = ""
        username = ""
        tel = ""
        location = ""
        creditLevel = ""
        avatar = nil
        
        // 设置上次登录信息
        userDefaults.set(false, forKey: "didLogInLastTIme")
        userDefaults.set("", forKey: "tel")
        userDefaults.set("", forKey: "password")
        userDefaults.synchronize()
        postNotification(notification: .didLogout)
    }
    
    
    func logInWithLastTimeInfo() {
        if userDefaults.bool(forKey: "didLogInLastTIme") {
            let tel = userDefaults.string(forKey: "tel")
            let password = userDefaults.string(forKey: "password")
       
            self.login(tel: tel!, password: password!)
        }
    }
    
    
}
