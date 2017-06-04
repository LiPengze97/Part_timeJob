//
//  RegisterViewController.swift
//  ShiXun
//
//  Created by macbook on 2017/5/14.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    var phoneText : UITextField!
    var passwordText : UITextField!
    var surepasswordText : UITextField!
    var registBtn : UIButton!
    let screenwidth = UIScreen.main.applicationFrame.size.width
    let screenheight = UIScreen.main.applicationFrame.size.height
    
    func tapped(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "注册"
        self.view.backgroundColor = kRGBColorFromHex(rgbValue: 0xf2f2f2)
        
        phoneText = UITextField(frame: CGRect(x: 50, y: 115, width: screenwidth-100, height: 40))
        phoneText.placeholder = "请输入手机号"
        phoneText.layer.cornerRadius=25;
        phoneText.borderStyle = UITextBorderStyle.roundedRect
        phoneText.clearButtonMode=UITextFieldViewMode.whileEditing;
        phoneText.keyboardType = UIKeyboardType.numberPad
        
        passwordText = UITextField(frame: CGRect(x: 50, y: 180, width: screenwidth-100, height: 40))
        passwordText.placeholder = "请输入密码"
        passwordText.layer.cornerRadius=25;
        passwordText.borderStyle = UITextBorderStyle.roundedRect
        passwordText.clearButtonMode=UITextFieldViewMode.whileEditing;
        passwordText.isSecureTextEntry = true
        
        surepasswordText = UITextField(frame: CGRect(x: 50, y: 245, width: screenwidth-100, height: 40))
        surepasswordText.placeholder = "再次确认密码"
        surepasswordText.layer.cornerRadius=25;
        surepasswordText.borderStyle = UITextBorderStyle.roundedRect
        surepasswordText.clearButtonMode=UITextFieldViewMode.whileEditing;
        surepasswordText.isSecureTextEntry = true
        
        registBtn = UIButton(frame: CGRect(x: 50, y: 540, width: screenwidth-100, height: 50))
        registBtn.setTitle("注册", for: .normal)
        registBtn.backgroundColor = UIColor(red: 49/255.0, green: 181/255.0, blue: 142/255.0, alpha: 1.0)
        registBtn.layer.cornerRadius=25;
        registBtn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
        self.view.addSubview(phoneText)
        self.view.addSubview(passwordText)
        self.view.addSubview(surepasswordText)
        self.view.addSubview(registBtn)
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,alpha: 1.0)
    }
}
