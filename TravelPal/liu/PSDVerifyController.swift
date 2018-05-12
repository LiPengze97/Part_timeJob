//
//  NameVerifyController.swift
//  打折啦
//
//  Created by Eric on 8/4/17.
//  Copyright © 2017 INGStudio. All rights reserved.
//

import Foundation
import Alamofire

class PSDVerifyController: SignUpBaseViewController {
    
   
    let plhd2 = "密码格式不正确"
    
    var phone = ""
    let titleSize: CGFloat = 16
    ///第二个输入框
    var textField2: UITextField?
    lazy var labelTitle2 = UILabel()
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let inset:CGFloat = 30
        addMainConstraint(tf: ScreenHeight/2 - numBoardSmall/2 - inset, nxt: 45)
        textField1?.placeholder = "请设置密码"
        textField1?.isSecureTextEntry = true
        textField2 = UITextField()
        textField1?.keyboardType = .asciiCapable
        textField1?.autocorrectionType = .no
        textField2?.isSecureTextEntry = true
        textField2?.keyboardType = .asciiCapable
        textField2?.autocorrectionType = .no
        textField2?.clearButtonMode = .whileEditing
        textField2?.textAlignment = .center
        textField2?.font = Config.themeFont(21)
        textField1?.returnKeyType = .next
        textField2?.returnKeyType = .go
        textField2?.delegate = self
        textField2?.placeholder = "重复密码"
        view.addSubview(textField2!)
        textField2?.snp.makeConstraints{ make in
            make.height.equalTo(45)
            make.left.equalTo(right)
            make.right.equalTo(-right)
            make.top.equalTo(textField1!.snp.bottom).offset(10)
        }
        textField2?.addBottomLine(height: 1)
        textField2?.keyboardType = .asciiCapable
        textField2?.autocorrectionType = .no
        //其他初始化
        labelTitle = UILabel()
        textField1?.addTitleLabel(labelTitle!, titleSize)
        textField2?.addTitleLabel(labelTitle2, titleSize)
        labelTitle2.textColor = Config.themeGray.withAlphaComponent(0)
        nxtValid = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(valueChanged2), name: .UITextFieldTextDidChange, object: textField2)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: .UITextFieldTextDidChange, object: textField2)
    }
    ///对tf1 的监听
    @objc override func valueChanged() {
        labelTitle?.text = "输入密码"
        let txtLen = textField1!.text!.len()
        labelTitle?.textColor = txtLen == 0 ?
            UIColor.clear : Config.themeGray
        
    }
    ///对tf2 的监听
    @objc func valueChanged2() {
        labelTitle2.text = "重复密码"
        let txtLen = textField2!.text!.len()
        if txtLen == 0 {
            unDrag(duration: 0.2)
        }else {
            drag(duration: 0.2)
        }
        
    }
    ///下移动画
    func drag(duration: Double, _ color: UIColor = Config.themeGray) {
        
        UIView.animate(withDuration: duration, animations: {
            self.textField2?.snp.updateConstraints{ make in
                make.top.equalTo(self.textField1!.snp.bottom).offset(30)
                self.labelTitle2.textColor = color.withAlphaComponent(1)
            }
            self.view.layoutIfNeeded()
        })
    }
    func unDrag(duration: Double) {
        
        UIView.animate(withDuration: duration, animations: {
            self.textField2?.snp.updateConstraints{ make in
                make.top.equalTo(self.textField1!.snp.bottom).offset(10)
                self.labelTitle2.textColor = Config.themeGray.withAlphaComponent(0)
            }
            self.view.layoutIfNeeded()
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case textField1!: textField2!.becomeFirstResponder()
        case textField2!: nxt()
        default: break
        }
        return true
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc override func nxt() {
        view.endEditing(true)
        let psd0 = (textField1?.text)!
        let psd = (textField2?.text)!
        guard psd0 != "" else{
            warn(1, "密码不能为空")
            return
        }
        guard psd != "" else {
            warn(2, "密码不能为空")
            return
        }
        guard Config.predicate(Regex.pswd, psd0) else{
            warn(1, plhd2)
            return
        }
        guard psd0 == psd else {
            warn(2, "两次输入密码不相同")
            return
        }
        navigationController?.popToRootViewController(animated: true)
    }
   
    func warn(_ tf: Int, _ content: String) {
        if tf == 1 {
            labelTitle?.text = content
            labelTitle?.textColor = UIColor.red.withAlphaComponent(0.5)
        }else{
            labelTitle2.text = content
            labelTitle2.textColor = UIColor.red.withAlphaComponent(0.5)
            if textField2?.text == "" {
                drag(duration: 0.2, UIColor.red.withAlphaComponent(0.5))
            }
        }
        
    }
    
}


