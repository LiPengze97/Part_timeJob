//
//  RegisterViewController.swift
//  ShiXun
//
//  Created by macbook on 2017/5/14.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    var phoneText : UITextField!
    var passwordText : UITextField!
    var surepasswordText : UITextField!
    var registBtn : UIButton!
     var dissmissBtn:UIButton!
    
    let notification = NotificationCenter.default
    
    // MARK: - Button Action
    
    
    func signupButtonTapped(_ sender: UIButton) {
        
        guard isValidPhone(phoneText.text) else {
            //提示不合法
            self.noticeOnlyText("请输入合法手机号")
            return
        }
        guard isValidPassword(password: passwordText.text, surepassword: surepasswordText.text!) else {
            //提示不合法
            self.noticeOnlyText("两次密码不相同")
            return
        }
        
        UserManager.shared.signup(tel: phoneText.text!,password: passwordText.text!)
        
    }
    
    func closeButtonTapped() {
        
        if !UserManager.shared.isExist {
            if UserManager.shared.canRegister {
                self.noticeSuccess("注册成功")
 
                self.navigationController?.popToRootViewController(animated: true)
                
            } else{
                self.noticeError("注册失败")
            }
        } else {
            //提示用户名已经存在
            self.noticeError("用户名已存在")
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "注册"
        self.view.backgroundColor = kRGBColorFromHex(rgbValue: 0xf2f2f2)
        
        phoneText = UITextField(frame: CGRect(x: 35, y: 115, width: SCREEN_WIDTH-70, height: 44))
        phoneText.placeholder = "请输入手机号"
        phoneText.layer.cornerRadius=25;
        phoneText.borderStyle = UITextBorderStyle.roundedRect
        phoneText.clearButtonMode=UITextFieldViewMode.whileEditing;
        phoneText.keyboardType = UIKeyboardType.numberPad
        
        passwordText = UITextField(frame: CGRect(x: 35, y: 189, width: SCREEN_WIDTH-70, height: 44))
        passwordText.placeholder = "请输入密码"
        passwordText.layer.cornerRadius=25;
        passwordText.borderStyle = UITextBorderStyle.roundedRect
        passwordText.clearButtonMode=UITextFieldViewMode.whileEditing;
        passwordText.isSecureTextEntry = true
        
        surepasswordText = UITextField(frame: CGRect(x: 35, y: 260, width: SCREEN_WIDTH-70, height: 44))
        surepasswordText.placeholder = "再次确认密码"
        surepasswordText.layer.cornerRadius=25;
        surepasswordText.borderStyle = UITextBorderStyle.roundedRect
        surepasswordText.clearButtonMode=UITextFieldViewMode.whileEditing;
        surepasswordText.isSecureTextEntry = true
        
        registBtn = UIButton(frame: CGRect(x: 50, y: 540, width: SCREEN_WIDTH-100, height: 50))
        registBtn.setTitle("立即注册", for: .normal)
        registBtn.backgroundColor = UIColor(red: 49/255.0, green: 181/255.0, blue: 142/255.0, alpha: 1.0)
        registBtn.layer.cornerRadius=25;
        registBtn.addTarget(self, action: #selector(signupButtonTapped(_:)), for: .touchUpInside)
        
        let agreements = UILabel(frame: CGRect(x: 0, y: 540-35, width: SCREEN_WIDTH, height: 30))

        let str1 = "已阅读并同意使用条款和隐私政策"
        let attStr = NSMutableAttributedString(string: str1)
        func myRange(_ a: Int, _ b: Int) -> NSRange {
            return NSMakeRange(a, b)
        }
        attStr.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 12), range: myRange(0,15))
        attStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.gray, range: myRange(0,6))
        attStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue.withAlphaComponent(0.8), range: myRange(6, 4))
        attStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.gray, range: myRange(10, 1))
        attStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue.withAlphaComponent(0.8), range: myRange(11, 4))
        agreements.attributedText = attStr;
        agreements.textAlignment = .center
        
        
        dissmissBtn = UIButton.init(frame: CGRect.init(x: 12, y: 36, width: 15, height: 21))
        dissmissBtn.setImage(UIImage.init(named: "返回"), for: .normal)
        dissmissBtn.addTarget(self, action: #selector(dissmissVC), for: .touchUpInside)
        
        self.view.addSubview(phoneText)
        self.view.addSubview(passwordText)
        self.view.addSubview(surepasswordText)
        self.view.addSubview(dissmissBtn)
        self.view.addSubview(registBtn)
        view.addSubview(agreements)
    }
    
    func dissmissVC(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //ccccccccccccccccccccccccccccccccccccc
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserManager.addObserver(observer: self, selector: .userDidSignup, notification: .didSignup)
        UserManager.addObserver(observer: self, selector: .userDidSignupFailure, notification: .didSignupFailure)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        notification.removeObserver(self)
        UserManager.removeObserver(observer: self, notification: .didSignup)
        UserManager.removeObserver(observer: self, notification: .didSignupFailure)
 
    }
 
    // MARK: - Notifier Action
    
    func userDidSignup(notification: NSNotification) {
 
        self.closeButtonTapped()
    }
    
    func userDidSignupFailure(notification: NSNotification) {
       
        
        self.closeButtonTapped()
      
    }
    
    // MARK: - TextField Delegate
    
    /** 点击return隐藏键盘*/
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
  
    
    //cccccccccccccccccccccccccccc
    //判断手机号码是否合法
    func isValidPhone(_ phone: String?) -> Bool {
        
        guard let phone = phone else { return false }
        
        let regEx = "^1(3|4|5|7|8)\\d{9}$"
        
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", regEx)
        
        return phoneTest.evaluate(with: phone)
    }
    //判断密码是否合法
    func isValidPassword(password: String?,surepassword: String) -> Bool {
        if (password == nil) {
            return false
        }
        let a = password?.compare(surepassword).rawValue
        if a == 0 {
            return true
        }
        return false
    }
}

fileprivate extension Selector {
    static let signup = #selector(RegisterViewController.signupButtonTapped(_:))
    static let userDidSignup = #selector(RegisterViewController.userDidSignup(notification:))
    static let userDidSignupFailure = #selector(RegisterViewController.userDidSignupFailure(notification:))
}
