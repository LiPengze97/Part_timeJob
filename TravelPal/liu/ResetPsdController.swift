//
//  ResetPsdController.swift
//  打折啦
//
//  Created by Eris on 2017/8/15.
//  Copyright © 2017年 INGStudio. All rights reserved.
//

import Foundation
import Alamofire

class ResetPsdController: SignUpBaseViewController {
    
    let ph = "绑定的邮箱/手机号"
    let plh = "您输入的账号不存在"
    override func viewDidLoad() {
        super.viewDidLoad()
        addMainConstraint()
    
        labelTitle = UILabel()
        textField1?.keyboardType = .emailAddress
        textField1?.placeholder = ph
        textField1?.addTitleLabel(labelTitle!)
        addSubtitle()
    }
    
    
    @objc override func nxt() {
        let txt = textField1!.text!
        guard nxtValid else {
            labelSubtitle?.text = plh; return
        }
        if Config.predicate(Regex.email, txt) {
 
            return
        }
        
        guard Config.predicate(Regex.phone, txt) else {
            labelSubtitle?.text = plh
            return
        }
     
        let codeC = CodeResetPsdController()
        codeC.phone = txt
        pushWithoutTab(codeC)
        //has signed up:
        //self.sendCode(of: txt, to: CodeResetPsdController())
        // self.labelSubtitle?.text = "该手机号尚未注册"
    }
 
    @objc override func valueChanged() {
        let txtLen = textField1?.text!.len()
        if txtLen == 0 {
            labelTitle?.text = ""
            nxtValid = false
        }else {
            labelTitle?.text = ph
            nxtValid = true
        }
        labelSubtitle?.text = ""
    }
    
}

class CodeResetPsdController: CodeVerifyController {
    
    override func nxt() {
        guard nxtValid else { return }
        let psdController = FinishResetController()
        psdController.phone = self.phone
        self.navigationController?.pushViewController(psdController, animated: true)
    }
 
}

class FinishResetController: SignUpBaseViewController {
    
    let ph = "请设置8-16位密码"
    var phone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMainConstraint()
        
        labelTitle = UILabel()
        textField1?.psdMod()
        textField1?.placeholder = ph
        textField1?.addTitleLabel(labelTitle!)
        addSubtitle()
    }

     @objc override func valueChanged() {
        let txtLen = textField1?.text!.len()
        nxtValid = (txtLen! >= 8)&&(txtLen! <= 16)
        labelTitle?.text = txtLen == 0 ? "" : ph
        labelSubtitle?.text = ""
    }
    
    @objc override func nxt() {
        view.endEditing(true)
        let txt = textField1!.text!
        guard nxtValid else { return }
        guard !txt.contains(" ") else {
            labelSubtitle?.text = "密码中不能含有空格"; return
        }
      self.navigationController?.popToRootViewController(animated: true)
   
    }

}




