//
//  TPCalloutView.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/6/13.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

protocol TPCalloutViewDelegate {
    func navibtnDidTapped()
}



class TPCalloutView: UIView {
    //数据
    var avatar:UIImage?
    var type:String?
    var detail:String?
    
    //数据对应的View
    var avatarView:UIImageView?
    var typeLabel:UILabel?
    var detailLabel:UILabel?
    
    var naviBtn:UIButton?
    
    var delegate:TPCalloutViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubViews(){
        self.avatarView = UIImageView.init(frame: CGRect.init(x: kPortraitMargin, y: kPortraitMargin, width: kPortraitWidth, height: kPortraitHeight))
        self.avatarView?.backgroundColor = UIColor.black
        avatarView?.image = UIImage.init(named: "photo")
        self.addSubview(avatarView!)
        
        self.typeLabel = UILabel.init(frame: CGRect.init(x: kPortraitMargin * 2 + kPortraitWidth ,y: kPortraitMargin, width: kTitleWidth, height: kTitleHeight))
        self.typeLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        self.typeLabel?.textColor = UIColor.white
        self.typeLabel?.text = "远程旅行"
        self.addSubview(self.typeLabel!)
        
        self.detailLabel = UILabel.init(frame: CGRect.init(x: kPortraitMargin * 2 + kPortraitWidth, y:  kPortraitMargin * 2 + kTitleHeight, width: kTitleWidth, height: kTitleHeight))
        self.detailLabel?.font = UIFont.systemFont(ofSize: 12)
        self.detailLabel?.textColor = UIColor.lightGray
        self.detailLabel?.text = "去北京"
        self.addSubview(detailLabel!)
        
        self.naviBtn = UIButton.init(frame: CGRect.init(x: kPortraitMargin * 3 + kPortraitWidth * 2, y: kPortraitMargin * 2, width: 40, height: 40))
        naviBtn?.setImage(UIImage.init(named: "right"), for: .normal)
        naviBtn?.addTarget(self, action: #selector(TPCalloutView.naviBtnTapped), for: .touchUpInside)
        self.addSubview(naviBtn!)
    }
    
    func naviBtnTapped(){
        print("😮")
        delegate?.navibtnDidTapped()
    }
    
    func setType(title:String){
        self.typeLabel?.text = title
    }
    
    func setDetail(title:String){
        self.detailLabel?.text = title
    }
    
    func setImage(img:UIImage){
        self.avatar = img
    }
    
    override func draw(_ rect: CGRect) {
        
        self.drawInContext(context: UIGraphicsGetCurrentContext()!)
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        
    }
    
    func drawInContext(context: CGContext) {
        context.setLineWidth(2.0)
        context.setFillColor(UIColor(colorLiteralRed: 0.3, green: 0.3, blue: 0.3, alpha: 0.8).cgColor)
        
        self.getDrawPath(context: context)
        context.fillPath()
    }
    
    func getDrawPath(context: CGContext) {
        let rrect = self.bounds
        let radius = 6.0
        let minx = rrect.minX
        let midx = rrect.midX
        let maxx = rrect.maxX
        let miny = rrect.minY
        let kArrorHeight = 10
        let maxy = rrect.maxY - CGFloat(kArrorHeight)
        
        context.move(to: CGPoint(x: midx + CGFloat(kArrorHeight), y: maxy))
        context.move(to: CGPoint(x: midx, y: maxy + CGFloat(kArrorHeight)))
        context.move(to: CGPoint(x: midx - CGFloat(kArrorHeight), y: maxy))
        
        
        context.addArc(tangent1End: CGPoint(x: minx, y: maxy), tangent2End: CGPoint(x: minx, y: miny), radius: CGFloat(radius))
        context.addArc(tangent1End: CGPoint(x: minx, y: minx), tangent2End: CGPoint(x: maxx, y: miny), radius: CGFloat(radius))
        context.addArc(tangent1End: CGPoint(x: maxx, y: miny), tangent2End: CGPoint(x: maxx, y: maxx), radius: CGFloat(radius))
        context.addArc(tangent1End: CGPoint(x: maxx, y: maxy), tangent2End: CGPoint(x: midx, y: maxy), radius: CGFloat(radius))
        
        context.closePath()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
