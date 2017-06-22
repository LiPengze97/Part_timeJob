//
//  PersonalViewController.swift
//  ShiXun
//
//  Created by macbook on 2017/4/24.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PersonalViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    //cccccccccc
    var tit = ""
    
    var collectionview : UICollectionView!
    var headView : UIView!
    var btn : UIButton!
    let screenwidth = UIScreen.main.applicationFrame.size.width
    let screenheight = UIScreen.main.applicationFrame.size.height
    let notification = NotificationCenter.default
    func tapped1(){
        self.tit = "全部订单"
        closeButtonTapped1()
    }
    func tapped2(){
        self.tit = "待付款"
        closeButtonTapped1()
    }
    func tapped3(){
        self.tit = "已成功"
        closeButtonTapped1()
    }
    func tapped4(){
        //得到全部收藏，传给下一页
        self.tit = "收藏商品"
        closeButtonTapped2()
    }
    func tapped5(){
        //得到全部报名，传给下一页
        self.tit = "报名旅游信息"
        closeButtonTapped2()
    }
    func tapped6(){
        self.tit = "我的旅伴"
        closeButtonTapped2()
    }
    func tapped7(){
        self.tit = "想去目的地"
        closeButtonTapped2()
    }
    func tapped8(){
        self.tit = "曾经去过"
        closeButtonTapped2()
    }
    func tappedlogin(){
        let secondViewController = SignViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    //设置按钮
    
    func tapped9(){
        UserManager.shared.getUserInfo()
    }
    override func viewWillDisappear(_ animated: Bool) {
        notification.removeObserver(self)
        UserManager.removeObserver(observer: self, notification: .didGetUserInfo)
        UserManager.removeObserver(observer: self, notification: .didGetUserInfoFailure)
    }
    func userDidGetUserInfo(notification: NSNotification) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(0), execute: {
            self.closeButtonTapped()
        })
    }
    func userDidGetUserInfoFailure(notification: NSNotification) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(0), execute: {
            self.closeButtonTapped()
        })
    }
    func closeButtonTapped() {
        let secondViewController = PersonalInfoViewController()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(0), execute: {
            self.navigationController?.pushViewController(secondViewController, animated: true)
        })
    }
    //订单
    func closeButtonTapped1() {
        let secondViewController = DetailDingDanViewController()
        secondViewController.navigationTitle = self.tit
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(0), execute: {
            self.navigationController?.pushViewController(secondViewController, animated: true)
        })
    }
    //细节
    func closeButtonTapped2() {
        let secondViewController = DetailViewController()
        secondViewController.titleString = self.tit
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(0), execute: {
            self.navigationController?.pushViewController(secondViewController, animated: true)
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.tabBarController?.tabBar.isHidden = false
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 20, width: screenwidth, height: 44)
        self.navigationController?.navigationBar.setTitleVerticalPositionAdjustment(-40, for: UIBarMetrics.default)
        self.headView.reloadInputViews()
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.barTintColor = UIColor(patternImage: UIImage(named: "personal_bg.jpg")!)
        UserManager.addObserver(observer: self, selector: .userDidGetUserInfo, notification: .didGetUserInfo)
        UserManager.addObserver(observer: self, selector: .userDidGetUserInfoFailure, notification: .didGetUserInfoFailure)
    }
    //cccccccccccc
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //隐藏返回按钮
        self.navigationItem.hidesBackButton = true
        //左侧设置按钮
        let item=UIBarButtonItem(title: "设置", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = item
        self.navigationItem.rightBarButtonItem?.action = #selector(PersonalViewController.tapped9)
        
        //上部个人信息
        headView = UIView(frame: CGRect(x: 0, y: 64, width: screenwidth, height: 170))
        headView.backgroundColor = UIColor(patternImage: UIImage(named: "personal_bg.jpg")!)
        
        //ccccccccccccccccc
        //根据是否登录显示两种界面
        if UserManager.shared.isLogIn {
            //用url显示头像
            //改info的样子
            var url = "http://118.190.69.5:65530/headimg/"+UserManager.shared.tel
            var imagehead : UIImageView!
            var urlStr = NSURL(string: url)!
            var nsd = NSData(contentsOf: urlStr as URL)
            
            var img: UIImage? = nil
            if nsd != nil {
                imagehead = UIImageView()
                img = UIImage(data: nsd! as Data)!
                imagehead.image = img
            }
            else{
                imagehead = UIImageView(image: UIImage(named: "personal_person"))
            }
            imagehead.frame = CGRect(x:screenwidth/2-40, y:30, width:80, height:80)
            imagehead.contentMode = .scaleAspectFill
            imagehead.layer.borderWidth=2
            imagehead.layer.borderColor = kRGBColorFromHex(rgbValue: 0x656565).cgColor
            //设置遮罩
            imagehead.layer.masksToBounds = true
            //设置圆角半径(宽度的一半)，显示成圆形。
            imagehead.layer.cornerRadius = imagehead.frame.width/2
            headView.addSubview(imagehead)
            var username = UILabel(frame: CGRect(x: screenwidth/2-60, y: 120, width: 120, height: 20))
            username.text = UserManager.shared.tel
            username.textColor = UIColor.white
            headView.addSubview(imagehead)
            headView.addSubview(username)
        }
        else{
            let imagehead = UIImageView(image: UIImage(named: "personal_person"))
            imagehead.frame = CGRect(x:screenwidth/2-40, y:30, width:80, height:80)
            imagehead.contentMode = .scaleAspectFill
            imagehead.layer.borderWidth=2
            imagehead.layer.borderColor = kRGBColorFromHex(rgbValue: 0x656565).cgColor
            //设置遮罩
            imagehead.layer.masksToBounds = true
            //设置圆角半径(宽度的一半)，显示成圆形。
            imagehead.layer.cornerRadius = imagehead.frame.width/2
            headView.addSubview(imagehead)
            var loginBtn = UIButton(frame: CGRect(x: screenwidth/2-50, y: 120, width: 100, height: 20))
            loginBtn.setTitle("点击登录", for: .normal)
            loginBtn.addTarget(self, action: #selector(tappedlogin), for: .touchUpInside)
            headView.addSubview(loginBtn)
            headView.addSubview(imagehead)
        }
        //cccccccccccccccccccccccccccccccc
        
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
            return 3
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
            return CGSize(width: (screenwidth-16)/3, height: 65)
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
    //ccccccccccccccccccccccccc
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DingDanCell
        
        switch indexPath.section{
        case 0:
            switch indexPath.item {
            case 0:
                cell?.frame = CGRect(x: 0, y: 42, width: (screenwidth-16)/3, height: 65)
                cell?.btnText = "全部订单"
                cell?.btnImage = "use.png"
                cell?.btn?.addTarget(self, action: #selector(tapped1), for: .touchUpInside)
                UserManager.shared.tap1()
                
            case 1:
                cell?.frame = CGRect(x: screenwidth/3, y: 42, width: (screenwidth-16)/3, height: 65)
                cell?.btnText = "待付款"
                cell?.btnImage = "pay.png"
                cell?.btn?.addTarget(self, action: #selector(tapped2), for: .touchUpInside)
                UserManager.shared.tap2()

            case 2:
                cell?.frame = CGRect(x: 2*screenwidth/3, y: 42, width: (screenwidth-16)/3, height: 65)
                cell?.btnText = "已成功"
                cell?.btnImage = "after.png"
                cell?.btn?.addTarget(self, action: #selector(tapped3), for: .touchUpInside)
                UserManager.shared.tap3()

            default: break
            }
        case 1:
            switch indexPath.item {
            case 0:
                cell?.frame = CGRect(x: 0, y: 157, width: screenwidth/4, height: 55)
                cell?.btnText = "收藏商品"
                cell?.btnImage = "personal_collect.png"
                cell?.btn?.addTarget(self, action: #selector(tapped4), for: .touchUpInside)
                UserManager.shared.tap4()
            case 1:
                cell?.frame = CGRect(x: screenwidth/4, y: 157, width: screenwidth/4, height: 55)
                cell?.btnText = "报名旅游信息"
                cell?.btnImage = "personal_info.png"
                cell?.btn?.addTarget(self, action: #selector(tapped5), for: .touchUpInside)
                UserManager.shared.tap5()

            case 2:
                cell?.frame = CGRect(x: 2*screenwidth/4, y: 157, width: screenwidth/4, height: 55)
                cell?.btnText = "我的旅伴"
                cell?.btnImage = "personal_friend.png"
                cell?.btn?.addTarget(self, action: #selector(tapped6), for: .touchUpInside)
                UserManager.shared.tap6()

            case 3:
                cell?.frame = CGRect(x: 3*screenwidth/4, y: 157, width: screenwidth/4, height: 55)
                cell?.btnText = "想去目的地"
                cell?.btnImage = "personal_destination.png"
                cell?.btn?.addTarget(self, action: #selector(tapped7), for: .touchUpInside)
                UserManager.shared.tap7()

            case 4:
                cell?.frame = CGRect(x: 0, y: 212, width: screenwidth/4, height: 55)
                cell?.btnText = "曾经去过"
                cell?.btnImage = "personal_demand.png"
                cell?.btn?.addTarget(self, action: #selector(tapped8), for: .touchUpInside)
                UserManager.shared.tap8()
                
            case 5:
                cell?.frame = CGRect(x: screenwidth/4, y: 212, width: screenwidth/4, height: 55)
                cell?.btnText = ""
                cell?.btnImage = ""

            case 6:
                cell?.frame = CGRect(x: 2*screenwidth/4, y: 212, width: screenwidth/4, height: 55)
                cell?.btnText = ""

            case 7:
                cell?.frame = CGRect(x: 3*screenwidth/4, y: 212, width: screenwidth/4, height: 55)
                cell?.btnText = ""
                
            default: break
            }
        default:break
        }
        return cell!
    }
    //ccccccccccccccccccccccc
    func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,alpha: 1.0)
    }
}

//ccccccccccccccccccccccccccccccc
fileprivate extension Selector {
    static let userDidGetUserInfo = #selector(PersonalViewController.userDidGetUserInfo(notification:))
    static let userDidGetUserInfoFailure = #selector(PersonalViewController.userDidGetUserInfoFailure(notification:))
}
