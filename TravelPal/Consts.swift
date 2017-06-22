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

let KArrorHeight = 10
let kPortraitMargin = 5
let kPortraitWidth = 70
let kPortraitHeight = 50

let kTitleWidth = 120
let kTitleHeight = 20


let kCalloutWidth = 200.0
let kCalloutHeight = 70.0

//   136     JBYpKy1rUGUvfsLIcmkv0kIhz9rAQWIHhUAxahX3SGc1aigJlG4K8V4jncyurMaQMPWhnkPdCquoAqUf48wh4zqLm/gKwSJw
//   178     IZZ+R6gxLCclMMV9L8tjWMfvrSIfMwqzri3X7DJoFvQB0gTNkJUlQ+UuXso/TnOYjO9zM7QhVnIqEhei5fI4dnVA7y0VlSVg

let USER_136_TOKEN = "JBYpKy1rUGUvfsLIcmkv0kIhz9rAQWIHhUAxahX3SGc1aigJlG4K8V4jncyurMaQMPWhnkPdCquoAqUf48wh4zqLm/gKwSJw"

let USER_178_TOKEN = "IZZ+R6gxLCclMMV9L8tjWMfvrSIfMwqzri3X7DJoFvQB0gTNkJUlQ+UuXso/TnOYjO9zM7QhVnIqEhei5fI4dnVA7y0VlSVg"

let headSegmentArray = ["远途旅伴","近程游玩","拼车","饮食","电影","购物"]

open class BannerItem: NSObject {
    
    public var image: UIImage?, title: String?
    
    static func item(title: String, image: UIImage) -> BannerItem {
        let item = BannerItem()
        item.title = title
        item.image = image
        return item
    }
}
