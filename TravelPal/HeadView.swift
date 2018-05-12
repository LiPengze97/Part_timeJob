//
//  HeadView.swift
//  TravelPal
//
//  Created by Eric on 2018/4/11.
//  Copyright © 2018 INGSwifters. All rights reserved.
//

import UIKit

class HeadView: UIView {

  
    var imageHead: UIImageView!
    var textButton: UIButton!
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor(patternImage: UIImage(named: "personal_bg.jpg")!)
        imageHead = UIImageView(image: UIImage(named: "personal_person"))
        imageHead.frame = CGRect(x:SCREEN_WIDTH/2-40, y:30, width:80, height:80)
        
        imageHead.contentMode = .scaleAspectFill
        imageHead.layer.borderWidth=2
        imageHead.layer.borderColor = kRGBColorFromHex(rgbValue: 0x656565).cgColor
        imageHead.layer.masksToBounds = true
        imageHead.layer.cornerRadius = imageHead.frame.width/2
        addSubview(imageHead)
       
        textButton = UIButton(frame: CGRect(x: SCREEN_WIDTH/2-100, y: 120, width: 200, height: 20))
        textButton.titleLabel?.textAlignment = .center
        addSubview(textButton)
        
        
    }
    
    override func fillContents(_ content: Any?) {
        if UserManager.shared.isLogIn {
            if let img = UserManager.shared.Image {
                imageHead.image = img;
            }
            textButton.setTitle(UserManager.shared.tel, for: .normal)
        } else {
            textButton.setTitle("点击登录", for: .normal)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
