//
//  tableview.swift
//  lvban
//
//  Created by 冼啟棉 on 17/5/4.
//  Copyright © 2017年 冼啟棉. All rights reserved.
//

import UIKit

protocol tableViewDelegate:NSObjectProtocol {
    func didSelectCell(_ Section: Int,Row:Int)
    func jumpToInformationView(_ title:String)
}

class MaintableView: UIView,UITableViewDataSource,UITableViewDelegate,HELoopPageViewDelegate,UIScrollViewDelegate {
    
    var tableview = UITableView()
    weak var delegate:tableViewDelegate?
    
    var scollViewImages = [UIImage]()
    var loopPage: HELoopPageView!
    
    
    
    //热门目的地view
    var viewForHotDestination = UIView()
    //热门推荐view
    var viewForRecommend = UIView()
    //分类view
    var viewForClassification = UIScrollView()
    var littleview = UIView()
    //推荐2view
    var viewFortRecommend = UIView()
    
    //数据源
    
    var hotDestination = [String]()            //热门目的地按钮数据源
    var hotDestination0 = [String]()
    var hotDestination1 = [String]()
    var hotDestination2 = [String]()
    var hotDestination3 = [String]()
    var hotDestination4 = [String]()
    var hotDestination5 = [String]()
    var hotDestination6 = [String]()
    
    var image = [UIImage]()
    var image0 = [UIImage]()
    var image1 = [UIImage]()
    var image2 = [UIImage]()
    var image3 = [UIImage]()
    var image4 = [UIImage]()
    var image5 = [UIImage]()
    var image6 = [UIImage]()
    
    var recommend = [String]()
    var recommend0 = [String]()
    var recommend1 = [String]()
    var recommend2 = [String]()
    var recommend3 = [String]()
    var recommend4 = [String]()
    var recommend5 = [String]()
    var recommend6 = [String]()
    
    var imageForRecommend = [UIImage]()

    var ttitle = [String]()
    var tscore  = [Double]()
    var tNumberOfLike = [Int]()
    var tNumberOfGo = [Int]()
    var trecommend = [String]()
    var timageForRecommend = [UIImage]()
    
    //七个按钮
    var travelButton = UIButton()
    var travelAbroadButton = UIButton()
    var travelInStateButton = UIButton()
    var travelAroundButton = UIButton()
    var travelyourselfButton = UIButton()
    var travelwithteamButton = UIButton()
    var hotelButton = UIButton()
    
    //四个按钮
    var rbutton0 = UIButton()
    var rbutton1 = UIButton()
    var rbutton2 = UIButton()
    var rbutton3 = UIButton()
    var stringForRbutton = [["旅游0","旅游1","旅游2","旅游3"],["出境游0","出境游1","出境游2","出境游3"],["国内游0","国内游1","国内游2","国内游3"],["周围游0","周围游1","周围游2","周围游3"],["自助游0","自助游1","自助游2","自助游3"],["跟团游0","跟团游1","跟团游2","跟团游3"],["酒＋景0","酒＋景1","酒＋景2","酒＋景3"]]
    
    
    //tableview代理方法一大堆＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
    func tableView(_ tableView: UITableView!, numberOfRowsInSection section:Int) -> Int{
        if(section == 0 ){return 2}
        if(section == 1){return 1}
        if(section == 2){return 1}
        return 1
    }
    
    func tableView(_ tableView: UITableView!, heightForRowAt indexPath:IndexPath) ->CGFloat{
        if(indexPath.section == 0 && indexPath.row == 0){return 44}
        if(indexPath.section == 0 && indexPath.row == 1){return 210}
        if(indexPath.section == 1){return 182}
        if(indexPath.section == 2){return 224}
        if(indexPath.section == 3){return CGFloat(44+(102*trecommend.count))}
        return 260
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return   8
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return   4
    }
    
    
    func tableView(_ tableView: UITableView!, cellForRowAt indexPath:IndexPath) -> UITableViewCell!{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "aaa")
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if(indexPath.section == 0 && indexPath.row == 1){cell.addSubview(loopPage)}
        else if(indexPath.section == 0 && indexPath.row == 0){cell.addSubview(viewForClassification)}
        else if(indexPath.section == 1){cell.addSubview(viewForHotDestination)}
        else if(indexPath.section == 2){cell.addSubview(viewForRecommend)}
            
//        else{
//            for(var i = 0;i<trecommend.count;i++){
//                if(indexPath.section == 3+i){
//                    var imageview = UIImageView(frame:CGRect(x: 0, y: 0, width: self.frame.width, height: 160))
//                    imageview.image = timageForRecommend[i]
//                    var label = UILabel(frame:CGRect(x: 0, y: 160, width: self.frame.width, height: 100))
//                    label.text = trecommend[i]
//                    cell.addSubview(imageview)
//                    cell.addSubview(label)
//                    
//                }}}
        else if(indexPath.section == 3){cell.addSubview(viewFortRecommend)}
        
        return cell
    }
    //****************************************************************************************************************************
    override init(frame:CGRect){
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red : 242/255, green : 242/255, blue : 242/255, alpha : 1);
        
        tableview.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        tableview.delegate = self
        tableview.dataSource = self
        
        //数据更新获取
        hotDestination = ["海南","东南亚","欧洲","厦门","云南","日本","中东非洲","泰国","港澳"]
        hotDestination0 = ["海南","东南亚","欧洲","厦门","云南","日本","中东非洲","泰国","港澳"]
        hotDestination1 = ["英国","美国","新加坡","欧洲","东南亚","俄罗斯","中东非洲","泰国","更多"]
        hotDestination2 = ["广州","上海","北京","深圳","重庆","济南","西安","三亚","更多"]
        hotDestination3 = ["周围1","周围2","周围3","周围4","周围5","周围6","周围7","周围8","更多"]
        hotDestination4 = ["自助1","自助2","自助3","自助4","自助5","自助6","自助7","自助8","更多"]
        hotDestination5 = ["跟团1","跟团2","跟团3","跟团4","跟团5","跟团6","跟团7","跟团8","更多"]
        hotDestination6 = ["酒店1","酒店2","酒店3","酒店4","酒店5","酒店6","酒店7","酒店8","酒店"]
        
        
        
        
        recommend = ["牛人专线","亲子游","爸妈游","朋派制定游","纯玩品质游","当季热玩","明星推荐","哪里值得玩"]
        for i in 0..<6 {
            imageForRecommend.append(UIImage(named: "image")!)
        }
        
        
        
        
        //scrollview的设置
        for i in 1...5 {
            let img = UIImage(named: "image"+""+String(i))
            scollViewImages.append(img!)
        }
        loopPage = HELoopPageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 210),images: scollViewImages)
        loopPage.delegate = self    //设置代理
        loopPage.pageIndicatorColor = UIColor.gray    //设置pageControl指示器的颜色
        loopPage.currentPageIndicatorColor = UIColor.black
        loopPage.pageControlPosion = .middleBottom    //设置pageControl的位置
        
        
        updateViewForClassification(0)
        updateHotDestination()
        updateRecommend()
        updatetRecommend(0,b: 0)
        
        self.addSubview(tableview)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //代理方法 点击page时调用
    func didSelectPage(_ pageNum: Int) {
        print("\(pageNum)")
    }
    
    //点击各个按钮
    func tappedForDestination(_ button:UIButton){
        var cbutton = String(describing: button.title(for: UIControlState()))
        if(cbutton == "Optional(\"旅游\")"){
            hotDestination = hotDestination0
            updateViewForClassification(0)
            updateHotDestination()
            updateRecommend()
            updatetRecommend(0,b: 0)
            tableview.reloadData()
        }
        if(cbutton == "Optional(\"出境游\")"){
            hotDestination = hotDestination1
            updateViewForClassification(1)
            updateHotDestination()
            updateRecommend()
            updatetRecommend(1,b: 0)
            tableview.reloadData()
        }
        if(cbutton == "Optional(\"国内游\")"){
            hotDestination = hotDestination2
            updateViewForClassification(2)
            updateHotDestination()
            updateRecommend()
            updatetRecommend(2,b: 0)
            tableview.reloadData()
        }
        if(cbutton == "Optional(\"周围游\")"){
            hotDestination = hotDestination3
            updateViewForClassification(3)
            updateHotDestination()
            updateRecommend()
            updatetRecommend(3,b: 0)
            tableview.reloadData()
        }
        if(cbutton == "Optional(\"自助游\")"){
            hotDestination = hotDestination4
            updateViewForClassification(4)
            updateHotDestination()
            updateRecommend()
            updatetRecommend(4,b: 0)
            tableview.reloadData()
        }
        if(cbutton == "Optional(\"跟团游\")"){
            hotDestination = hotDestination5
            updateViewForClassification(5)
            updateHotDestination()
            updateRecommend()
            updatetRecommend(5,b: 0)
            tableview.reloadData()
        }
        if(cbutton == "Optional(\"酒＋景\")"){
            hotDestination = hotDestination6
            updateViewForClassification(6)
            updateHotDestination()
            updateRecommend()
            updatetRecommend(6,b: 0)
            tableview.reloadData()
        }
        print(String(describing: button.title(for: UIControlState())))
    }
    
    //更新信息
    
    //分类
    func updateViewForClassification(_ a:Int){
    
       littleview.frame = CGRect(x: a*65, y: 42, width: 65, height: 2)
       littleview.backgroundColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1);
     
        
        viewForClassification = UIScrollView(frame:CGRect(x: 0, y: 0, width: self.frame.width, height: 44))
        viewForClassification.showsHorizontalScrollIndicator = false
        viewForClassification.isScrollEnabled = true
        viewForClassification.delegate = self
        viewForClassification.contentSize = CGSize(width: 455, height: 44)
        
        travelButton = UIButton(frame:CGRect(x: 0, y: 0, width: 65, height:44))
        travelButton.addTarget(self, action: #selector(MaintableView.tappedForDestination(_:)), for: UIControlEvents.touchUpInside)
        travelButton.setTitle("旅游", for: UIControlState())
        travelButton.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        travelButton.setTitleColor(UIColor.black, for: UIControlState())
        if(a == 0){travelButton.setTitleColor(UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1), for: UIControlState())}
        travelButton.setTitleColor(UIColor.green, for: .highlighted)
        travelAbroadButton = UIButton(frame:CGRect(x: 65, y: 0, width: 65, height:44))
        travelAbroadButton.addTarget(self, action: #selector(MaintableView.tappedForDestination(_:)), for: UIControlEvents.touchUpInside)
        travelAbroadButton.setTitle("出境游", for: UIControlState())
        travelAbroadButton.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        travelAbroadButton.setTitleColor(UIColor.black, for: UIControlState())
        if(a == 1){travelAbroadButton.setTitleColor(UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1), for: UIControlState())}
        travelAbroadButton.setTitleColor(UIColor.green, for: .highlighted)
        travelInStateButton = UIButton(frame:CGRect(x: 65*2, y: 0, width: 65, height:44))
        travelInStateButton.addTarget(self, action: #selector(MaintableView.tappedForDestination(_:)), for: UIControlEvents.touchUpInside)
        travelInStateButton.setTitle("国内游", for: UIControlState())
        travelInStateButton.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        travelInStateButton.setTitleColor(UIColor.black, for: UIControlState())
        if(a == 2){travelInStateButton.setTitleColor(UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1), for: UIControlState())}
        travelInStateButton.setTitleColor(UIColor.green, for: .highlighted)
        travelAroundButton = UIButton(frame:CGRect(x: 65*3, y: 0, width: 65, height:44))
        travelAroundButton.addTarget(self, action: #selector(MaintableView.tappedForDestination(_:)), for: UIControlEvents.touchUpInside)
        travelAroundButton.setTitle("周围游", for: UIControlState())
        travelAroundButton.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        travelAroundButton.setTitleColor(UIColor.black, for: UIControlState())
        if(a == 3){travelAroundButton.setTitleColor(UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1), for: UIControlState())}
        travelAroundButton.setTitleColor(UIColor.green, for: .highlighted)
        travelyourselfButton = UIButton(frame:CGRect(x: 65*4, y: 0, width: 65, height:44))
        travelyourselfButton.addTarget(self, action: #selector(MaintableView.tappedForDestination(_:)), for: UIControlEvents.touchUpInside)
        travelyourselfButton.setTitle("自助游", for: UIControlState())
        travelyourselfButton.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        travelyourselfButton.setTitleColor(UIColor.black, for: UIControlState())
        if(a == 4){travelyourselfButton.setTitleColor(UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1), for: UIControlState())}
        travelyourselfButton.setTitleColor(UIColor.green, for: .highlighted)
        travelwithteamButton = UIButton(frame:CGRect(x: 65*5, y: 0, width: 65, height:44))
        travelwithteamButton.addTarget(self, action: #selector(MaintableView.tappedForDestination(_:)), for: UIControlEvents.touchUpInside)
        travelwithteamButton.setTitle("跟团游", for: UIControlState())
        travelwithteamButton.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        travelwithteamButton.setTitleColor(UIColor.black, for: UIControlState())
        if(a == 5){travelwithteamButton.setTitleColor(UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1), for: UIControlState())}
        travelwithteamButton.setTitleColor(UIColor.green, for: .highlighted)
        hotelButton = UIButton(frame:CGRect(x: 65*6, y: 0, width: 65, height:44))
        hotelButton.addTarget(self, action: #selector(MaintableView.tappedForDestination(_:)), for: UIControlEvents.touchUpInside)
        hotelButton.setTitle("酒＋景", for: UIControlState())
        hotelButton.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        hotelButton.setTitleColor(UIColor.black, for: UIControlState())
        if(a == 6){hotelButton.setTitleColor(UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1), for: UIControlState())}
        hotelButton.setTitleColor(UIColor.green, for: .highlighted)
    
        viewForClassification.addSubview(travelButton)
        viewForClassification.addSubview(travelAbroadButton)
        viewForClassification.addSubview(travelInStateButton)
        viewForClassification.addSubview(travelAroundButton)
        viewForClassification.addSubview(travelwithteamButton)
        viewForClassification.addSubview(travelyourselfButton)
        viewForClassification.addSubview(hotelButton)
        viewForClassification.addSubview(littleview)
        
    }
    
    
    //热门搜索
    func updateHotDestination(){
        viewForHotDestination = UIView(frame: CGRect(x:0,y:0,width: self.frame.width,height: 182))
        viewForHotDestination.backgroundColor = UIColor(red : 0xD9/255, green : 0xD9/255, blue : 0xD9/255, alpha : 1);
     
        var littleround = UIView(frame: CGRect(x: 7, y: 13, width: 18, height: 18))
        littleround.backgroundColor = UIColor.orange
        littleround.layer.cornerRadius = 9
        
        
        var label1 = UILabel(frame:CGRect(x: 0, y: 0, width: self.frame.width, height: 44))
        label1.text = "       热门目搜索"
        label1.backgroundColor = UIColor.white
        
        for i in 0 ..< 3 {
            for j in 0 ..< 3 {
                var button = UIButton(frame:CGRect(x:CGFloat(Double(j)*126+1), y: CGFloat(i*46+46), width:124 , height: CGFloat(44)))
                button.backgroundColor = UIColor.white
                button.setTitle(hotDestination[3*i+j], for: UIControlState())
                if(i == 0 && j == 0){ button.setTitleColor(UIColor(red : 217/255, green : 29/255, blue : 29/255, alpha : 1), for: UIControlState())}
                else if(i == 0 && j == 1){ button.setTitleColor(UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 1), for: UIControlState())}
                else if(i == 0 && j == 2){ button.setTitleColor(UIColor(red : 239/255, green : 207/255, blue : 58/255, alpha : 1), for: UIControlState())}
                else{button.setTitleColor(UIColor.black, for: UIControlState())}
                button.titleLabel!.font = UIFont.systemFont(ofSize: 14)
                button.addTarget(self, action: #selector(MaintableView.tappedForDestination(_:)), for: UIControlEvents.touchUpInside)
                viewForHotDestination.addSubview(button)}}
        
        for o in 0 ..< 3{
        var imageb = UIImageView(image: UIImage(named: "p"+String(o+1)))
            imageb.contentMode = .scaleAspectFit
            imageb.frame = CGRect(x: 124*o+18, y: 58, width: 20, height: 20)
            viewForHotDestination.addSubview(imageb)
        }
        
        
        viewForHotDestination.addSubview(label1)
        viewForHotDestination.addSubview(littleround)
        
    }
    //推荐1
    func updateRecommend(){
        viewForRecommend = UIView(frame:CGRect(x: 0, y: 0, width: self.frame.width, height: 224))
        viewForRecommend.backgroundColor = UIColor(red : 0xD9/255, green : 0xD9/255, blue : 0xD9/255, alpha : 1);
        var label2 = UILabel(frame:CGRect(x: 0, y: 0, width: self.frame.width, height: 44))
        label2.text = "       热门推荐"
        label2.backgroundColor = UIColor.white
        
        var littleround = UIView(frame: CGRect(x: 7, y: 13, width: 18, height: 18))
        littleround.backgroundColor = UIColor.orange
        littleround.layer.cornerRadius = 9
        
        for i in 0 ..< 2 {
            for j in 0 ..< 3 {

                
                var button = BGButton(frame:CGRect(x:CGFloat(1+126*j), y: CGFloat(46+i*90), width:124 , height: 88))
                button.backgroundColor = UIColor.white
                button.addTarget(self, action: #selector(MaintableView.tappedForDestination(_:)), for: UIControlEvents.touchUpInside)
                //var imagea = UIImage(named: "r"+String(3*i+j))
             
                var imagea = UIImage(named: "r"+String(3*i+j+1
                    ))
                
             
                 button.setImage(imagea, for: UIControlState())
                button.setTitle(recommend[3*i+j], for: UIControlState())
    
                button.layoutSubviews()
                
                viewForRecommend.addSubview(button)
            }}
        viewForRecommend.addSubview(label2)
        viewForRecommend.addSubview(littleround)
        
        }
    
    //推荐2
    func updatetRecommend(_ a:Int,b:Int){
        
        ttitle = ["乱七八糟游1","乱七八糟游2","乱七八糟游3","乱七八糟游4"]
        for i in 0..<4{
            var a = i+1
            timageForRecommend.append(UIImage(named: "image"+String(a))!)}
        
        trecommend = ["1好好玩啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊","2好好玩啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊","3好好玩啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊","4好好玩啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊"]
        
        tscore = [5.0,4.9,4.8,4.7]
        
        tNumberOfGo = [1000,999,998,997]
        
        tNumberOfLike = [1000,999,998,997]
        
        viewFortRecommend = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: CGFloat(44+(102*trecommend.count))))
        viewFortRecommend.backgroundColor = UIColor(red : 0xD9/255, green : 0xD9/255, blue : 0xD9/255, alpha : 1);
        
        var littleview2 = UIView(frame:CGRect(x: CGFloat(b)*self.frame.width/4, y: 42, width: self.frame.width/4, height: 2))
        littleview2.backgroundColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1)
        
        rbutton0 = UIButton(frame:CGRect(x: 0, y: 0, width: self.frame.width/4, height: 44))
        rbutton0.addTarget(self, action: #selector(MaintableView.tappedForDestination(_:)), for: UIControlEvents.touchUpInside)
        rbutton0.setTitle(stringForRbutton[a][0], for: UIControlState())
        rbutton0.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        rbutton0.setTitleColor(UIColor.black, for: UIControlState())
        rbutton0.backgroundColor = UIColor.white
        rbutton0.tag = 10*a
        rbutton0.addTarget(self, action: #selector(MaintableView.tappedForRecommend(_:)), for: UIControlEvents.touchUpInside)
        if(b == 0){rbutton0.setTitleColor(UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1), for: UIControlState())}
        rbutton1 = UIButton(frame:CGRect(x: self.frame.width/4, y: 0, width: self.frame.width/4, height: 44))
        rbutton1.addTarget(self, action: #selector(MaintableView.tappedForDestination(_:)), for: UIControlEvents.touchUpInside)
        rbutton1.setTitle(stringForRbutton[a][1], for: UIControlState())
        rbutton1.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        rbutton1.setTitleColor(UIColor.black, for: UIControlState())
        rbutton1.backgroundColor = UIColor.white
        rbutton1.tag = 10*a+1
        rbutton1.addTarget(self, action: #selector(MaintableView.tappedForRecommend(_:)), for: UIControlEvents.touchUpInside)
        if(b == 1){rbutton1.setTitleColor(UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1), for: UIControlState())}
        rbutton2 = UIButton(frame:CGRect(x: self.frame.width*2/4, y: 0, width: self.frame.width/4, height: 44))
        rbutton2.addTarget(self, action: #selector(MaintableView.tappedForDestination(_:)), for: UIControlEvents.touchUpInside)
        rbutton2.setTitle(stringForRbutton[a][2], for: UIControlState())
        rbutton2.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        rbutton2.setTitleColor(UIColor.black, for: UIControlState())
        rbutton2.backgroundColor = UIColor.white
        rbutton2.tag = 10*a+2
        rbutton2.addTarget(self, action: #selector(MaintableView.tappedForRecommend(_:)), for: UIControlEvents.touchUpInside)
        if(b == 2){rbutton2.setTitleColor(UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1), for: UIControlState())}
        rbutton3 = UIButton(frame:CGRect(x: self.frame.width*3/4, y: 0, width: self.frame.width/4, height: 44))
        rbutton3.addTarget(self, action: #selector(MaintableView.tappedForDestination(_:)), for: UIControlEvents.touchUpInside)
        rbutton3.setTitle(stringForRbutton[a][3], for: UIControlState())
        rbutton3.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        rbutton3.setTitleColor(UIColor.black, for: UIControlState())
        rbutton3.backgroundColor = UIColor.white
        rbutton3.tag = 10*a+3
        rbutton3.addTarget(self, action: #selector(MaintableView.tappedForRecommend(_:)), for: UIControlEvents.touchUpInside)
        if(b == 3){rbutton3.setTitleColor(UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1), for: UIControlState())}
      
        viewFortRecommend.addSubview(rbutton0)
        viewFortRecommend.addSubview(rbutton1)
        viewFortRecommend.addSubview(rbutton2)
        viewFortRecommend.addSubview(rbutton3)
        viewFortRecommend.addSubview(littleview2)
        
        for i in 0 ..< ttitle.count {
        var bigview = UIView(frame: CGRect(x: 0, y: CGFloat(48+102*i), width: self.frame.width, height: 98))
        bigview.backgroundColor = UIColor.white
        viewFortRecommend.addSubview(bigview)
        
        var imagek = UIImageView(image: timageForRecommend[i])
        imagek.frame = CGRect(x: 16, y: 10, width: 105, height: 80)
        
        var titlek = UILabel(frame: CGRect(x: 136, y: 12, width:210 , height: 15))
        titlek.text = ttitle[i]
        titlek.font = UIFont.systemFont(ofSize: 17)
            
        var scorek = UILabel(frame: CGRect(x: self.frame.width-40, y: 12, width: 40, height: 15))
        scorek.text = String(tscore[i])
        scorek.font = UIFont.systemFont(ofSize: 17)
        scorek.textColor = UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 1)
            
        var likek = UILabel(frame: CGRect(x: 136, y:42 , width: 100, height: 10))
        likek.text = String(tNumberOfLike[i])
        likek.font = UIFont.systemFont(ofSize: 15)
        likek.textColor = UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 1)
            
        var renxihuan = UILabel(frame: CGRect(x: 176, y:42 , width: 100, height: 10))
        renxihuan.text = "人收藏"
        renxihuan.font = UIFont.systemFont(ofSize: 14)
        renxihuan.textColor = UIColor.black
            
        var gok = UILabel(frame: CGRect(x: 236, y:42 , width: 100, height: 10))
        gok.text = String(tNumberOfGo[i])
        gok.font = UIFont.systemFont(ofSize: 15)
        gok.textColor = UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 1)
            
        var renchuyou = UILabel(frame: CGRect(x: 276, y:42 , width: 100, height: 10))
        renchuyou.text = "人出游"
        renchuyou.font = UIFont.systemFont(ofSize: 14)
        renchuyou.textColor = UIColor.black
            
        var commentk = UILabel(frame: CGRect(x: 136, y: 52, width: self.frame.width-136-5, height:50) )
        commentk.text = trecommend[i]
        commentk.font = UIFont.systemFont(ofSize: 14)
        commentk.lineBreakMode = NSLineBreakMode.byWordWrapping
        commentk.numberOfLines = 0
            
        var buttonk = UIButton(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 98))
        buttonk.backgroundColor = UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 0)
        buttonk.addTarget(self, action: #selector(MaintableView.tappedForRecommend2(_:)), for: UIControlEvents.touchUpInside)
        buttonk.tag = i
        
        bigview.addSubview(imagek)
        bigview.addSubview(titlek)
        bigview.addSubview(scorek)
        bigview.addSubview(likek)
        bigview.addSubview(renxihuan)
        bigview.addSubview(renchuyou)
        bigview.addSubview(gok)
        bigview.addSubview(commentk)
        bigview.addSubview(buttonk)
        
      
        }
        
        }
    
    
    func tappedForRecommend(_ button:UIButton){
    print(button.tag)
        updatetRecommend(button.tag/10, b: button.tag%10)
        tableview.reloadData()
    
    }
    
    func tappedForRecommend2(_ button:UIButton){
    print("点了以下推荐: "+String(ttitle[button.tag]))
        var title = String(ttitle[button.tag])
        delegate?.jumpToInformationView(title!)
    
    
    }
    
    
    
    
    
    
    
}
