//
//  ChengGongTableViewCell.swift
//  ShiXun
//
//  Created by macbook on 2017/6/13.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit

class ChengGongTableViewCell: UITableViewCell {

    var color : UIView?
    var travelLabel: UILabel?
    var nameLabel :UILabel?
    var describeLabel :UILabel?
    var dateLabel: UILabel?
    var priceLabel: UILabel?
    var strokeLabel: UILabel?
    var clickLabel:UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 设置选中cell时无高亮等效果
        self.selectionStyle = .none
        color = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 8))
        color?.backgroundColor=UIColor(red: 242/255.0, green: 110/255.0, blue: 125/255.0, alpha: 1.0)
        nameLabel = UILabel(frame: CGRect(x: 16, y: 25, width: 100, height: 12))
        describeLabel = UILabel(frame: CGRect(x: 16, y: 44, width: 75, height: 12))
        travelLabel = UILabel(frame: CGRect(x: 110, y: 25, width: 35, height: 16))
        travelLabel?.text = "旅游"
        priceLabel = UILabel(frame: CGRect(x: SCREEN_WIDTH-100, y: 25, width: 100, height: 16))
        dateLabel = UILabel(frame: CGRect(x: 16, y: 65, width: SCREEN_WIDTH, height: 12))
        strokeLabel = UILabel(frame: CGRect(x: 16, y: 85, width: SCREEN_WIDTH, height: 12))
        clickLabel = UILabel(frame: CGRect(x: 16, y: 107, width: SCREEN_WIDTH, height: 12))
        clickLabel?.text = "点击查看详细订单"
        
        nameLabel?.font = UIFont.systemFont(ofSize: 16)
        travelLabel?.font = UIFont.systemFont(ofSize: 16)
        describeLabel?.font = UIFont.systemFont(ofSize: 12)
        priceLabel?.font = UIFont.systemFont(ofSize: 16)
        dateLabel?.font = UIFont.systemFont(ofSize: 12)
        strokeLabel?.font = UIFont.systemFont(ofSize: 12)
        clickLabel?.font = UIFont.systemFont(ofSize: 12)
        
        describeLabel?.textColor = kRGBColorFromHex(rgbValue: 0x282828)
        strokeLabel?.textColor = kRGBColorFromHex(rgbValue: 0x282828)
        clickLabel?.textColor = kRGBColorFromHex(rgbValue: 0x282828)
        priceLabel?.textColor = UIColor(red: 160/255.0, green: 135/255.0, blue: 193/255.0, alpha: 1.0)
        travelLabel?.textColor = UIColor(red: 160/255.0, green: 135/255.0, blue: 193/255.0, alpha: 1.0)
        
        self.contentView.addSubview(color!)
        self.contentView.addSubview(nameLabel!)
        self.contentView.addSubview(describeLabel!)
        self.contentView.addSubview(priceLabel!)
        self.contentView.addSubview(dateLabel!)
        self.contentView.addSubview(strokeLabel!)
        self.contentView.addSubview(travelLabel!)
        self.contentView.addSubview(clickLabel!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)!
    }
    
    func setupUI(beginString:String,destinationString:String,priceString:String,dateString:String,trafficString:String){
        
        self.nameLabel?.text=beginString
        self.priceLabel?.text=priceString
        self.describeLabel?.text=destinationString
        self.dateLabel?.text=dateString
        self.strokeLabel?.text=trafficString
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
  

}
