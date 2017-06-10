//
//  TPFabuView.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/6/7.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

typealias BackClosureType = (_ anyObj: AnyObject) -> Void   // Closure type definition
typealias ItemClickedClosureType = (_ anyObj: AnyObject, _ index: Int) -> Void

class TPFabuView: UIView {

    public var closeClosure: BackClosureType?, bannerTouchClosure: ItemClickedClosureType?
    
    public var item_size: CGSize = CGSize(width: 60, height: 90)
    public var bannerViews: [TPBannerView] = []
    public var items: [BannerItem] = [] {
        didSet { layoutItems(items: items) }
    }
    
    public var close = UIButton(type: UIButtonType.custom)
    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.white
        close.size = CGSize(width: 35, height: 35)
        close.origin = CGPoint(x: UIScreen.width - close.width - 15 , y: 30)
        close.addTarget(self, action:#selector(close(_:)), for: .touchUpInside)
        self.addSubview(close)
    }
    
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
    func close(_ sender: UIButton) {
        if closeClosure != nil { closeClosure!(sender) }
    }
    
    func bannerClicked(_ sender: UIButton) {
        if bannerTouchClosure != nil { bannerTouchClosure!(self, sender.tag) }
    }
    
    private let rowCount = 3
    
    func layoutItems(items: Array<BannerItem>) {
        let gap: CGFloat = 15
        let width = self.width > 0 ? self.width : UIScreen.width
        let space = (width - CGFloat(rowCount) * item_size.width) / (CGFloat(rowCount) + 1)
        for (index, item) in items.enumerated() {
            let l = CGFloat(index % rowCount)
            let v = CGFloat(index / rowCount)
            let banner = TPBannerView()
            banner.size = CGSize(width: item_size.width, height: item_size.height)
            banner.x = space + (item_size.width + space) * l
            banner.y = gap + (item_size.height + gap) * v + 45
            self.addSubview(banner)
            banner.item = item
            if index == items.count - 1 {
                self.height = banner.bottom + 20
            }
            banner.icon.tag = index
            banner.icon.addTarget(self, action: #selector(bannerClicked(_:)), for: .touchUpInside)
            bannerViews.append(banner)
        }
    }


}
