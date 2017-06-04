//
//  SignViewController.swift
//  ShiXun
//
//  Created by macbook on 2017/5/14.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit

class SignViewController: UIViewController {

    var phoneText : UITextField!
    var passwordText : UITextField!
    var loginBtn : UIButton!
    var forgetBtn : UIButton!
    var registBtn : UIButton!
    var loginLable : UILabel!
    var weixinBtn : UIButton!
    var weiboBtn : UIButton!
    var qqBtn : UIButton!
    let screenwidth = UIScreen.main.applicationFrame.size.width
    let screenheight = UIScreen.main.applicationFrame.size.height
    
    func login(){
        
    }
    func forget(){
        let secondViewController = forgetViewController()
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
    func regist(){
        let secondViewController = RegisterViewController()
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
    func weibo(){
        
    }
    func weixin(){
        
    }
    func qq(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 43/255.0, green: 34/255.0, blue: 44/255.0, alpha: 1.0)
        phoneText = UITextField(frame: CGRect(x: 50, y: 240, width: screenwidth-100, height: 40))
        //phoneText.placeholder = "手机号"
        phoneText.attributedPlaceholder=NSAttributedString(string: "手机号", attributes: [NSForegroundColorAttributeName: kRGBColorFromHex(rgbValue: 0x656565)])
        phoneText.textColor = kRGBColorFromHex(rgbValue: 0x656565)
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
        
        passwordText = UITextField(frame: CGRect(x: 50, y: 300, width: screenwidth-100, height: 40))
        //passwordText.placeholder = "密码"
        passwordText.attributedPlaceholder=NSAttributedString(string: "手机号", attributes: [NSForegroundColorAttributeName: kRGBColorFromHex(rgbValue: 0x656565)])
        passwordText.textColor = kRGBColorFromHex(rgbValue: 0x656565)
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
        
        loginBtn = UIButton(frame: CGRect(x: 50, y: 380, width: screenwidth-100, height: 40))
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.backgroundColor = UIColor(red: 49/255.0, green: 181/255.0, blue: 142/255.0, alpha: 1.0)
        loginBtn.layer.cornerRadius=10;
        loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        forgetBtn = UIButton(frame: CGRect(x: screenwidth/2-70, y: 440, width: 70, height: 40))
        forgetBtn.setTitle("忘记密码", for: .normal)
        forgetBtn.titleLabel?.textColor=kRGBColorFromHex(rgbValue: 0x656565)
        forgetBtn.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        forgetBtn.addTarget(self, action: #selector(forget), for: .touchUpInside)
        
        registBtn = UIButton(frame: CGRect(x: screenwidth/2, y: 440, width: 70, height: 40))
        registBtn.setTitle("立即注册", for: .normal)
        registBtn.titleLabel?.textColor=kRGBColorFromHex(rgbValue: 0x656565)
        registBtn.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        registBtn.addTarget(self, action: #selector(regist), for: .touchUpInside)
        
        weiboBtn = UIButton(frame: CGRect(x: screenwidth/2-100, y: 600, width: 50, height: 50))
        weiboBtn.setImage(UIImage(named: "weibo_icon_png.png"), for: .normal)
        weiboBtn.contentMode = .scaleAspectFill
        weiboBtn.layer.masksToBounds = true
        //设置圆角半径(宽度的一半)，显示成圆形。
        weiboBtn.layer.cornerRadius = weiboBtn.frame.width/2
        weiboBtn.addTarget(self, action: #selector(weibo), for: .touchUpInside)
        weixinBtn = UIButton(frame: CGRect(x: screenwidth/2-25, y: 600, width: 50, height: 50))
        weixinBtn.setImage(UIImage(named: "wechat_icon_png.png"), for: .normal)
        weixinBtn.contentMode = .scaleAspectFill
        weixinBtn.layer.masksToBounds = true
        //设置圆角半径(宽度的一半)，显示成圆形。
        weixinBtn.layer.cornerRadius = weixinBtn.frame.width/2
        weixinBtn.addTarget(self, action: #selector(weixin), for: .touchUpInside)
        qqBtn = UIButton(frame: CGRect(x: screenwidth/2+50, y: 600, width: 50, height: 50))
        qqBtn.setImage(UIImage(named: "qq_icon_png.png"), for: .normal)
        qqBtn.contentMode = .scaleAspectFill
        qqBtn.layer.masksToBounds = true
        //设置圆角半径(宽度的一半)，显示成圆形。
        qqBtn.layer.cornerRadius = qqBtn.frame.width/2
        qqBtn.addTarget(self, action: #selector(qq), for: .touchUpInside)
        
        loginLable = UILabel(frame: CGRect(x: 50, y: 555, width: screenwidth-100, height: 20))
        loginLable.text = "——————  第三方登录  ——————"
        loginLable.textColor = kRGBColorFromHex(rgbValue: 0xffffff)
        
        self.view.addSubview(phoneText)
        self.view.addSubview(passwordText)
        self.view.addSubview(loginBtn)
        self.view.addSubview(forgetBtn)
        self.view.addSubview(registBtn)
        self.view.addSubview(loginLable)
        self.view.addSubview(weiboBtn)
        self.view.addSubview(weixinBtn)
        self.view.addSubview(qqBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,alpha: 1.0)
    }
}
