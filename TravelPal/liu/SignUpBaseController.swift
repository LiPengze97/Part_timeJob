//
//  SignUpViewController.swift
//  打折啦
//
//  Created by Eric on 7/23/17.
//  Copyright © 2017 INGStudio. All rights reserved.
//


import Foundation
import UIKit
import SnapKit
import FDFullscreenPopGesture

///Web View Controller
class WebViewController: UIViewController {
    
    lazy var webView = { return UIWebView() }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        webView.loadRequest(URLRequest(url: URL(string: "https://baidu.com")!))
        view.addSubview(webView)
        webView.snp.makeConstraints{ make in
            make.size.centerX.equalTo(view)
        }
        
    }
    
}

/// 顶级父类
class SignUpBaseViewController: UIViewController {
    
    ///输入框上面的灰色输入提示
    var labelTitle: UILabel?
    ///第一个输入框
    var textField1: UITextField?
   
    ///输入框下面的红色提示
    var labelSubtitle: UILabel?
    ///下一个按钮
    var nextLabel: UIView?
    ///富文本
    var bottomLabel: UILabel?
    ///返回按钮
    var backButton: UIButton?
    
    ///点击下一步是否有响应
    var nxtValid: Bool!{
        didSet{
            if nxtValid {
                nextLabel?.el_setBackgroundImage(named: "next")
            }else{
                nextLabel?.el_setBackgroundImage(named: "next_1")
            }
        }
    }
    ///tf距离屏幕两侧的距离
    let right: CGFloat = 57
    
    //placeholders:
    let ph1 = "输入手机号码"
    let ph2 = "输入短信验证码"
    let ph3 = "输入你的昵称"
    let ph4 = "请设置密码"
    let ph00 = "手机号码格式有误"
    let ph01 = "验证码错误，请重新发送"
    let ph03 = "该昵称已被使用"
   
    override func viewDidLoad() {
        super.viewDidLoad()
    //MARK: - 对基本内容简单的初始化
        view.backgroundColor = UIColor.groupTableViewBackground
        fd_prefersNavigationBarHidden = false
        //view.setBackgroundImage(named: "unknown")
        
        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("取消", for: .normal)
        view.addSubview(cancelButton)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        cancelButton.snp.makeConstraints{ make in
            make.right.equalTo(-15)
            make.top.equalTo(25)
        }

        backButton = UIButton()
        backButton?.setTitle(" 返回", for: .normal)
        backButton?.setTitleColor(UIColor.black, for: .normal)
        //backButton?.setBackgroundImage(UIImage(named: "back"), for: .normal)
        backButton?.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(backButton!)
        backButton?.snp.makeConstraints{ make in
            make.left.equalTo(10)
            make.top.equalTo(28)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        textField1 = UITextField()
        textField1?.clearButtonMode = .whileEditing
        textField1?.textAlignment = .center
        textField1?.font = Config.themeFont(21)
        textField1?.delegate = self
        view.addSubview(textField1!)
        
        
    }
    
    func cancel() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    /**
     添加tf1（必须有）和下一步按钮
     - tf: tf1的centerY
     - nxt: 下一步按钮的bottom，equalTo(-numBoardSmall - nxt) 
     */
    func addMainConstraint(tf: CGFloat = ScreenHeight/2 - numBoardSmall/2, nxt: CGFloat = 0) {
        textField1?.addConstraintY(centerY: tf, right: right)
        textField1?.addBottomLine(height: 1, color: .lightGray)
        guard nxt != 0 else {
            addNextLabel(); return
        }
        addNextLabel(nxt)
    }
    
    func addNextLabel(_ offset: CGFloat = 70) {
        nextLabel = UIView()
        nxtValid = false
        let gesture = UITapGestureRecognizer(target: self, action: #selector(nxt))
        nextLabel?.addGestureRecognizer(gesture)
        view.addSubview(nextLabel!)
        nextLabel?.snp.makeConstraints{ make in
            make.right.equalTo(textField1!)
            make.bottom.equalTo(-numBoardSmall - offset)
            make.size.equalTo(38)
        }
    }
    func addSubtitle() {
        labelSubtitle = UILabel()
        labelSubtitle?.textAlignment = .center
        labelSubtitle?.textColor = UIColor.red
        labelSubtitle?.font = Config.themeFont(13)
        view.addSubview(labelSubtitle!)
        labelSubtitle?.snp.makeConstraints{ make in
            make.top.equalTo(textField1!.snp.bottom).offset(10)
            make.centerX.width.equalTo(textField1!)
            make.height.equalTo(24)
        }
    }

    ///点击下一步按钮的响应方法
    @objc func nxt() {}
    ///监听tf内容变化的响应方法
    @objc func valueChanged() {}
    ///返回按钮的响应方法
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    ///符合 点击下一步 初级条件 调用的方法
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(valueChanged), name: .UITextFieldTextDidChange, object: textField1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        NotificationCenter.default.removeObserver(self, name: .UITextFieldTextDidChange, object: textField1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField1?.becomeFirstResponder()
    }
    
}

extension SignUpBaseViewController: UITextFieldDelegate {
    
    
    
}







