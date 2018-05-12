//
//  SignViewController.swift
//  ShiXun
//
//  Created by macbook on 2017/5/14.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit
 
class SignViewController: UIViewController, UITextFieldDelegate {

    var phoneText : UITextField!
    var passwordText : UITextField!
    var loginBtn : UIButton!
    var forgetBtn : UIButton!
    var registBtn : UIButton!
    var loginLable : UILabel!
    var weixinBtn : UIButton!
    var weiboBtn : UIButton!
    var qqBtn : UIButton!
    var dissmissBtn:UIButton!
    
    let notification = NotificationCenter.default
    
    // MARK: - Button Action
    
    func loginButtonTapped(_ sender: UIButton) {
        guard isValidPhone(phoneText.text) else {
            self.noticeOnlyText("请输入合法手机号")
            return
        }
        textFieldResignFirstResponder()
        UserManager.shared.login(tel: phoneText.text!,password: passwordText.text!)
    }
    
    func closeButtonTapped() {
        
        if UserManager.shared.isLogIn {
            self.noticeSuccess("登录成功")
          
            dissmissVC()
        }else{
           
            self.noticeError("登录失败")
        }
    }
    
    func showSignupButtonTapped(_ sender: UIButton) {
    
        if true {
            let regist = RegisterViewController()
            pushWithoutTab(regist)
        } else {
//            let phoneNumController = PhoneNumberController()
//            let nav = UINavigationController(rootViewController: phoneNumController)
//            nav.navigationBar.barTintColor = UIColor(patternImage: UIImage(named: "personal_bg.jpg")!)
//            present(nav, animated: true, completion: nil)
//            
        }
    }
   
    func forget(){
        //let RstC = ResetPsdController()
        let RstC = forgetViewController()
        pushWithoutTab(RstC)
    }
    func weibo(){
        
    }
    func weixin(){
        
    }
    
    func qq(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fd_prefersNavigationBarHidden = true
   
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "sign_bg")!)
        self.view.contentMode = .scaleAspectFill
        
        phoneText = UITextField(frame: CGRect(x: 50, y: 240, width: SCREEN_WIDTH-100, height: 40))
        phoneText.attributedPlaceholder=NSAttributedString(string: "手机号", attributes: [NSForegroundColorAttributeName: kRGBColorFromHex(rgbValue: 0x656565)])
        phoneText.textColor = kRGBColorFromHex(rgbValue: 0xffffff)
        phoneText.layer.borderWidth=1
        phoneText.layer.borderColor=kRGBColorFromHex(rgbValue: 0x656565).cgColor
        phoneText.layer.cornerRadius=10
        phoneText.clearButtonMode=UITextFieldViewMode.whileEditing;
        phoneText.keyboardType = UIKeyboardType.numberPad
        let phoneLeftView = UIView(frame: CGRect(x:10, y:10, width:40, height:40));
        let phonePic = UIImageView(frame: CGRect(x:10,y:10, width:20, height:20));
        phonePic.contentMode = .scaleAspectFill
        phonePic.image=UIImage(named: "sign_man.png");
        phoneLeftView.addSubview(phonePic)
        phoneText.leftView = phoneLeftView
        phoneText.leftViewMode=UITextFieldViewMode.always;
        
        passwordText = UITextField(frame: CGRect(x: 50, y: 300, width: SCREEN_WIDTH-100, height: 40))
        passwordText.isSecureTextEntry = true
        passwordText.attributedPlaceholder=NSAttributedString(string: "密码", attributes: [NSForegroundColorAttributeName: kRGBColorFromHex(rgbValue: 0x656565)])
        passwordText.textColor = kRGBColorFromHex(rgbValue: 0xffffff)
        passwordText.layer.borderWidth=1
        passwordText.layer.borderColor=kRGBColorFromHex(rgbValue: 0x656565).cgColor
        passwordText.layer.cornerRadius=10
        passwordText.clearButtonMode=UITextFieldViewMode.whileEditing;
        let passwordLeftView = UIView(frame: CGRect(x:0, y:0, width:40, height:40));
        let passwordPic = UIImageView(frame: CGRect(x:10,y:10, width:20, height:20));
        passwordPic.contentMode = .scaleAspectFill
        passwordPic.image=UIImage(named: "sign_lock.png");
        passwordLeftView.addSubview(passwordPic)
        passwordText.leftView = passwordLeftView
        passwordText.leftViewMode=UITextFieldViewMode.always;
        
        loginBtn = UIButton(frame: CGRect(x: 50, y: 380, width: SCREEN_WIDTH-100, height: 40))
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.backgroundColor = UIColor(red: 49/255.0, green: 181/255.0, blue: 142/255.0, alpha: 1.0)
        loginBtn.layer.cornerRadius=10;
        loginBtn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        forgetBtn = UIButton(frame: CGRect(x: SCREEN_WIDTH/2-70, y: 440, width: 70, height: 40))
        forgetBtn.setTitle("忘记密码", for: .normal)
        forgetBtn.titleLabel?.textColor=kRGBColorFromHex(rgbValue: 0x656565)
        forgetBtn.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        forgetBtn.addTarget(self, action: #selector(forget), for: .touchUpInside)
        
        registBtn = UIButton(frame: CGRect(x: SCREEN_WIDTH/2, y: 440, width: 70, height: 40))
        registBtn.setTitle("立即注册", for: .normal)
        registBtn.titleLabel?.textColor=kRGBColorFromHex(rgbValue: 0x656565)
        registBtn.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        registBtn.addTarget(self, action: #selector(showSignupButtonTapped(_:)), for: .touchUpInside)
        
        dissmissBtn = UIButton.init(frame: CGRect.init(x: 12, y: 36, width: 15, height: 21))
        dissmissBtn.setImage(UIImage.init(named: "返回"), for: .normal)
        dissmissBtn.addTarget(self, action: #selector(dissmissVC), for: .touchUpInside)
        
        weiboBtn = UIButton(frame: CGRect(x: SCREEN_WIDTH/2-100, y: 575, width: 50, height: 50))
        weiboBtn.setImage(UIImage(named: "weibo_icon_png.png"), for: .normal)
        weiboBtn.contentMode = .scaleAspectFill
        weiboBtn.layer.masksToBounds = true
        //设置圆角半径(宽度的一半)，显示成圆形。
        weiboBtn.layer.cornerRadius = weiboBtn.frame.width/2
        weiboBtn.addTarget(self, action: #selector(weibo), for: .touchUpInside)
        weixinBtn = UIButton(frame: CGRect(x: SCREEN_WIDTH/2-25, y: 575, width: 50, height: 50))
        weixinBtn.setImage(UIImage(named: "wechat_icon_png.png"), for: .normal)
        weixinBtn.contentMode = .scaleAspectFill
        weixinBtn.layer.masksToBounds = true
        //设置圆角半径(宽度的一半)，显示成圆形。
        weixinBtn.layer.cornerRadius = weixinBtn.frame.width/2
        weixinBtn.addTarget(self, action: #selector(weixin), for: .touchUpInside)
        qqBtn = UIButton(frame: CGRect(x: SCREEN_WIDTH/2+50, y: 575, width: 50, height: 50))
        qqBtn.setImage(UIImage(named: "qq_icon_png.png"), for: .normal)
        qqBtn.contentMode = .scaleAspectFill
        qqBtn.layer.masksToBounds = true
        //设置圆角半径(宽度的一半)，显示成圆形。
        qqBtn.layer.cornerRadius = qqBtn.frame.width/2
        qqBtn.addTarget(self, action: #selector(qq), for: .touchUpInside)
        
        loginLable = UILabel(frame: CGRect(x: 50, y: 530, width: SCREEN_WIDTH-100, height: 20))
        loginLable.textAlignment = .center
        loginLable.text = "—————  第三方登录  —————"
        loginLable.textColor = kRGBColorFromHex(rgbValue: 0xffffff)
        
        self.view.addSubview(phoneText)
        self.view.addSubview(passwordText)
        self.view.addSubview(loginBtn)
        self.view.addSubview(forgetBtn)
        self.view.addSubview(registBtn)
        self.view.addSubview(loginLable)
        self.view.addSubview(weiboBtn)
        self.view.addSubview(weixinBtn)
        self.view.addSubview(dissmissBtn)
        self.view.addSubview(qqBtn)
    }

    func dissmissVC(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //ccccccccccccccccccccccccccccccccccccccccc
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
        
        UserManager.addObserver(observer: self, selector: .userDidLogin, notification: .didLogin)
        UserManager.addObserver(observer: self, selector: .userDidLoginFailure, notification: .didLoginFailure)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        notification.removeObserver(self)
        UserManager.removeObserver(observer: self, notification: .didLogin)
        UserManager.removeObserver(observer: self, notification: .didLoginFailure)
        textFieldResignFirstResponder()
    }


    // MARK: - Notifier Action
    
    func userDidLogin(notification: NSNotification) {
        self.closeButtonTapped()
    }
    
    func userDidLoginFailure(notification: NSNotification) {
      
        self.closeButtonTapped()
       
    }
    
    // MARK: - TextField Delegate
    
    /** 点击return隐藏键盘*/
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /** 点击其他区域隐藏键盘*/
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !phoneText.isExclusiveTouch {
            phoneText.resignFirstResponder()
        }
        if !passwordText.isExclusiveTouch {
            passwordText.resignFirstResponder()
        }
        //textFieldResignFirstResponder()
    }
    
    func textFieldResignFirstResponder() {
        phoneText.resignFirstResponder()
        passwordText.resignFirstResponder()
    }
    
    //判断手机号码是否合法
    func isValidPhone(_ phone: String?) -> Bool {
        
        guard let phone = phone else { return false }
        
        let regEx = "^1(3|4|5|7|8)\\d{9}$"
        
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", regEx)
        
        return phoneTest.evaluate(with: phone)
    }
   
}
 
fileprivate extension Selector {
    static let login = #selector(SignViewController.loginButtonTapped(_:))
    static let userDidLogin = #selector(SignViewController.userDidLogin(notification:))
    static let userDidLoginFailure = #selector(SignViewController.userDidLoginFailure(notification:))
    static let showSignup = #selector(SignViewController.showSignupButtonTapped(_:))
}
