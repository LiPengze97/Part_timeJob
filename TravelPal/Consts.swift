//
//  Consts.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/1.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import Foundation

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

let headSegmentArray = ["推荐","最新","热门","礼物","美食","生活","设计感","家居","数码","阅读","学生党","上班族","美妆","护理","运动户外","健康"]

open class BannerItem: NSObject {
    
    public var image: UIImage?, title: String?
    
    static func item(title: String, image: UIImage) -> BannerItem {
        let item = BannerItem()
        item.title = title
        item.image = image
        return item
    }
}
