//
//  Exten.swift
//  Application
//
//  Created by Eric on 7/21/17.
//  Copyright © 2017 Eric. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func el_setBackgroundImage(named img: String){
        layer.contents = UIImage(named: img)?.cgImage
        layer.contentsGravity = kCAGravityResizeAspectFill
    }
    
    //to be overridden
    func fillContents(_ content: Any?) {}
    
    func addBottomLine(height: CGFloat = 0.75, color: UIColor = Config.themeGray, bottom: CGFloat = 1000, left: CGFloat = 0) {
        let separator = UIView()
        if color.cgColor.alpha == 1 {
            separator.backgroundColor = color.withAlphaComponent(0.6)
        }else {
            separator.backgroundColor = color
        }
        addSubview(separator)
        separator.snp.makeConstraints{ (make) in
            make.left.equalTo(left)
            make.right.equalTo(-left)
            make.height.equalTo(height)
            guard bottom != 1000 else {
                make.bottom.equalTo(self); return
            }
            make.bottom.equalTo(bottom)

        }
    }
    
    func addTapGest(target: Any?, action: Selector?) {
        let ges = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(ges)
    }
  
    
    ///该方法仅限之前 makeConstraint {} 里写过 make.width.equalTo(aValue)
    func updateWidth(_ w: CGFloat) {
        snp.updateConstraints { make in
            make.width.equalTo(w)
        }
    }
 
}

extension UITextField {
    
    func psdMod() {
        placeholder = "请输入密码"
        isSecureTextEntry = true
        clearsOnBeginEditing = true
        clearButtonMode = .whileEditing
        keyboardType = .asciiCapable
        autocorrectionType = .no
    }
    
    func addTitleLabel(_ label: UILabel, _ ofSize: CGFloat = 17) {
        label.textAlignment = .center
        label.textColor = Config.themeGray
        label.font = Config.themeFont(ofSize)
        addSubview(label)
        label.snp.makeConstraints{ make in
            make.bottom.equalTo(self.snp.top).inset(4)
            make.centerX.width.equalTo(self)
            make.height.equalTo(30)
        }
    }
    
    func addRightView(_ myView: UIView) {
        addSubview(myView)
        myView.snp.makeConstraints{ make in
            make.left.equalTo(self.snp.right)
            make.bottom.equalTo(self)
            make.size.equalTo(self.snp.height)
        }
    }
    
    func addConstraintY(centerY: CGFloat, right: CGFloat) {
        snp.makeConstraints{ (make) in
            make.height.equalTo(45)
            make.left.equalTo(right)
            make.right.equalTo(-right)
            make.centerY.equalTo(centerY)
        }
        
    }
    
}


extension UILabel {
    
    func animateText(_ duration: Double, goal: CGFloat) {
        textColor = Config.themeGray.withAlphaComponent(1-goal)
        UIView.animate(withDuration: duration, animations: {
            self.textColor = Config.themeGray.withAlphaComponent(goal)
        })
    }
    
}

extension UIColor {
    
    func getImage() -> UIImage {
        let rect = myRect(0, 0, 1, 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(cgColor)
        context?.fill(rect)
        let i = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return i ?? UIImage()
    }
    
}


extension UIViewController {
    
    func pushWithoutTab(_ vc: UIViewController, animated: Bool = true) {
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    
    func presentAlert(_ title: String?, _ msg: String?, _ style: UIAlertControllerStyle, actTitle: String, _ handler: ((UIAlertAction) -> Void)?) {
        let acon = UIAlertController(title: title, message: msg, preferredStyle: style)
        let aact = UIAlertAction(title: actTitle, style: .default, handler: handler)
        let aact1 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        acon.addAction(aact)
        acon.addAction(aact1)
        present(acon, animated: true, completion: nil)
        
    }
    
    
}

extension String {
    func len() -> Int {
        return NSString(string: self).length
    }
    
}








