//
//  LvbanInfo.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/14.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import Foundation
import SwiftyJSON


class CloseLvbanInfo{
    var id:String?
    var budget:String?
    var userId:String?
    var departure:String?
    var destination:String?
    var existPeople:String?
    var planPeople:String?
    var departureTime:String?
    var returnTime:String?
    var publishTime:String?
    var detailed:String?
    var type:String?
    var longitude:String?
    var latitude:String?
    var valid:String?
    
    init(json : JSON) {
        self.id = json["id"].stringValue
        self.budget = json["budget"].stringValue
        self.departureTime = json["departureTime"].stringValue
        self.detailed = json["detailed"].stringValue
        self.longitude = json["longitude"].stringValue
        self.latitude = json["latitude"].stringValue
        self.departure =  json["departure"].stringValue
        self.publishTime =  json["publishTime"].stringValue
        self.type =  json["type"].stringValue
//        self.returnTime = json["id"].stringValue
        self.userId = json["userId"].stringValue
        self.destination =  json["destination"].stringValue
        self.valid =  json["valid"].stringValue
        self.planPeople = json["planPeople"].stringValue
        self.existPeople = json["existPeople"].stringValue
        
    }

    
    
    }
