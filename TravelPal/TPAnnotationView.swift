//
//  TPAnnotationView.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/6/14.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class TPAnnotationView: MAAnnotationView {

    var calloutView:TPCalloutView = TPCalloutView.init(frame: CGRect.init(x: 0, y: 0, width: kCalloutWidth, height: kCalloutHeight))
    var userData:Any?
    override init!(annotation: MAAnnotation!, reuseIdentifier: String!) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        var view = super.hitTest(point, with: event)
        if view == nil {
            let temppoint = self.calloutView.naviBtn!.convert(point, from: self)
            if (self.calloutView.naviBtn!.bounds.contains(temppoint)) {
                view = self.calloutView.naviBtn!
            }
        }
        return view
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        if self.isSelected == selected {
            return
        }
        
        if selected {
             self.calloutView.center = CGPoint.init(x: self.bounds.width / 2.0 + self.calloutOffset.x, y: -self.calloutView.bounds.height / 2.0 + self.calloutOffset.y)
            self.calloutView.setImage(img: UIImage.init(named: "photo")!)
            
            self.addSubview(calloutView)
        }else{
            self.calloutView.removeFromSuperview()
        }
        
        super.setSelected(selected, animated: animated)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
