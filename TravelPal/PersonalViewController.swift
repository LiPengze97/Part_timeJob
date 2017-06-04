//
//  PersonalViewController.swift
//  ShiXun
//
//  Created by macbook on 2017/4/24.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit

class PersonalViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var nextview = DetailViewController()
    var images: [String] = []
    var titles: [String] = []
    var prices: [String] = []
    var collectionview : UICollectionView!
    var headView : UIView!
    var btn : UIButton!
    let screenwidth = UIScreen.main.applicationFrame.size.width
    let screenheight = UIScreen.main.applicationFrame.size.height
    
    func tapped(){
        self.performSegue(withIdentifier: "btn", sender: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 20, width: screenwidth, height: 44)
        self.navigationController?.navigationBar.setTitleVerticalPositionAdjustment(-40, for: UIBarMetrics.default)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //隐藏返回按钮
        self.navigationItem.hidesBackButton = true
        //左侧设置按钮
        let item=UIBarButtonItem(title: "设置", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = item
        
        //上部个人信息
        headView = UIView(frame: CGRect(x: 0, y: 64, width: screenwidth, height: 170))
        headView.backgroundColor = UIColor(patternImage: UIImage(named: "personal_bg.jpg")!)
        
        //根据是否登录显示两种界面
        var loginBtn = UIButton(frame: CGRect(x: screenwidth/2-50, y: 120, width: 100, height: 20))
        loginBtn.setTitle("点击登录", for: .normal)
        headView.addSubview(loginBtn)
        
        let imagehead = UIImageView(image: UIImage(named: "xiamen.jpg"))
        imagehead.frame = CGRect(x:screenwidth/2-40, y:30, width:80, height:80)
        imagehead.contentMode = .scaleAspectFill
        //设置遮罩
        imagehead.layer.masksToBounds = true
        //设置圆角半径(宽度的一半)，显示成圆形。
        imagehead.layer.cornerRadius = imagehead.frame.width/2
        headView.addSubview(imagehead)
//        let nameLabel = UILabel(frame: CGRect(x: 20+screenwidth/2, y: 10, width: screenwidth/2, height: (screenheight/3-20)/2))
//        nameLabel.font = UIFont.systemFont(ofSize: 25)
//        //设置文本的内容
//        nameLabel.text = "石楚涵"
//        let phoneLabel = UILabel(frame: CGRect(x: 20+screenwidth/2, y: 10+screenwidth/2, width: screenwidth/2, height: (screenheight/3-20)/2))
//        phoneLabel.font = UIFont.systemFont(ofSize: 20)
//        //设置文本的内容
//        phoneLabel.text = "17864154901"
//        //添加到视图中
//        headView.addSubview(nameLabel)
//        headView.addSubview(phoneLabel)
//        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: screenwidth/2, height: (screenheight/3-20)))
//        //imageView.image = UIImage(named: "")
//        headView.addSubview(imageView)
        //添加到视图中
        self.view.addSubview(headView)
        
        //下部的collectionview
        let layout = UICollectionViewFlowLayout()
        collectionview = UICollectionView(frame:CGRect(x:0, y:234, width:screenwidth, height:screenheight-234), collectionViewLayout: layout)
        
        //注册一个cell
        collectionview.register(DingDanCell.self, forCellWithReuseIdentifier:"cell")

        //注册两个section的headView
        collectionview.register(UICollectionReusableView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "DingDanheaderView")
        collectionview.register(UICollectionReusableView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "GongJuheaderView")
        collectionview.delegate = self as? UICollectionViewDelegate
        collectionview.dataSource = self as? UICollectionViewDataSource
        
        collectionview.backgroundColor = kRGBColorFromHex(rgbValue: 0xf2f2f2)
        
        self.view.addSubview(collectionview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section==0 {
            return 4
        }
        else{
            return 8
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 5, left: 0, bottom: 1, right: 0)
    }
    
    //单元格的行间距
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    //单元格横向的最小间距
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        //每一个cell的大小
        if(indexPath.section==0){
            return CGSize(width: (screenwidth-16)/4, height: 65)
        }
        else{
            return CGSize(width: (screenwidth-16)/4, height: 55)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        // 设置sectionHeader的size
        return CGSize(width: screenwidth, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        //设置sectionHeader
        if(indexPath.section==0){
            let headerView=collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "DingDanheaderView", for: indexPath as IndexPath)
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenwidth, height: 40))
            label.text=" 我的订单"
            label.textColor = kRGBColorFromHex(rgbValue: 0x323232)
            label.font = UIFont.systemFont(ofSize: 14)
            headerView.addSubview(label)
            headerView.backgroundColor = UIColor.white
            return headerView
        }
        else{
            let headerView=collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "GongJuheaderView", for: indexPath as IndexPath)
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenwidth, height: 40))
            label.text=" 常用工具"
            label.textColor = kRGBColorFromHex(rgbValue: 0x323232)
            label.font = UIFont.systemFont(ofSize: 14)
            headerView.addSubview(label)
            headerView.backgroundColor = UIColor.white
            return headerView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DingDanCell
        
        switch indexPath.section{
        case 0:
            switch indexPath.item {
            case 0:
                cell?.frame = CGRect(x: 0, y: 42, width: (screenwidth-16)/4, height: 65)
                cell?.btnText = "全部订单"
                cell?.btnImage = "use.png"
                //self.btn = cell?.btn
                //btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
            case 1:
                cell?.frame = CGRect(x: screenwidth/4, y: 42, width: (screenwidth-16)/4, height: 65)
                cell?.btnText = "待付款"
                cell?.btnImage = "pay.png"
                self.btn = cell?.btn
            case 2:
                cell?.frame = CGRect(x: 2*screenwidth/4, y: 42, width: (screenwidth-16)/4, height: 65)
                cell?.btnText = "处理中"
                cell?.btnImage = "after.png"
                self.btn = cell?.btn
            case 3:
                cell?.frame = CGRect(x: 3*screenwidth/4, y: 42, width: (screenwidth-16)/4, height: 65)
                cell?.btnText = "已成功"
                cell?.btnImage = "evaluate.png"
                self.btn = cell?.btn
            default: break
            }
        case 1:
            switch indexPath.item {
            case 0:
                cell?.frame = CGRect(x: 0, y: 157, width: screenwidth/4, height: 55)
                cell?.btnText = "收藏商品"
                cell?.btnImage = "personal_collect.png"
                //btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
                self.btn = cell?.btn
                
            case 1:
                cell?.frame = CGRect(x: screenwidth/4, y: 157, width: screenwidth/4, height: 55)
                cell?.btnText = "购物车"
                cell?.btnImage = "personal_car.png"
//                btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
                self.btn = cell?.btn
            case 2:
                cell?.frame = CGRect(x: 2*screenwidth/4, y: 157, width: screenwidth/4, height: 55)
                cell?.btnText = "我的旅伴"
                cell?.btnImage = "personal_friend.png"
//                btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
                self.btn = cell?.btn
            case 3:
                cell?.frame = CGRect(x: 3*screenwidth/4, y: 157, width: screenwidth/4, height: 55)
                cell?.btnText = "想去目的地"
                cell?.btnImage = "personal_destination.png"
//                btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
                self.btn = cell?.btn
            case 4:
                cell?.frame = CGRect(x: 0, y: 212, width: screenwidth/4, height: 55)
                cell?.btnText = "我的客服"
                cell?.btnImage = "personal_connectus.png"
//                btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
                self.btn = cell?.btn
            case 5:
                cell?.frame = CGRect(x: screenwidth/4, y: 212, width: screenwidth/4, height: 55)
                cell?.btnText = "曾经去过"
                cell?.btnImage = "personal_demand.png"
//                btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
                self.btn = cell?.btn
            case 6:
                cell?.frame = CGRect(x: 2*screenwidth/4, y: 212, width: screenwidth/4, height: 55)
                cell?.btnText = ""
//                btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
                self.btn = cell?.btn
            case 7:
                cell?.frame = CGRect(x: 3*screenwidth/4, y: 212, width: screenwidth/4, height: 55)
                cell?.btnText = ""
//                btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
                self.btn = cell?.btn
            default: break
            }
        default:break
        }
        return cell!
    }
    
    func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,alpha: 1.0)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "btn"
        {
            let destinationController = segue.destination as! DetailViewController
            destinationController.tits = self.titles
            destinationController.images = self.images
            destinationController.prices = self.prices
        }
    }
}
