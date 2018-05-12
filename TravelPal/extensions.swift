//
//  UIView+Ext.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/1.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit


extension UIViewController {
    func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,alpha: 1.0)
    }
}

extension UIView {
    

    
    func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,alpha: 1.0)
    }
    
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
    
    public var size: CGSize {
        get { return self.frame.size }
        set(size) {
            var frame = self.frame
            frame.size = size
            self.frame = frame
        }
    }
    
    public var centerX: CGFloat {
        get { return self.center.x }
        set(centerX) {
            self.center = CGPoint(x: centerX, y: self.center.y)
        }
    }
    public var centerY: CGFloat {
        get { return self.center.y }
        set(centerY) {
            self.center = CGPoint(x: self.centerX, y: centerY)
        }
    }
    public var origin: CGPoint {
        get { return self.frame.origin }
        set(origin) {
            var frame = self.frame
            frame.origin = origin
            self.frame = frame
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

extension UIScreen {
    static var width : CGFloat  {
        return UIScreen.main.bounds.size.width
    }
    static var height : CGFloat  {
        return UIScreen.main.bounds.size.height
    }
    static var size : CGSize  {
        return UIScreen.main.bounds.size
    }
    static var size_swap : CGSize  {
        return CGSize(width: height, height: width)
    }
}
