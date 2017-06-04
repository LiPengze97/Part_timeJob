//
//  ProductTableViewCell.swift
//  ShiXun
//
//  Created by macbook on 2017/5/1.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    var imageview: UIImageView?
    var titleLabel: UILabel?
    var priceLabel: UILabel?
    var collectLabel: UILabel?
    var siteLabel:UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 设置选中cell时无高亮等效果
        self.selectionStyle = .none
        imageview = UIImageView(frame: CGRect(x: 20, y: 10, width: 135, height: 80))
        titleLabel = UILabel(frame: CGRect(x: 176, y: 20, width: 100, height: 20))
        priceLabel = UILabel(frame: CGRect(x: 256, y: 30, width: 100, height: 40))
        collectLabel = UILabel(frame: CGRect(x: 176, y: 30, width: 100, height: 40))
        siteLabel = UILabel(frame: CGRect(x: 176, y: 50, width: 180, height: 40))

        //titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 17)
        //priceLabel?.textAlignment = .center
        priceLabel?.font = UIFont.systemFont(ofSize: 12)
        collectLabel?.font = UIFont.systemFont(ofSize: 12)
        siteLabel?.font = UIFont.systemFont(ofSize: 12)
        titleLabel?.textColor = kRGBColorFromHex(rgbValue: 0x282828)
        priceLabel?.textColor = kRGBColorFromHex(rgbValue: 0xff8900)
        collectLabel?.textColor = kRGBColorFromHex(rgbValue: 0xff8900)
        siteLabel?.textColor = kRGBColorFromHex(rgbValue: 0x656565)
        self.contentView.addSubview(imageview!)
        self.contentView.addSubview(titleLabel!)
        self.contentView.addSubview(priceLabel!)
        self.contentView.addSubview(collectLabel!)
        self.contentView.addSubview(siteLabel!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)!
    }
    
    func setupUI(imageString:String,titleString:String,priceString:String,collectString:String,siteString:String){
        
        self.imageview?.image=UIImage(named: imageString)
        self.titleLabel?.text=titleString
        self.priceLabel?.text=priceString
        self.collectLabel?.text=collectString
        self.siteLabel?.text=siteString
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,alpha: 1.0)
    }

}
