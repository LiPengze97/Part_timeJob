//
//  HeadSegmentView.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/1.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

protocol HeadSegmentViewDelegate {
    func clickSegement(index: NSInteger)
}

class HeadSegmentView: UIView{
    var titleArray = Array<UIButton>()
    var redlineView = UIView()//??
    var scroll = UIScrollView()
    
    var delegate: HeadSegmentViewDelegate! = nil
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        scroll = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: self.width, height: self.height))
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.backgroundColor = UIColor.white
        self.addSubview(scroll)
        
        redlineView = UIView.init()
        redlineView.backgroundColor = UIColor.init(red: 13.0/255, green: 168.0/255, blue: 134.0/255, alpha: 1)
        scroll.addSubview(redlineView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sendData(titles: Array<String>) {
        var btnOffset:CGFloat = 0
        
        for i in 0...titles.count-1{
            let btn = UIButton.init(type: .custom)
            btn.setTitle(titles[i], for: .normal)
            btn.setTitleColor(UIColor.darkGray, for: .normal)
            btn.setTitleColor(UIColor.init(red: 13.0/255, green: 168.0/255, blue: 134.0/255, alpha: 1), for: .selected)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
            
            let size = UIButton.sizeOfLabel(customMaxWidth: SCREEN_WIDTH, systemFontSize: 14.0, filledTextString: titles[i])
            
            let originx = i != 0 ? CGFloat(15*2+btnOffset) : 15
            
            btn.frame = CGRect.init(x: originx, y: 14, width: size.width, height: size.height)
            btnOffset = btn.frame.maxX
            
            btn.titleLabel?.textAlignment = .center
            //btn.addTarget(self, action: #selector(), for: .touchUpInside)
            
            scroll.addSubview(btn)
            self.titleArray.append(btn)
            
            if i == 0 {
                btn.isSelected = true
                redlineView.frame = CGRect.init(x: 15, y: scroll.bottom-2, width: btn.width, height: 2)
            }
        }
        
        scroll.contentSize = CGSize.init(width: btnOffset+15, height: 25)
    }
    
    func changeSelectedItem(_ button: UIButton) {
        for btn: UIButton in self.titleArray{
            btn.isSelected = false
        }
        button.isSelected = true
        
        let array = self.titleArray as NSArray
        let index = array.index(of: button)
        UIView.animate(withDuration: 0.3) { 
            if index == 0{
                self.redlineView.frame = CGRect.init(x: 15, y: self.height-2, width: button.width, height: 2)
            }else{
                let preButton:UIButton = self.titleArray[index-1]
                let offsetX = preButton.frame.minX - 15*2
                self.scroll.scrollRectToVisible(CGRect.init(x: offsetX, y: 0, width: self.scroll.width, height: self.scroll.height), animated: true)
                self.redlineView.frame = CGRect.init(x: button.frame.minX, y: self.scroll.bottom-2, width: button.width, height: 2)
            }
        }
        delegate.clickSegement(index: index)
    }
    
    func getIndex(index: NSInteger) {
        for btn : UIButton in self.titleArray {
            btn.isSelected = false
        }
        let button = self.titleArray[index]
        button.isSelected = true
        UIView.animate(withDuration: 0.3) { 
            if index==0{
                self.redlineView.frame = CGRect.init(x: 15, y: self.height-2, width: button.width, height: 2)
            }else{
                
                let preButton:UIButton = self.titleArray[index-1]
                
                let offsetX = preButton.frame.minX - 15*2
                
                self.scroll.scrollRectToVisible(CGRect.init(x: offsetX, y: 0, width: self.scroll.width, height: self.scroll.height), animated: true)
                
                self.redlineView.frame = CGRect.init(x: button.frame.minX, y: self.scroll.bottom-2, width: button.width, height: 2)
            }
        }
    }
}
