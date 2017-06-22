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
    
    //用户名是否存在
    case exists(String)
    //注册
    case signUp(String, String)
    //登录
    case logIn(String, String)
    //获取用户信息
    case getUserInfo()
    //设置用户信息
    case setUserInfo(String,String)
    //上传用户头像
    case setUserAvatar()
    case tap1()
    case tap2()
    case tap3()
    case tap4()
    case tap5()
    case tap6()
    case tap7()
    case tap8()
    //获取商品
    case tour(Int)
    
    //上传远途旅伴
    case postTour(Parameters)
    //上传近程玩伴
    case postNearby(Parameters)
    //获取旅游消息
    case getTourism
    
    
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
        case .tap1:
            return .get
        case .tap2:
            return .get
        case .tap3:
            return .get
        case .tap4:
            return .get
        case .tap5:
            return .get
        case .tap6:
            return .get
        case .tap7:
            return .get
        case .tap8:
            return .get
        //获取商品
        case .tour:
            return .get
        case .postTour:
            return .post
        case .postNearby:
            return .post
        //旅游信息
        case .getTourism:
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
        case .tap1:
            return "/user/myOrder"
        case .tap2:
            return "/user/notPay"
        case .tap3:
            return "/user/hasPay"
        case .tap4:
            return "/user/myCollection"
        case .tap5:
            return "/user/userTourism"
        case .tap6:
            return "/user/userTourism"
        case .tap7:
            return "/user/hasGone"
        case .tap8:
            return "/user/hasGone"
        case .tour:
            return "/common/getTripById"
        case .postTour:
            return "/user/addTourism"
        case .postNearby:
            return "/user/addClose"
        case .getTourism:
            return "/common/getTourism"
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
        case .tap1():
            let params = ["page": 1,"rows": 10]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .tap2():
            let params = ["page": 1,"rows": 10]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .tap3():
            let params = ["page": 1,"rows": 10]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .tap4():
            let params = ["page": 1,"rows": 2]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .tap5():
            let params = ["page": 1,"rows": 2]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .tap6():
            let params = ["page": 1,"rows": 2]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .tap7():
            let params = ["page": 1,"rows": 2]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .tap8():
            let params = ["page": 1,"rows": 2]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .tour(let id):
            let params = ["id": id]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
        case .postTour(let para):
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: para)
        case .postNearby(let para):
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: para)
        case .getTourism():
            let params = ["page": 1,"rows": 10]
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: params)
            
        }
    }
}
