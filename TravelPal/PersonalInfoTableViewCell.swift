//
//  PersonalInfoTableViewCell.swift
//  ShiXun
//
//  Created by macbook on 2017/6/9.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit

class PersonalInfoTableViewCell: UITableViewCell {

    var titleLabel: UILabel?
    
    let screenwidth = UIScreen.main.applicationFrame.size.width
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 设置选中cell时无高亮等效果
        self.selectionStyle = .none
        
        titleLabel = UILabel(frame: CGRect(x: 12, y: 0, width: screenwidth-40, height: self.frame.height))
        titleLabel?.font = UIFont.systemFont(ofSize: 17)
        titleLabel?.textColor = kRGBColorFromHex(rgbValue: 0x282828)
        self.contentView.addSubview(titleLabel!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)!
    }
    
    func setupUI(titleString:String){
        self.titleLabel?.text=titleString
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,alpha: 1.0)
    }
}
