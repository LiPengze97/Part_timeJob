//
//  forgetViewController.swift
//  ShiXun
//
//  Created by macbook on 2017/6/1.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit

class forgetViewController: UIViewController {

    var phoneText : UITextField!
    var passwordText : UITextField!
    var surepasswordText : UITextField!
    var sureBtn : UIButton!
    var getBtn : UIButton!
 
    var dissmissBtn:UIButton!
    func get(){
        
    }
    func sure(){
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "重置密码"
        
        self.view.backgroundColor = kRGBColorFromHex(rgbValue: 0xf2f2f2)
        
        phoneText = UITextField(frame: CGRect(x: 50, y: 115, width: SCREEN_WIDTH-100, height: 40))
        phoneText.placeholder = "请输入你的手机号"
        phoneText.layer.cornerRadius=25;
        phoneText.borderStyle = UITextBorderStyle.roundedRect
        phoneText.clearButtonMode=UITextFieldViewMode.whileEditing;
        phoneText.keyboardType = UIKeyboardType.numberPad
        
        passwordText = UITextField(frame: CGRect(x: 50, y: 190, width: (SCREEN_WIDTH-100)/2, height: 40))
        passwordText.placeholder = "请输入验证码"
        passwordText.layer.cornerRadius=25;
        passwordText.borderStyle = UITextBorderStyle.roundedRect
        passwordText.clearButtonMode=UITextFieldViewMode.whileEditing;
        passwordText.isSecureTextEntry = true
        
        surepasswordText = UITextField(frame: CGRect(x: 50, y: 265, width: SCREEN_WIDTH-100, height: 40))
        surepasswordText.placeholder = "重置密码"
        surepasswordText.layer.cornerRadius=25;
        surepasswordText.borderStyle = UITextBorderStyle.roundedRect
        surepasswordText.clearButtonMode=UITextFieldViewMode.whileEditing;
        surepasswordText.isSecureTextEntry = true
        
        sureBtn = UIButton(frame: CGRect(x: 50, y: SCREEN_HEIGHT-320, width: SCREEN_WIDTH-100, height: 50))
        sureBtn.setTitle("确认重置", for: .normal)
        sureBtn.backgroundColor = UIColor(red: 49/255.0, green: 181/255.0, blue: 142/255.0, alpha: 1.0)
        sureBtn.layer.cornerRadius=25;
        sureBtn.addTarget(self, action: #selector(sure), for: .touchUpInside)
        
        getBtn = UIButton(frame: CGRect(x: 25+SCREEN_WIDTH/2, y: 190, width: SCREEN_WIDTH/2-50, height: 40))
        getBtn.setTitle("获取验证码", for: .normal)
        
        getBtn.backgroundColor = UIColor(red: 49/255.0, green: 181/255.0, blue: 142/255.0, alpha: 1.0)
        getBtn.layer.cornerRadius=10;
        getBtn.addTarget(self, action: #selector(get), for: .touchUpInside)
        
        dissmissBtn = UIButton.init(frame: CGRect.init(x: 12, y: 36, width: 15, height: 21))
        dissmissBtn.setImage(UIImage.init(named: "返回"), for: .normal)
        dissmissBtn.addTarget(self, action: #selector(dissmissVC), for: .touchUpInside)
        
        self.view.addSubview(phoneText)
        self.view.addSubview(passwordText)
        self.view.addSubview(surepasswordText)
        self.view.addSubview(dissmissBtn)
        self.view.addSubview(sureBtn)
        self.view.addSubview(getBtn)

    }

    func dissmissVC(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
   
}
