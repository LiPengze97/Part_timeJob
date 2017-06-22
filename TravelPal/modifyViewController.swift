//
//  modifyViewController.swift
//  ShiXun
//
//  Created by macbook on 2017/6/21.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit

class modifyViewController: UIViewController {

    var textField : UITextField!
    var btn : UIButton!
    var tit : String!
    let screenwidth = UIScreen.main.applicationFrame.size.width
    
    func tapped(){
        switch tit {
        case "昵称":
            UserManager.shared.username = textField.text!
            let second = PersonalInfoViewController()
            self.navigationController?.popViewController(animated: true)
            UserManager.shared.setUserInfo(username: textField.text!, location: UserManager.shared.location)
        case "所在地":
            UserManager.shared.location = textField.text!
            let second = PersonalInfoViewController()
            self.navigationController?.popViewController(animated: true)
        default:
            UserManager.shared.username = textField.text!
            let second = PersonalInfoViewController()
            self.navigationController?.popViewController(animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = tit
        
        self.view.backgroundColor = UIColor.white
        textField = UITextField(frame: CGRect(x: 0, y: 80, width: screenwidth, height: 40))
        textField.attributedPlaceholder=NSAttributedString(string: tit, attributes: [NSForegroundColorAttributeName: kRGBColorFromHex(rgbValue: 0x656565)])
        //textField.textColor = kRGBColorFromHex(rgbValue: 0xffffff)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = kRGBColorFromHex(rgbValue: 0x656565).cgColor
        textField.clearButtonMode=UITextFieldViewMode.whileEditing;
        btn = UIButton(frame: CGRect(x: 0, y: 150, width: screenwidth, height: 40))
        btn.setTitle("保存", for: .normal)
        btn.backgroundColor = UIColor(red: 49/255.0, green: 181/255.0, blue: 142/255.0, alpha: 1.0)
        btn.layer.cornerRadius=10;
        btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        self.view.addSubview(textField)
        self.view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,alpha: 1.0)
    }

}
