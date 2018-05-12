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
        imageview = UIImageView(frame: CGRect(x: 15, y: 10, width: 135, height: 80))
        titleLabel = UILabel(frame: CGRect(x: 165, y: 20, width: SCREEN_WIDTH, height: 20))
        priceLabel = UILabel(frame: CGRect(x: 260, y: 30, width: SCREEN_WIDTH-260, height: 40))
        collectLabel = UILabel(frame: CGRect(x: 165, y: 30, width: 95, height: 40))
        siteLabel = UILabel(frame: CGRect(x: 165, y: 50, width: 186, height: 40))

        titleLabel?.font = UIFont.systemFont(ofSize: 17)
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
        
        let url = imageString
        let urlStr = NSURL(string: url)!
        let nsd = NSData(contentsOf: urlStr as URL)
        
        var img: UIImage? = nil
        if nsd != nil {
            img = UIImage(data: nsd! as Data)!
            self.imageview?.image=img
        }
        else{
            self.imageview?.image = UIImage(named: "xiamen.jpg")
        }
        
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

  

}
