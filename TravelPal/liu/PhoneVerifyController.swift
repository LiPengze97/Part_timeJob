//
//  PhoneVerifyController.swift
//  打折啦
//
//  Created by Eric on 8/4/17.
//  Copyright © 2017 INGStudio. All rights reserved.
//

import Foundation
import Alamofire

let SignInNotification = "SomeoneSignIn"

class PhoneNumberController: SignUpBaseViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMainConstraint()
        
        labelTitle = UILabel()
        textField1?.keyboardType = .numberPad
        textField1?.placeholder = ph1
        textField1?.addTitleLabel(labelTitle!)
        
        bottomLabel = UILabel()
        setupAttributeLabel()
        addSubtitle()
    }
    
    
    func setupAttributeLabel() {
        
        view.addSubview(bottomLabel!)
        bottomLabel?.snp.makeConstraints{ make in
            make.height.equalTo(20)
            make.width.equalTo(ScreenWidth-50)
            make.bottom.equalTo(-10-numBoardSmall)
            make.centerX.equalTo(ScreenWidth/2)
        }
        let str1 = "已阅读并同意使用条款和隐私政策"
        let str1len = str1.len()
        let attStr = NSMutableAttributedString(string: str1)
        
        attStr.addAttribute(NSFontAttributeName, value: Config.themeFont(12), range: myRange(0,str1len))
        attStr.addAttribute(NSForegroundColorAttributeName, value: Config.themeGray, range: myRange(0,6))
        attStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: myRange(6, 4))
        attStr.addAttribute(NSForegroundColorAttributeName, value: Config.themeGray, range: myRange(10, 1))
        attStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: myRange(11, 4))
        
        bottomLabel?.attributedText = attStr
        bottomLabel?.textAlignment = .center
//        bottomLabel?.yb_addAttributeTapAction(["使用条款","隐私政策"]){
//            (str, range, int) in
//            self.navigationController?.pushViewController(WebViewController(), animated: true)
//        }
    }
    
    
    @objc override func nxt() {
        let txt = textField1!.text!
        guard textField1?.text?.len() == 11 && nxtValid else {
            labelSubtitle?.text = ph00
            return
        }
        guard Config.predicate(Regex.phone, txt) else {
            labelSubtitle?.text = "请输入正确的手机号"
            return
        }
        let codeVerify = CodeVerifyController()
        codeVerify.phone = txt
        self.navigationController?.pushViewController(codeVerify, animated: true)
 
    }
    
    
    func showTips() {
        
        let alertControl = UIAlertController(title: "提示", message: "该手机号已注册，是否立即登录？", preferredStyle: .alert)
        let phoneLog = UIAlertAction(title: "确定", style: .default, handler: { (alert) in
            self.navigationController?.popViewController(animated: true)
        })
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertControl.addAction(phoneLog)
        alertControl.addAction(cancel)
        present(alertControl, animated: true, completion: nil)
    }
    
    @objc override func valueChanged() {
        let txtLen = textField1?.text!.len()
        nxtValid = (txtLen == 11)
        labelTitle?.text = txtLen == 0 ? "" : ph1
        labelSubtitle?.text = ""
    }
    
    
    
}



