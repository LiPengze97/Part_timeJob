//
//  InformationViewController.swift
//  lvban
//
//  Created by 冼啟棉 on 17/5/25.
//  Copyright © 2017年 冼啟棉. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController,UITableViewDelegate,HELoopPageViewDelegate,UIScrollViewDelegate ,UITableViewDataSource{
    
    var tableview = UITableView()
    var loopPage: HELoopPageView!
    var titlek :String!
    
    var mainview = UIView()
    
    
//信息
    var arrangement = String()
    var cost = String()
    var notify = String()
    var year = Int()
    var moon = Int()
    var day = Int()
    var price = Int()
    var theme = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor = UIColor.white
        
        
  //加载信息
        arrangement = "吃饭睡觉打豆豆吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃"
        cost = "很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵很贵"
        notify = "记住带充电宝记住带充电宝记住带充电宝记住带充电宝记住带充电宝记住带充电宝记住带充电宝记住带充电宝记住带充电宝记住带充电宝记住带充电宝记住带充电宝记住带充电宝记住带充电宝记住带充电宝"
        year = 2017
        moon = 12
        day = 25
        price = 8888
        theme = "五星豪华纯玩超级性价比高乱七八糟游"
        
        self.updateMainView(0)
        
  //用于初始化scollview
        self.automaticallyAdjustsScrollViewInsets = false
        
        var images = [UIImage]()
        for i in 1...5 {
            let img = UIImage(named: "ii"+""+String(i))
            images.append(img!)
        }
        
        loopPage = HELoopPageView(
            frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 220),
            images: images)
        loopPage.delegate = self    //设置代理
        loopPage.pageIndicatorColor = UIColor.gray    //设置pageControl指示器的颜色
        loopPage.currentPageIndicatorColor = UIColor.black
        loopPage.pageControlPosion = .middleTop   //设置pageControl的位置
        
        
    var buttonheight = CGFloat(50)

        tableview = UITableView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height-20-buttonheight))
        tableview.delegate = self
        tableview.dataSource = self
        self.view.addSubview(tableview)
        
        var kefu = UIButton()
        kefu.frame = CGRect(x: 0, y: self.view.frame.height-buttonheight, width: 100, height: buttonheight)
        kefu.setTitle("客服", for: UIControlState())
        kefu.titleLabel!.font = UIFont.systemFont(ofSize: 20)
        kefu.backgroundColor = UIColor.gray
        kefu.addTarget(self, action: #selector(InformationViewController.tapped(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(kefu)
        
        var shouchang = UIButton()
        shouchang.frame = CGRect(x: 100, y: self.view.frame.height-buttonheight, width: (self.view.frame.width-100)/2, height: buttonheight)
        shouchang.setTitle("加入收藏", for: UIControlState())
        shouchang.titleLabel!.font = UIFont.systemFont(ofSize: 20)
        shouchang.backgroundColor = UIColor.orange
        shouchang.addTarget(self, action: #selector(InformationViewController.tapped(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(shouchang)
        
        var yuding = UIButton()
        yuding.frame = CGRect(x: 100+(self.view.frame.width-100)/2, y: self.view.frame.height-buttonheight, width: (self.view.frame.width-100)/2, height: buttonheight)
        yuding.setTitle("立即预订", for: UIControlState())
        yuding.titleLabel!.font = UIFont.systemFont(ofSize: 20)
        yuding.backgroundColor = UIColor.red
        yuding.addTarget(self, action: #selector(InformationViewController.tapped(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(yuding)
        
        var leftbutton = UIButton()
        leftbutton.frame = CGRect(x: 6, y: 26, width: 30, height: 30)
        leftbutton.backgroundColor = UIColor.orange
        leftbutton.layer.cornerRadius = 15
        leftbutton.tag = 101
        leftbutton.addTarget(self, action: #selector(InformationViewController.tapped(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(leftbutton)
        
        
    }
    
    
    

//tableview代理方法一大堆＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊

    func tableView(_ tableView: UITableView!, numberOfRowsInSection section:Int) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView!, heightForRowAt indexPath:IndexPath) ->CGFloat{
        if(indexPath.section == 0){return 220}
        if(indexPath.section == 1){return 64}
        if(indexPath.section == 2){return 44}
        return 500
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return   4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return   4
    }
    

    
    func tableView(_ tableView: UITableView!, cellForRowAt indexPath:IndexPath) -> UITableViewCell!{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "aaa")
        cell.selectionStyle = UITableViewCellSelectionStyle.none
     
        if(indexPath.section == 0 ){
            cell.addSubview(loopPage)
            var la = UILabel()
            la.frame = CGRect(x: 0, y: 170, width: self.view.frame.width, height: 50)
            la.backgroundColor = UIColor(red : 0/255, green : 0/255, blue : 0/255, alpha : 0.5);
            la.text = "  "+titlek
            la.textColor = UIColor.white
            la.font = UIFont.systemFont(ofSize: 24)
            cell.addSubview(la)
            
        }
        if(indexPath.section == 3){
          cell.addSubview(mainview)
        }
        
        if(indexPath.section == 2){
        var ll = UILabel()
        ll.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        ll.backgroundColor = UIColor.white
        ll.text = "  出发日期：          年      月      日                        修改日期"
        ll.textColor = UIColor.gray
        ll.font = UIFont.systemFont(ofSize: 14)
        cell.addSubview(ll)
        
        var yy = UILabel()
        yy.frame = CGRect(x: 76, y: 0, width: 40, height: 44)
        yy.backgroundColor = UIColor.white
        yy.text = String(year)
        yy.textColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1)
        yy.font = UIFont.systemFont(ofSize: 18)
        cell.addSubview(yy)
            
        var mm = UILabel()
        mm.frame = CGRect(x: 134, y: 0, width: 22, height: 44)
        mm.backgroundColor = UIColor.white
        mm.text = String(moon)
        mm.textColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1)
        mm.font = UIFont.systemFont(ofSize: 18)
        cell.addSubview(mm)
            
        var dd = UILabel()
        dd.frame = CGRect(x: 170, y: 0, width: 22, height: 44)
        dd.backgroundColor = UIColor.white
        dd.text = String(day)
        dd.textColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1)
        dd.font = UIFont.systemFont(ofSize: 18)
        cell.addSubview(dd)
            
        var bb = UIButton()
        bb.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        bb.backgroundColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 0)
        bb.tag = 100
        bb.addTarget(self, action: #selector(InformationViewController.tapped(_:)), for: UIControlEvents.touchUpInside)
        cell.addSubview(bb)
        
        
        }
        
        if(indexPath.section == 1){
        var tt = UILabel()
        tt.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30)
        tt.text = "  "+theme
        tt.backgroundColor = UIColor.white
        tt.textColor = UIColor.black
        tt.font = UIFont.systemFont(ofSize: 18)
        cell.addSubview(tt)
            
        var aa = UILabel()
        aa.frame = CGRect(x: 0, y: 30, width: 200, height: 30)
        aa.text = "  ￥                   起"
        aa.backgroundColor = UIColor.white
        aa.textColor = UIColor.orange
        aa.font = UIFont.systemFont(ofSize: 15)
        cell.addSubview(aa)
            
        var cc = UILabel()
        cc.frame = CGRect(x: 0, y: 30, width: 100, height: 30)
        cc.text = "    "+String(price)
        cc.backgroundColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 0)
        cc.textColor = UIColor.orange
        cc.font = UIFont.systemFont(ofSize: 26)
        cell.addSubview(cc)
            
        
        }
  
        
        return cell
    }

//scollview代理方法一大堆＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //设置rollingEnable为true即可开启自动滚动功能
        loopPage.rollingEnable = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //需要在退出前停止自动滚动,否则会内存泄露
        loopPage.rollingEnable = false
    }
    
    //代理方法 点击page时调用
    func didSelectPage(_ pageNum: Int) {
        print("\(pageNum)")
    }
    
    
    //点击按钮的方法********************************************************************************************
    func tapped(_ button:UIButton){
        var cbutton = String(describing: button.title(for: UIControlState()))
    
        if(cbutton == "Optional(\"客服\")"){
        print("点了客服")
        }
        if(cbutton == "Optional(\"加入收藏\")"){
            print("点了加入收藏")
        }
        if(cbutton == "Optional(\"立即预订\")"){
            print("点了立即预订")
        }
        if(cbutton == "Optional(\"行程安排\")"){
            self.updateMainView(0)
        }
        if(cbutton == "Optional(\"费用说明\")"){
            self.updateMainView(1)
        }
        if(cbutton == "Optional(\"旅行须知\")"){
            self.updateMainView(2)
        }
        if(button.tag == 100){
          print("点了修改日期")
        }
        if(button.tag == 101){
            self.dismiss(animated: true, completion: nil)
        }
    
    
    
    }
    //一个更新界面的方法********************************************************************************************
    func updateMainView(_ a:Int){
    mainview = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 500))
    mainview.backgroundColor = UIColor(red : 242/255, green : 242/255, blue : 242/255, alpha : 1);
        
        var arrangementb = UIButton()
        arrangementb.frame = CGRect(x: 0, y: 0, width: self.view.frame.width/3, height: 44)
        arrangementb.setTitle("行程安排", for: UIControlState())
        arrangementb.titleLabel!.font = UIFont.systemFont(ofSize: 20)
        arrangementb.backgroundColor = UIColor.white
        if(a == 0){
            arrangementb.setTitleColor(UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1), for: UIControlState())
        }
        else{
        arrangementb.setTitleColor(UIColor.black, for: UIControlState())
        }
        arrangementb.addTarget(self, action: #selector(InformationViewController.tapped(_:)), for: UIControlEvents.touchUpInside)
        mainview.addSubview(arrangementb)
        
        var costb = UIButton()
        costb.frame = CGRect(x: self.view.frame.width/3, y: 0, width: self.view.frame.width/3, height: 44)
        costb.setTitle("费用说明", for: UIControlState())
        costb.titleLabel!.font = UIFont.systemFont(ofSize: 20)
        costb.backgroundColor = UIColor.white
        if(a == 1){
            costb.setTitleColor(UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1), for: UIControlState())
        }
        else{
            costb.setTitleColor(UIColor.black, for: UIControlState())
        }
        costb.addTarget(self, action: #selector(InformationViewController.tapped(_:)), for: UIControlEvents.touchUpInside)
        mainview.addSubview(costb)
        
        var notifyb = UIButton()
        notifyb.frame = CGRect(x: self.view.frame.width/3*2, y: 0, width: self.view.frame.width/3, height: 44)
        notifyb.setTitle("旅行须知", for: UIControlState())
        notifyb.titleLabel!.font = UIFont.systemFont(ofSize: 20)
        notifyb.backgroundColor = UIColor.white
        if(a == 2){
            notifyb.setTitleColor(UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1), for: UIControlState())
        }
        else{
            notifyb.setTitleColor(UIColor.black, for: UIControlState())
        }
        notifyb.addTarget(self, action: #selector(InformationViewController.tapped(_:)), for: UIControlEvents.touchUpInside)
        mainview.addSubview(notifyb)
        
        var littleview = UILabel()
        littleview.frame = CGRect(x: self.view.frame.width/3*CGFloat(a), y: 42, width: self.view.frame.width/3, height: 2)
        littleview.backgroundColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1)
        mainview.addSubview(littleview)
        
        var message = String()
        if(a == 0){
        message = arrangement
        }
        if(a == 1){
            message = cost
        }
        if(a == 2){
            message = notify
        }
        
       var vv = UIView()
        vv.frame = CGRect(x: 0, y: 46, width: self.view.frame.width, height: 500-46)
        vv.backgroundColor = UIColor.white
        
        var comment = UILabel(frame: CGRect(x: 25, y: 0, width: self.view.frame.width-50, height:400))
        comment.text = message
        comment.font = UIFont.systemFont(ofSize: 14)
        comment.lineBreakMode = NSLineBreakMode.byWordWrapping
        comment.numberOfLines = 0
        vv.addSubview(comment)
        
        mainview.addSubview(vv)
        tableview.reloadData()
        
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    



}
