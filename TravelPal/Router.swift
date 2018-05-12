//
//  Router.swift
//  ShiXun
//
//  Created by macbook on 2017/6/11.
//  Copyright © 2017年 macbook. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

enum Router: URLRequestConvertible {
    
    static let baseURLString = "http://118.190.69.5:65530"
    
    // MARK: - 用户模块
    
    ///用户名是否存在
    case exists(String)
    ///注册
    case signUp(String, String)
    case sendMsg(String)
    ///登录
    case logIn(String, String)
    ///获取用户信息
    case getUserInfo()
    ///设置用户信息
    case setUserInfo(String,String)
    ///上传用户头像
    case setUserAvatar()
    ///所有订单
    case getAllOrder()
    ///未支付订单
    case getUnpaidOrder()
    ///已成功
    case getSuccessOrder()
    ///收藏
    case getCollected()
    ///报名旅游信息
    case getEnlistInfo()
    ///我的旅伴
    case getMyPal()
    ///想去目的地
    case getWantGo()
    ///曾经去过的地方
    case getEverGone()
    ///获取商品
    case getTrip()
    ///根据id获取商品
    case getTripById(Int)
    ///上传远途旅伴
    case postTour(Parameters)
    ///上传近程玩伴
    case postNearby(Parameters)
    ///获取旅游消息
    case getTourism
    ///获取进程游玩信息case
    case getClose
    
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .exists:
            return .get
        case .signUp:
            return .post
        case .logIn:
            return .post
        case .getUserInfo:
            return .get
        case .setUserInfo:
            return .post
        case .setUserAvatar:
            return .post
        case .getAllOrder:
            return .get
        case .getUnpaidOrder:
            return .get
        case .getSuccessOrder:
            return .get
        case .getCollected:
            return .get
        case .getEnlistInfo:
            return .get
        case .getMyPal:
            return .get
        case .getWantGo:
            return .get
        case .getEverGone:
            return .get
        //获取商品
        case .getTrip:
            return .get
        case .getTripById:
            return .get
        case .postTour:
            return .post
        case .postNearby:
            return .post
        //旅游信息
        case .getTourism:
            return .get
        case .getClose:
            return .get
        case .sendMsg:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .exists:
            return "/common/exists"
        case .signUp:
            return "/common/registered"
        case .logIn:
            return "/common/login"
        case .getUserInfo:
            return "/user/userInfo"
        case .setUserInfo:
            return "/user/userInfo"
        case .setUserAvatar:
            return "/user/i/photo"
        case .getAllOrder:
            return "/user/myOrder"
        case .getUnpaidOrder:
            return "/user/notPay"
        case .getSuccessOrder:
            return "/user/hasPay"
        case .getCollected:
            return "/user/myCollection"
        case .getEnlistInfo:
            return "/user/userTourism"
        case .getMyPal:
            return "/user/userTourism"
        case .getWantGo:
            return "/user/hasGone"
        case .getEverGone:
            return "/user/hasGone"
        case .getTrip:
            return "/common/getTrip"
        case .getTripById:
            return "/common/getTripById"
        case .postTour:
            return "/user/addTourism"
        case .postNearby:
            return "/user/addClose"
        case .getTourism:
            return "/common/getTourism"
        case .getClose:
            return "/common/getClose"
        case .sendMsg:
            return "/common/sendMessage"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Router.baseURLString)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .exists(let tel):
            let params = ["id": tel]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .signUp(let tel, let password):
            let params = ["id": tel, "password": password]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .logIn(let tel, let password):
            let params = ["id": tel, "password": password]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .getUserInfo():
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: nil)
        case .setUserInfo(let username, let location):
            let params = ["username": username, "location": location]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .setUserAvatar():
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: nil)
        case .getAllOrder():
            let params = ["page": 1,"rows": 10]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .getUnpaidOrder():
            let params = ["page": 1,"rows": 10]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .getSuccessOrder():
            let params = ["page": 1,"rows": 10]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .getCollected():
            let params = ["page": 1,"rows": 10]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .getEnlistInfo():
            let params = ["page": 1,"rows": 10]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .getMyPal():
            let params = ["page": 1,"rows": 10]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .getWantGo():
            let params = ["page": 1,"rows": 10]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .getEverGone():
            let params = ["page": 1,"rows": 10]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .getTrip():
            let p = ["page": 1, "rows": 10]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: p)
        case .getTripById(let id):
            let params = ["id": id]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .postTour(let para):
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: para)
        case .postNearby(let para):
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: para)
        case .getTourism():
            let params = ["page": 1,"rows": 10]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .getClose():
            let params = ["page": 1,"rows": 10]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .sendMsg(let phone):
            let p = ["mobile": phone]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: p)
        }
    }
}
