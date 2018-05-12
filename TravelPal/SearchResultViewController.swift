//
//  SearchResultViewController.swift
//  lvban
//
//  Created by 冼啟棉 on 17/6/15.
//  Copyright © 2017年 冼啟棉. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var tableview = UITableView()
    var result = ""
    
    var elseImage = [UIImage]()
    var elseName = [String]()
    var elseScore = [Double]()
    var elseLike = [Int]()
    var elseGo = [Int]()
    var elseConment = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        elseName = [result+"1",result+"2",result+"3",result+"4"]
        elseScore = [5.0,4.9,4.8,4.7]
        elseGo = [1000,999,998,997]
        elseLike = [2000,1000,999,998]
        elseConment = ["1赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞","2赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞","3赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞","4赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞赞"]
        for i in 1...4 {
            let img = UIImage(named: "image"+""+String(i))
            elseImage.append(img!)
        }
        
        if(result == "济南"){
            elseName = ["济南趵突泉＋曲阜三孔＋泰山三日游","济南－大明湖＋千佛山＋洪家楼天主教堂","济南趵突泉＋大明湖＋泰山2日游","济南－泰安－青岛4日游","济南－泰山－曲阜－青岛－崂山4日游","济南－泉城广场＋趵突泉＋大明湖","文化之旅济南曲阜2日游"]
            elseScore = [4.6,4.3,4.7,4.7,4.1,4.5,4.6]
            elseGo = [25,158,451,127,135,141,278]
            elseLike = [32,56,75,152,15,87,99]
            elseConment = ["路线不错，三天去了三个地方，把山东游了一半，导游很热情细心，下次再游别的","教堂很漂亮啊，真的值得一去，下雨河畔的大明湖，哈哈，不错","行程有点赶，但是总体感觉还不错，两天游了济南还爬了泰山，就是泰山上人有点多","终于去了一直想去的青岛，行程安排还可以，可惜在青岛待的时间太少，有待改进","4天玩了四个地方爬了两座山（捂脸）行程很充实，小孩玩得很开心，下次继续？","第一次抱一天的旅行团，总体感觉不错，中午吃饭的餐厅很好，值得报，但不建议带着小孩和老人","济南曲阜2日游，很充实的2天，玩得很累，行程稍微有点紧凑，中途休息时间多一点就更好了，总体不错"]
        //    var imageString4 = ["","","","","","",""]
            elseImage = []
            for i in 1...7 {
                let img = UIImage(named: "jinan"+""+String(i))
                elseImage.append(img!)
            }
        }
        
        if(result == "牛人专线"){
            elseName = ["普基诺富特4晚6日自助游","济南－大明湖＋千佛山＋洪家楼天主教堂","三亚蜈支洲天涯海角5日游","济南－泰安－青岛4日游","济南－泰山－曲阜－青岛－崂山4日游","济南－泉城广场＋趵突泉＋大明湖","张家界—凤凰古城—天门山—黄龙洞"]
            elseScore = [4.8,4.3,4.9,4.7,4.1,4.5,4.8]
            elseGo = [884,158,741,127,135,141,2400]
            elseLike = [154,56,98,152,15,87,802]
            elseConment = ["酒店超赞，超大露天游泳池，酒店有1楼豪华房，阳台直通游泳池，很划算","教堂很漂亮啊，真的值得一去，下雨河畔的大明湖，哈哈，不错","行程非常不错。玩得很尽兴。也没有强制购物！三亚必游景点也都在行程内","终于去了一直想去的青岛，行程安排还可以，可惜在青岛待的时间太少，有待改进","4天玩了四个地方爬了两座山（捂脸）行程很充实，小孩玩得很开心，下次继续？","第一次抱一天的旅行团，总体感觉不错，中午吃饭的餐厅很好，值得报，但不建议带着小孩和老人","游玩了景观秀丽、美不胜收的黄龙洞；感受了山水相对让人心旷神怡的天然大氧吧武陵山：无限风光"]
                var imageString4 = ["puji1","jinan2","sanya1","jinan4","jinan5","jinan6","zhangjia1"]
            elseImage = []
            for i in 1...7 {
                let img = UIImage(named: imageString4[i-1] )
                elseImage.append(img!)
            }
        }
        
        
        
       //CCCCCCCCCCCCCCCCCC   
        let leftbutton = UIButton(frame: CGRect(x: 11, y: 27, width:60 , height: 36))
        //leftbutton.backgroundColor = UIColor.orangeColor()
      //  leftbutton.setImage(UIImage(named:"back" ), forState: UIControlState())
       // leftbutton.imageView!.contentMode = .ScaleAspectFit
       
      
        leftbutton.setTitle("返回", for: UIControlState())
        leftbutton.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        leftbutton.setTitleColor(UIColor.white, for: UIControlState())
        leftbutton.addTarget(self, action: #selector(SearchResultViewController.tappedLeft(_:)), for: UIControlEvents.touchUpInside)
        //CCCCCCCCCCCCCCCCCC
        
        let topView = UIView()
        topView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 64)
        topView.backgroundColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1);
        
        let title = UILabel()
        title.frame = CGRect(x: 0, y: 25, width: self.view.frame.width, height: 35)
        title.backgroundColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1);
        title.text = result
        title.textAlignment = NSTextAlignment.center
        title.textColor = UIColor.white
        
        topView.addSubview(title)
        topView.addSubview(leftbutton)
        self.view.addSubview(topView)
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.frame = CGRect(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height-64)
        self.view.addSubview(tableview)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath:IndexPath) ->CGFloat{
       
        return CGFloat(elseName.count*102)
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "aaa")
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        for i in 1...elseImage.count {
            let bigView = UIView()
            bigView.frame = CGRect(x: 0, y: CGFloat(102*(i-1)), width: self.view.frame.width, height: 100)
            bigView.backgroundColor = UIColor.white
            
            let imagek = UIImageView(image: elseImage[i-1])
            imagek.frame = CGRect(x: 16, y: 10, width: 105, height: 80)
            
            let titlek = UILabel(frame: CGRect(x: 136, y: 12, width:210 , height: 15))
            titlek.text = elseName[i-1]
            titlek.font = UIFont.systemFont(ofSize: 16)
            
            let scorek = UILabel(frame: CGRect(x: self.view.frame.width-40, y: 12, width: 40, height: 15))
            scorek.text = String(elseScore[i-1])
            scorek.font = UIFont.systemFont(ofSize: 17)
            scorek.textColor = UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 1)
            
            let likek = UILabel(frame: CGRect(x: 136, y:38 , width: 100, height: 12))
            likek.text = String(elseLike[i-1])
            likek.font = UIFont.systemFont(ofSize: 15)
            likek.textColor = UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 1)
            
            let renxihuan = UILabel(frame: CGRect(x: 176, y:38 , width: 100, height: 12))
            renxihuan.text = "人收藏"
            renxihuan.font = UIFont.systemFont(ofSize: 14)
            renxihuan.textColor = UIColor.black
            
            let gok = UILabel(frame: CGRect(x: 236, y:38 , width: 100, height: 12))
            gok.text = String(elseGo[i-1])
            gok.font = UIFont.systemFont(ofSize: 15)
            gok.textColor = UIColor(red : 237/255, green : 127/255, blue : 30/255, alpha : 1)
            
            let renchuyou = UILabel(frame: CGRect(x: 276, y:38 , width: 100, height: 12))
            renchuyou.text = "人出游"
            renchuyou.font = UIFont.systemFont(ofSize: 14)
            renchuyou.textColor = UIColor.black
            
            let commentk = UILabel(frame: CGRect(x: 136, y: 52, width: self.view.frame.width-136-5, height:50) )
            commentk.text = elseConment[i-1]
            commentk.font = UIFont.systemFont(ofSize: 13)
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
            cell.backgroundColor = UIColor(red : 0xD9/255, green : 0xD9/255, blue : 0xD9/255, alpha : 1);
}
        
            
        

        
     return cell
            
        }
    
    
    
    func tappedLeft(_ button:UIButton){
        navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    }
    
    func tapped(_ button:UIButton){
        _ = String(describing: button.title(for: UIControlState()))
        let secondView = InformationViewController()
        secondView.titlek = elseName[button.tag-200-1]
        pushWithoutTab(secondView)
        //self.present(secondView, animated: true, completion: nil)

    }
    
    

}
