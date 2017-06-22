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
    let screenwidth = UIScreen.main.applicationFrame.size.width
    let screenheight = UIScreen.main.applicationFrame.size.height
    
    //cccccccccccccccccccccccccccccc
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
//        UserManager.shared.exists(tel: phoneText.text!)
//        UserManager.shared.signup(tel: phoneText.text!,password: passwordText.text!)
//        
        //ggggggggggggggggggggggggg
        UserManager.shared.signup(tel: phoneText.text!,password: passwordText.text!)
    }

    func closeButtonTapped() {
        
        if !UserManager.shared.isExist {
            if UserManager.shared.canRegister {
                self.noticeSuccess("注册成功")
                //跳转到主页面
                let secondViewController = PersonalViewController()
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    self.navigationController?.pushViewController(secondViewController, animated: true)
                })
            }
            else{
                self.noticeError("注册失败")
            }
            
        }
        else{
            //提示用户名已经存在
            self.noticeError("用户名已存在")
        }
    }
    //ccccccccccccccccccccccccccccccccccccccccc
    
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
        registBtn.addTarget(self, action: #selector(signupButtonTapped(_:)), for: .touchUpInside)
        
        self.view.addSubview(phoneText)
        self.view.addSubview(passwordText)
        self.view.addSubview(surepasswordText)
        self.view.addSubview(registBtn)
}

    //ccccccccccccccccccccccccccccccccccccc
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserManager.shared.exists(tel: phoneText.text!)
        UserManager.shared.signup(tel: phoneText.text!,password: passwordText.text!)
        UserManager.addObserver(observer: self, selector: .userDidSignup, notification: .didSignup)
        UserManager.addObserver(observer: self, selector: .userDidSignupFailure, notification: .didSignupFailure)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        notification.removeObserver(self)
        UserManager.removeObserver(observer: self, notification: .didSignup)
        UserManager.removeObserver(observer: self, notification: .didSignupFailure)
        textFieldResignFirstResponder()
    }
    
    // MARK: - Notifier Action
    
    func userDidSignup(notification: NSNotification) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.closeButtonTapped()
        })
    }
    
    func userDidSignupFailure(notification: NSNotification) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.closeButtonTapped()
        })
    }
    
    // MARK: - TextField Delegate
    
    /** 点击return隐藏键盘*/
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldResignFirstResponder() {
        [phoneText,passwordText,surepasswordText].forEach {
            $0.resignFirstResponder()
        }
    }
    
    /** 点击其他区域隐藏键盘*/
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        textFieldResignFirstResponder()
    }
    //cccccccccccccccccccccccc
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,alpha: 1.0)
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
        if !(password != nil) || !(surepassword != nil) {
            return false
        }
        var a = password?.compare(surepassword).rawValue
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
