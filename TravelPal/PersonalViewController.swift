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
    
 
    var pushingTitle = ""
    
    var collectionview : UICollectionView!
    var headView : HeadView!
    var opensetting = false
    let notification = NotificationCenter.default
    
    func allOrder(){
        if UserManager.shared.isLogIn{
            self.pushingTitle = "全部订单"
            orderButtonTapped()
        }else{
            self.noticeError("您还未登录")
        }
    }
    func unPaidOrder(){
        if UserManager.shared.isLogIn{
            self.pushingTitle = "待付款"
             
            orderButtonTapped()
        }else{
            self.noticeError("您还未登录")
        }
        
    }
    func successfulOrders(){
        if UserManager.shared.isLogIn{
            self.pushingTitle = "已成功"
            orderButtonTapped()
        }else{
            self.noticeError("您还未登录")
        }
    }
    func collected(){
        //得到全部收藏，传给下一页
  
        if UserManager.shared.isLogIn{
            self.pushingTitle = "收藏商品"
            toolsButtonTapped()
        }else{
            self.noticeError("您还未登录")
        }
    }
    func enlist(){
        //得到全部报名，传给下一页
        if UserManager.shared.isLogIn {
            self.pushingTitle = "报名旅游信息"
            toolsButtonTapped()
        }else{
            self.noticeError("您还未登录")
        }
    }
    func myPal(){
        if UserManager.shared.isLogIn{
            self.pushingTitle = "我的旅伴"
            toolsButtonTapped()
        }else{
            self.noticeError("您还未登录")
        }
    }
    func wannaGo(){
        if UserManager.shared.isLogIn{
            self.pushingTitle = "想去目的地"
            toolsButtonTapped()
        }else{
            self.noticeError("您还未登录")
        }
    }
    func everGone(){
        
        
        if UserManager.shared.isLogIn{
            self.pushingTitle = "曾经去过"
            toolsButtonTapped()
        }else{
            self.noticeError("您还未登录")
        }
    }
    //MARK: - sign in
    func tappedlogin(){
        if UserManager.shared.isLogIn {
            settings()
        } else {
            let signIn = SignViewController()
            pushWithoutTab(signIn)
        }
        
    }
    
    //设置按钮
    func settings(){
    
        if UserManager.shared.isLogIn {
            opensetting = true
            UserManager.shared.getUserInfo()
        }else{
            self.noticeError("您还未登录")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        opensetting = false
    }
    
    
    deinit {
        notification.removeObserver(self)
    }
    
    
    func userDidGetUserInfo(notification: NSNotification) {
 
        self.settingsButtonTapped()
        
    }
    
    func userDidGetUserInfoFailure(notification: NSNotification) {
 
    }
    
    func settingsButtonTapped() {
        if opensetting {
            let personInfo = PersonalInfoViewController()
            self.pushWithoutTab(personInfo, animated: true)
        }
        headView.fillContents(nil)
        
    }
    
    //订单
    func orderButtonTapped() {
        let secondViewController = DetailDingDanViewController()
        secondViewController.navigationTitle = self.pushingTitle
        self.pushWithoutTab(secondViewController, animated: true)

    }
    
    //细节
    func toolsButtonTapped() {
        let secondViewController = DetailViewController()
        secondViewController.titleString = self.pushingTitle
        self.pushWithoutTab(secondViewController)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // self.navigationController?.navigationBar.setTitleVerticalPositionAdjustment(0, for: UIBarMetrics.default)
        navigationController?.navigationBar.barTintColor = UIColor(patternImage: UIImage(named: "personal_bg.jpg")!)
        
        navigationController?.navigationBar.tintColor = UIColor.white
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "设置", style: UIBarButtonItemStyle.plain, target: self, action: #selector(PersonalViewController.settings))
       
        headView = HeadView(frame: CGRect(x: 0, y: -170, width: SCREEN_WIDTH, height: 170))
        
        headView.textButton .addTarget(self, action: #selector(tappedlogin), for: .touchUpInside)
        headView.fillContents(nil)
  
        let layout = UICollectionViewFlowLayout()
        collectionview = UICollectionView(frame:CGRect(x: 0, y: 0, width:SCREEN_WIDTH, height:SCREEN_HEIGHT), collectionViewLayout: layout)
 
        collectionview.register(DingDanCell.self, forCellWithReuseIdentifier:"cell")
 
        collectionview.register(UICollectionReusableView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "DingDanheaderView")
        collectionview.register(UICollectionReusableView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "GongJuheaderView")
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.isScrollEnabled = true
        collectionview.backgroundColor = kRGBColorFromHex(rgbValue: 0xf2f2f2)
        collectionview.alwaysBounceVertical = true
        collectionview.addSubview(headView)
        collectionview.contentInset = UIEdgeInsets(top: 170, left: 0, bottom: 0, right: 0)
        self.view.addSubview(collectionview)
        UserManager.addObserver(observer: self, selector: #selector(someoneLogin), notification: .didLogin)
        UserManager.addObserver(observer: self, selector: #selector(userDidGetUserInfo(notification:)), notification: .didGetUserInfo)
        UserManager.addObserver(observer: self, selector: #selector(userDidGetUserInfoFailure(notification:)), notification: .didGetUserInfoFailure)
        UserManager.addObserver(observer: self, selector: #selector(settingsButtonTapped), notification: .didSignup)
        UserManager.addObserver(observer: self, selector: #selector(settingsButtonTapped), notification: .didLogout)
    }
  
    @objc func someoneLogin () {
        UserManager.shared.getUserInfo()
    }
    
    func netWorkFailed() {
        noticeError("请求失败")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y < -234) {
            scrollView.contentOffset.y = -234
        }
        
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
            return CGSize(width: (SCREEN_WIDTH-16)/3, height: 65)
        }
        else{
            return CGSize(width: (SCREEN_WIDTH-16)/4, height: 55)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        // 设置sectionHeader的size
        return CGSize(width: SCREEN_WIDTH, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        //设置sectionHeader
        if(indexPath.section==0){
            let headerView=collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "DingDanheaderView", for: indexPath as IndexPath)
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 40))
            label.text=" 我的订单"
            label.textColor = kRGBColorFromHex(rgbValue: 0x323232)
            label.font = UIFont.systemFont(ofSize: 14)
            headerView.addSubview(label)
            headerView.backgroundColor = UIColor.white
            return headerView
        }
        else{
            let headerView=collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "GongJuheaderView", for: indexPath as IndexPath)
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 40))
            label.text=" 常用工具"
            label.textColor = kRGBColorFromHex(rgbValue: 0x323232)
            label.font = UIFont.systemFont(ofSize: 14)
            headerView.addSubview(label)
            headerView.backgroundColor = UIColor.white
            return headerView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DingDanCell
        
        switch indexPath.section{
        case 0:
            switch indexPath.item {
            case 0:
                cell?.frame = CGRect(x: 0, y: 42, width: (SCREEN_WIDTH-16)/3, height: 65)
                cell?.btnText = "全部订单"
                cell?.btnImage = "use.png"
                UserManager.addObserver(observer: self, selector: #selector(allOrder), notification: UserManager.Notification.didGetAllOrder)
                UserManager.addObserver(observer: self, selector: #selector(netWorkFailed), notification: UserManager.Notification.didGetAllOrderFailure)
            case 1:
                cell?.frame = CGRect(x: SCREEN_WIDTH/3, y: 42, width: (SCREEN_WIDTH-16)/3, height: 65)
                cell?.btnText = "待付款"
                cell?.btnImage = "pay.png"
                UserManager.addObserver(observer: self, selector: #selector(unPaidOrder), notification: UserManager.Notification.didGetUnpaidOrder)
                UserManager.addObserver(observer: self, selector: #selector(netWorkFailed), notification: UserManager.Notification.didGetUnpaidOrderFailure)

            case 2:
                cell?.frame = CGRect(x: 2*SCREEN_WIDTH/3, y: 42, width: (SCREEN_WIDTH-16)/3, height: 65)
                cell?.btnText = "已成功"
                cell?.btnImage = "after.png"
                UserManager.addObserver(observer: self, selector: #selector(successfulOrders), notification: UserManager.Notification.didGetSuccessOrder)
                UserManager.addObserver(observer: self, selector: #selector(netWorkFailed), notification: UserManager.Notification.didGetSuccessOrderFailure)
                
            default: break
            }
        case 1:
            switch indexPath.item {
            case 0:
                cell?.frame = CGRect(x: 0, y: 157, width: SCREEN_WIDTH/4, height: 55)
                cell?.btnText = "收藏商品"
                cell?.btnImage = "personal_collect.png"
                UserManager.addObserver(observer: self, selector: #selector(collected), notification: UserManager.Notification.didGetCollected)
                UserManager.addObserver(observer: self, selector: #selector(netWorkFailed), notification: UserManager.Notification.didGetCollectedFailure)
            case 1:
                cell?.frame = CGRect(x: SCREEN_WIDTH/4, y: 157, width: SCREEN_WIDTH/4, height: 55)
                cell?.btnText = "报名旅游信息"
                cell?.btnImage = "personal_info.png"
                UserManager.addObserver(observer: self, selector: #selector(enlist), notification: UserManager.Notification.didGetEnlistInfo)
                UserManager.addObserver(observer: self, selector: #selector(netWorkFailed), notification: UserManager.Notification.didGetEnlistInfoFailure)

            case 2:
                cell?.frame = CGRect(x: 2*SCREEN_WIDTH/4, y: 157, width: SCREEN_WIDTH/4, height: 55)
                cell?.btnText = "我的旅伴"
                cell?.btnImage = "personal_friend.png"
                UserManager.addObserver(observer: self, selector: #selector(myPal), notification: UserManager.Notification.didGetMyPal)
                UserManager.addObserver(observer: self, selector: #selector(netWorkFailed), notification: UserManager.Notification.didGetMyPalFailure)

            case 3:
                cell?.frame = CGRect(x: 3*SCREEN_WIDTH/4, y: 157, width: SCREEN_WIDTH/4, height: 55)
                cell?.btnText = "想去目的地"
                cell?.btnImage = "personal_destination.png"
                UserManager.addObserver(observer: self, selector: #selector(wannaGo), notification: UserManager.Notification.didGetWantGo)
                UserManager.addObserver(observer: self, selector: #selector(netWorkFailed), notification: UserManager.Notification.didGetWantGoFailure)

            case 4:
                cell?.frame = CGRect(x: 0, y: 212, width: SCREEN_WIDTH/4, height: 55)
                cell?.btnText = "曾经去过"
                cell?.btnImage = "personal_demand.png"
                UserManager.addObserver(observer: self, selector: #selector(everGone), notification: UserManager.Notification.didGetEverGone)
                UserManager.addObserver(observer: self, selector: #selector(netWorkFailed), notification: UserManager.Notification.didGetEverGoneFailure)
                
            case 5:
                cell?.frame = CGRect(x: SCREEN_WIDTH/4, y: 212, width: SCREEN_WIDTH/4, height: 55)
                cell?.btnText = ""
                cell?.btnImage = ""

            case 6:
                cell?.frame = CGRect(x: 2*SCREEN_WIDTH/4, y: 212, width: SCREEN_WIDTH/4, height: 55)
                cell?.btnText = ""

            case 7:
                cell?.frame = CGRect(x: 3*SCREEN_WIDTH/4, y: 212, width: SCREEN_WIDTH/4, height: 55)
                cell?.btnText = ""
                
            default: break
            }
        default:break
        }
        return cell!
    }
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.item {
            case 0:
                
                UserManager.shared.allOrder()
                
            case 1:
                UserManager.shared.unPaidOrder()
                
            case 2:
             
                UserManager.shared.successOrder()
                
            default: break
            }
        case 1:
            switch indexPath.item {
            case 0:
                UserManager.shared.getTrips()
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1) {
                    self.collected()
                }
                
            case 1:
          
                UserManager.shared.enlist()
                
            case 2:
           
                UserManager.shared.myPal()
                
            case 3:
       
                UserManager.shared.wannaGo()
                
            case 4:
           
                UserManager.shared.everGone()
                
      
            default: break
          
            }
            
        default: break
        }
    }
 
}

