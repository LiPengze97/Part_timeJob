//
//  DingDanCell.swift
//  ShiXun
//
//  Created by macbook on 2017/4/24.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit

class DingDanCell: UICollectionViewCell {
    var btn : myButton?
    var btnText:String = "" {
        didSet {
            //self.btn.titleLabel?.text=btnText
            self.btn?.setTitle(btnText, for: .normal)
        }
    }
    var btnImage:String = "" {
        didSet {
            //self.btn.imageView?.image = UIImage(named:btnImage)
            self.btn?.setImage(UIImage(named:btnImage), for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        btn = myButton.init(frame:CGRect(x:0,y:0,width:self.frame.width,height:self.frame.height))
        btn?.setTitle("", for: UIControlState.normal)
        btn?.imageView?.image = UIImage(named: "")
        self.addSubview(btn!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
