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
    //CCCCCCCCCCCCCCCCCCCCCCCCCCC1
    var shouchang1 = Int()
     var images = [UIImage]()
    var imageString = [String]()
   
    
    //CCCCCCCCCCCCCCCCCCCCCCCCCC1
  
 //CCCCCCCCCCCCCCC2
    var elseImage = [UIImage]()
    var elseName = [String]()
    var elseScore = [Double]()
    var elseLike = [Int]()
    var elseGo = [Int]()
    var elseConment = [String]()
  //CCCCCCCCCCCCCCC2
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor = UIColor.white
        
        
  //加载信息
     
        shouchang1 = 0
        arrangement = "吃饭睡觉打豆豆吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃吃"
        cost = "\n费用不包含：\n\n1）小交通：当地机场到酒店的往返接送服务。\n\n2）签证：个人旅游签证费，报名时与团费一起支付。  \n\n3）其它：所在地到出发地的往返交通费请自理 \n\n4）出入境个人物品海关征税，超重行李的托运费、保管费 \n\n5）升级舱位、升级酒店、升级房型等造成的差价 \n\n6）因交通延迟、罢工、天气、飞机故障、航班取消或更改时间等不可抗力因素所引起的额外费用 \n\n7）酒店内洗衣、理发、电话、传真、收费电视、饮品、烟酒等个人消费  \n\n＊建议购买旅游人身意外保险，永成保险境外旅游意外保险 美亚保险境外旅游意外保险"
        notify = "\n\n1.自助游产品均为即时计价，请以我方最终确认价格为准。 2.若预订的机票是团队机票，存在航班调整的可能（包括航空公司、起飞时间的变化），故最终航班情况以出票时的具体信息为准。 3.大床房等附加要求，预订时我方尽量申请，请您在入住时再次向前台提及。 4. 持大陆护照者，我司可代办签证，或需自备有效证件及目的地签证出行。 5.为了不耽误您的行程，请您在国际航班起飞前120分钟到达机场办理登机以及出入境相关手续；如涉及海外国内段行程，请您在航班起飞前60分钟到达机场办理登机手续。 6.请在出行前记录下出团通知书上的紧急联系人电话，以便应对突发情况。 7.此线路订房较为特殊，需在您签约付款之后帮您实时预订房间；一般在签约付款后48小时内我方能确定房间是否订妥，若出现无房的情况可全额退款或更换房型（房间差价多退少补）。 8.游泳、漂流、潜水等水上运动，均存在危险。参与前请根据自身条件，并充分参考当地海事部门及其它专业机构相关公告及建议后量力而行。 9.如您持外籍护照前往中国境外，请确保持有再次进入中国大陆的有效签证。 10.如自备签证，请提供有效护照及签证复印件"
        
      //CCCCCCCCCCCCCC3
        
        year = 2017
        moon = 12
        day = 25
        price = 8888
        theme = "五星豪华纯玩超级性价比高乱七八糟游"
        
    //CCCCCCCCCCCCCCC4
        imageString = ["ii1","ii2","ii3","ii4","ii5"]
        
        if(titlek == "普基诺富特4晚6日自助游"){
            arrangement = "\n\n住宿：普吉岛葡萄酒园诺富特度假酒店 \n酒店星级：高档型 \n\n第一天： \n\n景点：皮皮岛  \n景点：帝皇岛 \n\n第二天： \n\n景点：攀牙湾 \n景点：珊瑚岛 \n\n第三天： \n自助游 \n\n第四天： \n景点：竹子岛 \n\n第五天： \n景点：普及幻多奇乐园 \n\n第六天： \n景点：泰国普吉西人妖秀"
            year = 2017
            moon = 8
            day = 2
            price = 3381
            theme = "每房可享2位儿童房费和早餐费全免"
            imageString = ["puji1","puji2","puji3","puji1","puji2"]}
        
        if(titlek == "济南趵突泉＋曲阜三孔＋泰山三日游"){
            arrangement = "\n\n住宿：济南鲁能希尔顿酒店\n\n泰安万达嘉华酒店 \n酒店星级：高档型 \n\n第一天： \n\n景点：趵突泉  \n景点：洪家楼天主教教堂 \n景点：大明湖 \n\n第二天： \n\n景点：泰山 \n景点：泰安乐园 \n\n第三天： \n\n景点：三孔 \n\n"
            year = 2017
            moon = 10
            day = 2
            price = 2899
            theme = "五星酒店＋免费早餐国庆跟团游"
            imageString = ["jinan1","jinan2","jinan3","jinan4","jinan5"]}
        
        
        
        elseName = ["普基诺富特4晚6日自助游","三亚蜈支洲天涯海角5日游","张家界—凤凰古城—天门山—黄龙洞","济南—曲阜—泰山—青岛—海阳"]
        elseScore = [4.8,4.9,4.8,4.7]
        elseGo = [884,741,2400,170]
        elseLike = [154,98,802,58]
        elseConment = ["酒店超赞，超大露天游泳池，酒店有1楼豪华房，阳台直通游泳池，很划算","行程非常不错。玩得很尽兴。也没有强制购物！三亚必游景点也都在行程内","游玩了景观秀丽、美不胜收的黄龙洞；感受了山水相对让人心旷神怡的天然大氧吧武陵山：无限风光","去了一直想去的几个城市，看了有山有水的大美山东，整体感觉不错，导游人很好，很细心很热情"]
        
        var imageString2 = ["puji1","sanya1","zhangjia1","shandong1"]
        for i in 1...4 {
            let img = UIImage(named: imageString2[i-1])
            elseImage.append(img!)
        }
       //CCCCCCCCCCCCCCC4
        
        
        self.updateMainView(0)
        
  //用于初始化scollview
        self.automaticallyAdjustsScrollViewInsets = false
        
       
        for i in 1...5 {
                //CCCCCCCCCCCCCCC5
            let img = UIImage(named: imageString[i-1])
                //CCCCCCCCCCCCCCC5
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
       //CCCCCCCCCCCCCCCCCCCC6
        if(shouchang1 == 0){
            shouchang.setTitle("加入收藏", for: UIControlState())}
        if(shouchang1 == 1){
            shouchang.setTitle("取消收藏", for: UIControlState())}
         //CCCCCCCCCCCCCCCCCCCC6
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
        leftbutton.frame = CGRect(x: 6, y: 26, width: 60, height: 30)
       // leftbutton.backgroundColor = UIColor.orangeColor()
       // leftbutton.layer.cornerRadius = 15
        leftbutton.tag = 101
        
    //CCCCCCCCCCCCCCCC7
        leftbutton.setTitle("返回", for: UIControlState())
        leftbutton.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        leftbutton.setTitleColor(UIColor.white, for: UIControlState())
        leftbutton.addTarget(self, action: #selector(InformationViewController.tapped(_:)), for: UIControlEvents.touchUpInside)
        self.tableview.addSubview(leftbutton)
    //CCCCCCCCCCCCCCCC7
        
    }
    
    
    

//tableview代理方法一大堆＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊

    func tableView(_ tableView: UITableView!, numberOfRowsInSection section:Int) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView!, heightForRowAt indexPath:IndexPath) ->CGFloat{
        if(indexPath.section == 0){return 220}
        if(indexPath.section == 1){return 64}
        if(indexPath.section == 2){return 44}
         //CCCCCCCCCCCCCCC8
        if(indexPath.section == 3){return 500}
        return CGFloat(45+101*elseImage.count)
        //CCCCCCCCCCCCCCC8
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return   4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         //CCCCCCCCCCCCCCC9
        return   5
         //CCCCCCCCCCCCCCC9
    }
    

    
    func tableView(_ tableView: UITableView!, cellForRowAt indexPath:IndexPath) -> UITableViewCell!{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "aaa")
        cell.selectionStyle = UITableViewCellSelectionStyle.none
     
        if(indexPath.section == 0 ){
            cell.addSubview(loopPage)
            let la = UILabel()
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
        let ll = UILabel()
        ll.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        ll.backgroundColor = UIColor.white
        ll.text = "  出发日期：          年      月      日                        修改日期"
        ll.textColor = UIColor.gray
        ll.font = UIFont.systemFont(ofSize: 14)
        cell.addSubview(ll)
        
        let yy = UILabel()
        yy.frame = CGRect(x: 76, y: 0, width: 40, height: 44)
        yy.backgroundColor = UIColor.white
        yy.text = String(year)
        yy.textColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1)
        yy.font = UIFont.systemFont(ofSize: 18)
        cell.addSubview(yy)
            
        let mm = UILabel()
        mm.frame = CGRect(x: 134, y: 0, width: 22, height: 44)
        mm.backgroundColor = UIColor.white
        mm.text = String(moon)
        mm.textColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1)
        mm.font = UIFont.systemFont(ofSize: 18)
        cell.addSubview(mm)
            
        let dd = UILabel()
        dd.frame = CGRect(x: 170, y: 0, width: 22, height: 44)
        dd.backgroundColor = UIColor.white
        dd.text = String(day)
        dd.textColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1)
        dd.font = UIFont.systemFont(ofSize: 18)
        cell.addSubview(dd)
            
        let bb = UIButton()
        bb.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        bb.backgroundColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 0)
        bb.tag = 100
        bb.addTarget(self, action: #selector(InformationViewController.tapped(_:)), for: UIControlEvents.touchUpInside)
        cell.addSubview(bb)
        
        
        }
        
        if(indexPath.section == 1){
        let tt = UILabel()
        tt.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30)
        tt.text = "  "+theme
        tt.backgroundColor = UIColor.white
        tt.textColor = UIColor.black
        tt.font = UIFont.systemFont(ofSize: 18)
        cell.addSubview(tt)
            
        let aa = UILabel()
        aa.frame = CGRect(x: 0, y: 30, width: 200, height: 30)
        aa.text = "  ￥                   起"
        aa.backgroundColor = UIColor.white
        aa.textColor = UIColor.orange
        aa.font = UIFont.systemFont(ofSize: 15)
        cell.addSubview(aa)
            
        let cc = UILabel()
        cc.frame = CGRect(x: 0, y: 30, width: 100, height: 30)
        cc.text = "    "+String(price)
        cc.backgroundColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 0)
        cc.textColor = UIColor.orange
        cc.font = UIFont.systemFont(ofSize: 26)
        cell.addSubview(cc)
            
        }
   //CCCCCCCCCCCCCCCCCCC10
        if(indexPath.section == 4){
         cell.backgroundColor =   UIColor(red : 0xD9/255, green : 0xD9/255, blue : 0xD9/255, alpha : 1);
            
        let ll = UILabel()
        ll.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        ll.backgroundColor = UIColor.white
        ll.text = "  其它推荐"
            cell.addSubview(ll)
            
            for i in 1...elseImage.count {
            let bigView = UIView()
            bigView.frame = CGRect(x: 0, y: CGFloat(45+101*(i-1)), width: self.view.frame.width, height: 100)
            bigView.backgroundColor = UIColor.white
            
                let imagek = UIImageView(image: elseImage[i-1])
                imagek.frame = CGRect(x: 16, y: 10, width: 105, height: 80)
                
                let titlek = UILabel(frame: CGRect(x: 136, y: 12, width:210 , height: 15))
                titlek.text = elseName[i-1]
                titlek.font = UIFont.systemFont(ofSize: 17)
                
                let scorek = UILabel(frame: CGRect(x: self.view.frame.width-40, y: 12, width: 40, height: 15))
                scorek.text = String(elseScore[i-1])
                scorek.font = UIFont.systemFont(ofSize: 17)
                scorek.textColor = UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 1)
                
                let likek = UILabel(frame: CGRect(x: 136, y:42 , width: 100, height: 10))
                likek.text = String(elseLike[i-1])
                likek.font = UIFont.systemFont(ofSize: 15)
                likek.textColor = UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 1)
                
                let renxihuan = UILabel(frame: CGRect(x: 176, y:42 , width: 100, height: 10))
                renxihuan.text = "人收藏"
                renxihuan.font = UIFont.systemFont(ofSize: 14)
                renxihuan.textColor = UIColor.black
                
                let gok = UILabel(frame: CGRect(x: 236, y:42 , width: 100, height: 10))
                gok.text = String(elseGo[i-1])
                gok.font = UIFont.systemFont(ofSize: 15)
                gok.textColor = UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 1)
                
                let renchuyou = UILabel(frame: CGRect(x: 276, y:42 , width: 100, height: 10))
                renchuyou.text = "人出游"
                renchuyou.font = UIFont.systemFont(ofSize: 14)
                renchuyou.textColor = UIColor.black
                
                let commentk = UILabel(frame: CGRect(x: 136, y: 52, width: self.view.frame.width-136-5, height:50) )
                commentk.text = elseConment[i-1]
                commentk.font = UIFont.systemFont(ofSize: 14)
                commentk.lineBreakMode = NSLineBreakMode.byWordWrapping
                commentk.numberOfLines = 0
                
                let buttonk = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 98))
                buttonk.backgroundColor = UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 0)
                buttonk.addTarget(self, action: #selector(InformationViewController.tapped(_:)), for: UIControlEvents.touchUpInside)
                buttonk.tag = 200+i
                
                bigView.addSubview(imagek)
                bigView.addSubview(titlek)
                bigView.addSubview(scorek)
                bigView.addSubview(likek)
                bigView.addSubview(renxihuan)
                bigView.addSubview(renchuyou)
                bigView.addSubview(gok)
                bigView.addSubview(commentk)
                bigView.addSubview(buttonk)
                
                
                
                
                
                cell.addSubview(bigView)
            
            }
        
        }
  //CCCCCCCCCCCCCCCCCCC10
        
        return cell
    }

//scollview代理
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
    
    
    //点击按钮的方法
    func tapped(_ button:UIButton){
        let cbutton = String(describing: button.title(for: UIControlState()))
        
        if(cbutton == "Optional(\"客服\")"){
            print("点了客服")
        }
        
        //CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC11
        if(cbutton == "Optional(\"加入收藏\")"){
            print("点了加入收藏")
            UserManager.shared
            let alert = UIAlertController(title: "收藏成功", message: "在收藏夹中可获取", preferredStyle: .alert)
            let yes = UIAlertAction(title: "确定", style: .default, handler: nil)
            alert.addAction(yes)
            shouchang1 = 1
            button.setTitle("取消收藏", for: UIControlState())
            button.reloadInputViews()
            self.present(alert, animated: true, completion: nil)
        }
        
        if(cbutton == "Optional(\"取消收藏\")"){
            print("点了加入收藏")
            
            let alert = UIAlertController(title: "取消成功", message: "已取消本收藏", preferredStyle: .alert)
            let yes = UIAlertAction(title: "确定", style: .default, handler: nil)
            alert.addAction(yes)
            shouchang1 = 0
            button.setTitle("加入收藏", for: UIControlState())
            button.reloadInputViews()
            self.present(alert, animated: true, completion: nil)
        }
        
        
        //CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC11
        
        if(cbutton == "Optional(\"立即预订\")"){
            //CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC12
            print("点了立即预订")
            let secondView = PayViewController()
            secondView.picture = images[0]
            secondView.cost = price
            secondView.aa = arrangement
            secondView.cc = cost
            secondView.nn = notify
            secondView.name = titlek
            pushWithoutTab(secondView)
            
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
            navigationController?.popViewController(animated: true)
            //self.dismiss(animated: true, completion: nil)
        }
        
        
        if(button.tag > 200 && button.tag < 250){
            print("点了"+elseName[button.tag-200-1])
            let secondView = InformationViewController()
            secondView.titlek = elseName[button.tag-200-1]
            pushWithoutTab(secondView);
            //self.present(secondView, animated: true, completion: nil)
            
        }
        
    }
    
    func updateMainView(_ a:Int){
        mainview = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 500))
        mainview.backgroundColor = UIColor(red : 242/255, green : 242/255, blue : 242/255, alpha : 1);
        
        let arrangementb = UIButton()
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
        
        let costb = UIButton()
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
        
        let notifyb = UIButton()
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
        
        let littleview = UILabel()
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
        
        let vv = UIView()
        vv.frame = CGRect(x: 0, y: 46, width: self.view.frame.width, height: 500-46)
        vv.backgroundColor = UIColor.white
        
        let comment = UILabel(frame: CGRect(x: 25, y: 0, width: self.view.frame.width-50, height:400))
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
