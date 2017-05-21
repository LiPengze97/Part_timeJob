//
//  TravelPalDetailViewController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/4/24.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit


class TravelPalDetailViewController: UITableViewController,UIGestureRecognizerDelegate,OverlayControllerDelegate {//记得加datasoure
    let factor:CGFloat = 48
    var ctBtn:UIButton?
    var coBtn:UIButton?
    var frBtn:UIButton?
    var overlayController:OverlayController!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.tableView.delegate = self
        self.tableView.dataSource = self

        let imgview = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT*2))
        imgview.image = UIImage.init(named: "background")
        self.tableView.backgroundView = imgview
        setToolbar()
        createRightBtn()
        registernib()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        //self.navigationController?.navigationBar.backgroundColor = UIColor.init(red: 30/255.0, green: 168/255.0, blue: 134/255.0, alpha: 0)
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 30/255.0, green: 168/255.0, blue: 134/255.0, alpha: 1)
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableView Delegate
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell
        if indexPath.section == 0{
            cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath) as! TPPersonInfoCell
            
        }else if indexPath.section == 1{
            cell = tableView.dequeueReusableCell(withIdentifier: "travel", for: indexPath) as! TPTravelInfoCell        }else if indexPath.section == 2{
            cell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as! TPDetailInfoCell
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "geo", for: indexPath) as! TPGeoInfoCell        }
        cell.isUserInteractionEnabled = false
        return cell
   }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 90
        }else if indexPath.section == 1{
            return 124
        }else if indexPath.section == 2{
            return 178
        }else{
            return 200
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    func setToolbar(){
//        self.navigationController?.setToolbarHidden(false, animated: true)
//        self.navigationController?.toolbar.barStyle = .default
        ctBtn = UIButton.init(frame: CGRect.init(x: SCREEN_WIDTH * 256.0/483, y: SCREEN_HEIGHT-factor, width: SCREEN_WIDTH * 227.0/483, height: 48))
        
        coBtn = UIButton.init(frame: CGRect.init(x: SCREEN_WIDTH * 128.0/483, y: SCREEN_HEIGHT-factor, width: SCREEN_WIDTH * 128.0/483, height: 48))
        
        frBtn = UIButton.init(frame: CGRect.init(x: 0, y: SCREEN_HEIGHT-96, width: SCREEN_WIDTH * 128.0/483, height: 48))
        ctBtn?.setImage(UIImage.init(named: "contactBtn"), for: .normal)
        coBtn?.setImage(UIImage.init(named: "collectBtn"), for: .normal)
        frBtn?.setImage(UIImage.init(named: "friendsBtn"), for: .normal)
        self.view.addSubview(ctBtn!)
        self.view.addSubview(coBtn!)
        self.view.addSubview(frBtn!)
        self.tableView.bringSubview(toFront: ctBtn!)
        self.tableView.bringSubview(toFront: coBtn!)
        self.tableView.bringSubview(toFront: frBtn!)
        
//        let ss = UIView.init(frame: CGRect.init(x: 10, y: 10, width: SCREEN_HEIGHT - 20, height: 48))
//        ss.addSubview(ctBtn)
//        ss.addSubview(coBtn)
//        ss.addSubview(frBtn)
//        self.tableView.tableFooterView = ss
//        let contactBtn = UIBarButtonItem.init(image: #imageLiteral(resourceName: "contactBtn"), style: .done, target: self, action: nil)//联系
//        let collectBtn = UIBarButtonItem.init(image: #imageLiteral(resourceName: "collectBtn"), style: .done, target: self, action: nil) //收藏
//        let friendsBtn = UIBarButtonItem.init(image: #imageLiteral(resourceName: "friendsBtn"), style: .done, target: self, action: nil)//加好友
//        contactBtn.title = "联系Ta"
//        contactBtn.tintColor = UIColor.init(red: 30/255.0, green: 168/255.0, blue: 134/255.0, alpha: 1)
        
//        collectBtn.title = "收藏"
//        collectBtn.tintColor = UIColor.init(red: 30/255.0, green: 168/255.0, blue: 134/255.0, alpha: 0.8)
        
//        friendsBtn.title = "加好友"
//        friendsBtn.tintColor = UIColor.init(red: 30/255.0, green: 168/255.0, blue: 134/255.0, alpha: 0.6)
        
//        let flexibleSpace = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
//        let btnarr:[UIBarButtonItem] = [friendsBtn,collectBtn,contactBtn]
//        self.toolbarItems = btnarr
        
    }
    
    func createRightBtn(){
        self.navigationItem.title = "旅伴详情"
        let btn = UIBarButtonItem.init(image: UIImage.init(named: "分享"), style: .plain, target: self, action: #selector(TravelPalDetailViewController.ds))
        btn.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = btn
        let array = [
            "微信好友", "朋友圈", "新浪微博", "QQ好友", "跳转"
        ]
        let view = UIView.init(frame: .init(x: 0, y: 0, width: SCREEN_WIDTH, height: 300))
        view.backgroundColor = UIColor.orange
        self.overlayController = OverlayController.init(aView: view, overlayStyle: .BlackTranslucent)
        overlayController.presentationStyle = .Bottom
        overlayController.isAllowDrag = true
        overlayController.isUsingElastic = true
        overlayController.delegate = self;
        
    }
    
    
    func ds(){
        overlayController.present(animated: true)
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        ctBtn?.frame = CGRect.init(x: SCREEN_WIDTH * 256.0/483, y: SCREEN_HEIGHT-factor+self.tableView.contentOffset.y, width: SCREEN_WIDTH * 227.0/483, height: 48)
    
        coBtn?.frame = CGRect.init(x: SCREEN_WIDTH * 128.0/483, y: SCREEN_HEIGHT-factor+self.tableView.contentOffset.y, width: SCREEN_WIDTH * 128.0/483, height: 48)
        
        frBtn?.frame = CGRect.init(x: 0, y: SCREEN_HEIGHT-factor+self.tableView.contentOffset.y, width: SCREEN_WIDTH * 128.0/483, height: 48)
        
        self.tableView.bringSubview(toFront: ctBtn!)
        self.tableView.bringSubview(toFront: coBtn!)
        self.tableView.bringSubview(toFront: frBtn!)
    }
    
    func registernib(){
        let personnib = UINib.init(nibName: "TPPersonInfoCell", bundle: nil)
        self.tableView.register(personnib, forCellReuseIdentifier: "person")
        
        let travelnib = UINib.init(nibName: "TPTravelInfoCell", bundle: nil)
        self.tableView.register(travelnib, forCellReuseIdentifier: "travel")
        
        let detailnib = UINib.init(nibName: "TPDetailInfoCell", bundle: nil)
        self.tableView.register(detailnib, forCellReuseIdentifier: "detail")
        
        let geonib = UINib.init(nibName: "TPGeoInfoCell", bundle: nil)
        self.tableView.register(geonib, forCellReuseIdentifier: "geo")
    }
    
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if(scrollView.contentOffset.y<=se)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
