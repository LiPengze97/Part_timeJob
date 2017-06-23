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
        self.departureTime = json["departureTime"].stringValue
        self.detailed = json["id"].stringValue
        self.longitude = json["id"].stringValue
        self.latitude = json["id"].stringValue
        self.departure =  json["id"].stringValue
        self.publishTime =  json["id"].stringValue
        self.type =  json["id"].stringValue
        self.returnTime = json["id"].stringValue
        self.userId = json["id"].stringValue
        self.destination =  json["id"].stringValue
        self.valid =  json["id"].stringValue
        self.planPeople = json["id"].stringValue
        self.existPeople = json["id"].stringValue
        
    }

    
    
    }
