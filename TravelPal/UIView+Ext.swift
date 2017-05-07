//
//  UIView+Ext.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/1.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

extension UIView {
    
    public var x: CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
    }
    
    public var y: CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    }

    public var left: CGFloat{
        
        get {
            return self.frame.origin.x
        }
        set{
            
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
        
    }

    public var right: CGFloat{
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set{
            
            var r = self.frame
            r.origin.x = newValue - r.size.width
            self.frame = r
        }
    }
    
    public var top: CGFloat{
        get {
            return self.frame.origin.y
        }
        set {
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    }
    
    public var bottom: CGFloat{
        
        get {
            return self.frame.origin.y+self.frame.size.height
        }
        set{
            
            var r = self.frame
            r.origin.y = newValue - self.frame.size.height
            self.frame = r
        }
        
    }
    
    public var width: CGFloat{
        
        get {
            return self.frame.size.width
        }
        set{
            var r = self.frame
            r.size.width = newValue
            self.frame = r
        }
        
    }
    
    public var height: CGFloat{
        
        get {
            return self.frame.size.height
        }
        set{
            
            var r = self.frame
            r.size.height = newValue
            self.frame = r
        }
        
    }
}

extension UIButton{
    class func sizeOfLabel(customMaxWidth: CGFloat, systemFontSize: CGFloat, filledTextString: String) -> CGSize {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: customMaxWidth, height: 0))
        label.text = filledTextString
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: systemFontSize)
        label.sizeToFit()
        
        let size = label.frame.size
        
        return size
    }
}
