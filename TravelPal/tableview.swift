
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
    func jumpToSearchResultView(_ title:String)
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
    var stringForRbutton = [["热门","划算","评价高","多人去"],["热门","划算","评价高","多人去"],["国内游0","国内游1","国内游2","国内游3"],["周围游0","周围游1","周围游2","周围游3"],["自助游0","自助游1","自助游2","自助游3"],["跟团游0","跟团游1","跟团游2","跟团游3"],["酒＋景0","酒＋景1","酒＋景2","酒＋景3"]]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        if(section == 0 ){return 2}
        if(section == 1){return 1}
        if(section == 2){return 1}
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath:IndexPath) ->CGFloat{
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
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "aaa")
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if(indexPath.section == 0 && indexPath.row == 1){cell.addSubview(loopPage)}
        else if(indexPath.section == 0 && indexPath.row == 0){cell.addSubview(viewForClassification)}
        else if(indexPath.section == 1){cell.addSubview(viewForHotDestination)}
        else if(indexPath.section == 2){cell.addSubview(viewForRecommend)}
            
            
        else if(indexPath.section == 3){cell.addSubview(viewFortRecommend)}
        
        return cell
    }
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red : 242/255, green : 242/255, blue : 242/255, alpha : 1);
        
        tableview.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        tableview.delegate = self
        tableview.dataSource = self
        
        hotDestination = ["东南亚","济南","欧洲","厦门","云南","日本","中东非洲","泰国","港澳"]
        hotDestination0 = ["东南亚","济南","欧洲","厦门","云南","日本","中东非洲","泰国","港澳"]
        hotDestination1 = ["英国","美国","新加坡","欧洲","东南亚","俄罗斯","中东非洲","泰国","更多"]
        hotDestination2 = ["广州","上海","北京","深圳","重庆","济南","西安","三亚","更多"]
        hotDestination3 = ["周围1","周围2","周围3","周围4","周围5","周围6","周围7","周围8","更多"]
        hotDestination4 = ["自助1","自助2","自助3","自助4","自助5","自助6","自助7","自助8","更多"]
        hotDestination5 = ["跟团1","跟团2","跟团3","跟团4","跟团5","跟团6","跟团7","跟团8","更多"]
        hotDestination6 = ["酒店1","酒店2","酒店3","酒店4","酒店5","酒店6","酒店7","酒店8","酒店"]
        
        recommend = ["牛人专线","亲子游","爸妈游","朋派制定游","纯玩品质游","当季热玩","明星推荐","哪里值得玩"]
        for _ in 0..<6 {
            imageForRecommend.append(UIImage(named: "image")!)
         
        }
        
        //scrollview的设置
        
        var imageString3 = ["image1","puji1","zhangjia1","sanya1","shandong1","image4"]
        for i in 1...5 {
            let img = UIImage(named: imageString3[i-1])
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
        let cbutton = String(describing: button.title(for: UIControlState()))
        if (cbutton == "Optional(\"旅游\")"){
            hotDestination = hotDestination0
            updateViewForClassification(0)
            updateHotDestination()
            updateRecommend()
            updatetRecommend(0,b: 0)
            tableview.reloadData()
        } else if (cbutton == "Optional(\"出境游\")"){
            hotDestination = hotDestination1
            updateViewForClassification(1)
            updateHotDestination()
            updateRecommend()
            updatetRecommend(1,b: 0)
            tableview.reloadData()
        } else if (cbutton == "Optional(\"国内游\")"){
            hotDestination = hotDestination2
            updateViewForClassification(2)
            updateHotDestination()
            updateRecommend()
            updatetRecommend(2,b: 0)
            tableview.reloadData()
        } else if (cbutton == "Optional(\"周围游\")"){
            hotDestination = hotDestination3
            updateViewForClassification(3)
            updateHotDestination()
            updateRecommend()
            updatetRecommend(3,b: 0)
            tableview.reloadData()
        } else if (cbutton == "Optional(\"自助游\")"){
            hotDestination = hotDestination4
            updateViewForClassification(4)
            updateHotDestination()
            updateRecommend()
            updatetRecommend(4,b: 0)
            tableview.reloadData()
        } else if (cbutton == "Optional(\"跟团游\")"){
            hotDestination = hotDestination5
            updateViewForClassification(5)
            updateHotDestination()
            updateRecommend()
            updatetRecommend(5,b: 0)
            tableview.reloadData()
        } else if (cbutton == "Optional(\"酒＋景\")"){
            hotDestination = hotDestination6
            updateViewForClassification(6)
            updateHotDestination()
            updateRecommend()
            updatetRecommend(6,b: 0)
            tableview.reloadData()
        }
        
        
        for i in 1...recommend.count {
            if(cbutton == "Optional(\""+recommend[i-1]+"\")"){
                delegate?.jumpToSearchResultView(recommend[i-1])
            }
        }
        
        if(button.tag>=900){
            let p = button.tag-900
            delegate?.jumpToSearchResultView(hotDestination[p])
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
        
        let littleround = UIView(frame: CGRect(x: 7, y: 13, width: 18, height: 18))
        littleround.backgroundColor = UIColor.orange
        littleround.layer.cornerRadius = 9

        let label1 = UILabel(frame:CGRect(x: 0, y: 0, width: self.frame.width, height: 44))
        label1.text = "       热门目搜索"
        label1.backgroundColor = UIColor.white
        
        for i in 0 ..< 3 {
            let sw = (SCREEN_WIDTH-2*3)/3
            let sx = sw+3;
            
            for j in 0 ..< 3 {
                let button = UIButton(frame: CGRect(x: Int(sx)*j, y: (i*46+46), width: Int(sw), height: 44))
                
                //                let button = UIButton(frame:CGRect(x:CGFloat(Double(j)*126+1), y: CGFloat(i*46+46), width:124 , height: CGFloat(44)))
                button.backgroundColor = UIColor.white
                button.setTitle(hotDestination[3*i+j], for: UIControlState())
                if(i == 0 && j == 0){ button.setTitleColor(UIColor(red : 217/255, green : 29/255, blue : 29/255, alpha : 1), for: UIControlState())}
                else if(i == 0 && j == 1){ button.setTitleColor(UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 1), for: UIControlState())}
                else if(i == 0 && j == 2){ button.setTitleColor(UIColor(red : 239/255, green : 207/255, blue : 58/255, alpha : 1), for: UIControlState())}
                else{button.setTitleColor(UIColor.black, for: UIControlState())}
                button.titleLabel!.font = UIFont.systemFont(ofSize: 14)
                
                //
                button.tag = 900+3*i+j
                //
                button.addTarget(self, action: #selector(MaintableView.tappedForDestination(_:)), for: UIControlEvents.touchUpInside)
                viewForHotDestination.addSubview(button)
            }
        }
        
        for o in 0 ..< 3 {
            let imageb = UIImageView(image: UIImage(named: "p"+String(o+1)))
            imageb.contentMode = .scaleAspectFit
            let u = Int(SCREEN_WIDTH/3)
            imageb.frame = CGRect(x: u*o+14, y: 58, width: 20, height: 20)
            viewForHotDestination.addSubview(imageb)
        }
        viewForHotDestination.addSubview(label1)
        viewForHotDestination.addSubview(littleround)
        
    }
    //推荐1
    func updateRecommend(){
        viewForRecommend = UIView(frame:CGRect(x: 0, y: 0, width: self.frame.width, height: 224))
        viewForRecommend.backgroundColor = UIColor(red : 0xD9/255, green : 0xD9/255, blue : 0xD9/255, alpha : 1);
        let label2 = UILabel(frame:CGRect(x: 0, y: 0, width: self.frame.width, height: 44))
        label2.text = "       热门推荐"
        label2.backgroundColor = UIColor.white
        
        let littleround = UIView(frame: CGRect(x: 7, y: 13, width: 18, height: 18))
        littleround.backgroundColor = UIColor.orange
        littleround.layer.cornerRadius = 9
        
        for i in 0 ..< 2 {
            let sw = (SCREEN_WIDTH-2*3)/3
            let sx = sw+3;
            
            for j in 0 ..< 3 {
                
                let button = BGButton(frame:CGRect(x: Int(sx)*j, y: (46+i*90), width:Int(sw) , height: 88))
                
                //                let button = BGButton(frame:CGRect(x:CGFloat(1+126*j), y: CGFloat(46+i*90), width:124 , height: 88))
                button.backgroundColor = UIColor.white
                button.addTarget(self, action: #selector(MaintableView.tappedForDestination(_:)), for: UIControlEvents.touchUpInside)
                //var imagea = UIImage(named: "r"+String(3*i+j))
                
                let imagea = UIImage(named: "r"+String(3*i+j+1
                    ))
                
                
                button.setImage(imagea, for: UIControlState())
                button.setTitle(recommend[3*i+j], for: UIControlState())
                
                button.layoutSubviews()
                
                viewForRecommend.addSubview(button)
            }}
        
        viewForRecommend.addSubview(label2)
        viewForRecommend.addSubview(littleround)
        
    }
    
    //ccccccccccccccccccccc整个方法 推荐2
    func updatetRecommend(_ a:Int,b:Int){
        
        ttitle = ["普基诺富特4晚6日自助游","三亚蜈支洲天涯海角5日游","张家界—凤凰古城—天门山—黄龙洞","济南—曲阜—泰山—青岛—海阳"]
        
        for i in 0..<4{
            if(i == 0)
            { timageForRecommend.append(UIImage(named: "puji1")!)}
            else if(i == 1)
            { timageForRecommend.append(UIImage(named: "sanya1")!)}
            else if(i == 2)
            { timageForRecommend.append(UIImage(named: "zhangjia1")!)}
            else{   timageForRecommend.append(UIImage(named: "shandong1")!)}}
        
        trecommend = ["酒店超赞，超大露天游泳池，酒店有1楼豪华房，阳台直通游泳池，很划算","行程非常不错。玩得很尽兴。也没有强制购物！三亚必游景点也都在行程内","游玩了景观秀丽、美不胜收的黄龙洞；感受了山水相对让人心旷神怡的天然大氧吧武陵山：无限风光","去了一直想去的几个城市，看了有山有水的大美山东，整体感觉不错，导游人很好，很细心很热情"]
        
        tscore = [4.8,4.9,4.8,4.7]
        
        tNumberOfGo = [884,741,2400,170]
        
        tNumberOfLike = [154,98,802,58]
        
        viewFortRecommend = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: CGFloat(44+(102*trecommend.count))))
        viewFortRecommend.backgroundColor = UIColor(red : 0xD9/255, green : 0xD9/255, blue : 0xD9/255, alpha : 1);
        
        let littleview2 = UIView(frame:CGRect(x: CGFloat(b)*self.frame.width/4, y: 42, width: self.frame.width/4, height: 2))
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
            let bigview = UIView(frame: CGRect(x: 0, y: CGFloat(48+102*i), width: self.frame.width, height: 98))
            bigview.backgroundColor = UIColor.white
            viewFortRecommend.addSubview(bigview)
            
            let imagek = UIImageView(image: timageForRecommend[i])
            imagek.frame = CGRect(x: 16, y: 10, width: 105, height: 80)
            
            let titlek = UILabel(frame: CGRect(x: 136, y: 12, width:175 , height: 15))
            titlek.text = ttitle[i]
            titlek.font = UIFont.systemFont(ofSize: 17)
            
            let scorek = UILabel(frame: CGRect(x: self.frame.width-25, y: 12, width: 25, height: 15))
            scorek.text = String(tscore[i])
            scorek.font = UIFont.systemFont(ofSize: 17)
            scorek.textColor = UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 1)
            
            let likek = UILabel(frame: CGRect(x: 136, y:42 , width: 100, height: 10))
            likek.text = String(tNumberOfLike[i])
            likek.font = UIFont.systemFont(ofSize: 15)
            likek.textColor = UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 1)
            
            let renxihuan = UILabel(frame: CGRect(x: 176, y:42 , width: 100, height: 10))
            renxihuan.text = "人收藏"
            renxihuan.font = UIFont.systemFont(ofSize: 14)
            renxihuan.textColor = UIColor.black
            
            let gok = UILabel(frame: CGRect(x: 236, y:42 , width: 100, height: 10))
            gok.text = String(tNumberOfGo[i])
            gok.font = UIFont.systemFont(ofSize: 15)
            gok.textColor = UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 1)
            
            let renchuyou = UILabel(frame: CGRect(x: 276, y:42 , width: 100, height: 10))
            renchuyou.text = "人出游"
            renchuyou.font = UIFont.systemFont(ofSize: 14)
            renchuyou.textColor = UIColor.black
            
            let commentk = UILabel(frame: CGRect(x: 136, y: 52, width: self.frame.width-136-5, height:50) )
            commentk.text = trecommend[i]
            commentk.font = UIFont.systemFont(ofSize: 14)
            commentk.lineBreakMode = NSLineBreakMode.byWordWrapping
            commentk.numberOfLines = 0
            
            let buttonk = UIButton(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 98))
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
        let title = String(ttitle[button.tag])
        delegate?.jumpToInformationView(title!)
    }
 
}
