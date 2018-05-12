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
    ///特殊标记，0为近程，1位远途
    var mark = 0
    
    var lvbaninfo:TourismLvbanInfo?
    
    var closeinfo:CloseLvbanInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if mark == 1 {
            print("😈"+(lvbaninfo?.destination)!)
        }
        
        self.view.backgroundColor = UIColor.white
        self.tableView.delegate = self
        self.tableView.dataSource = self

        let imgview = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT*2))
        imgview.image = UIImage.init(named: "background")
        self.tableView.backgroundView = imgview
        setToolbar()
        createRightBtn()
        registernib()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        //self.navigationController?.navigationBar.backgroundColor = UIColor.init(red: 30/255.0, green: 168/255.0, blue: 134/255.0, alpha: 0)
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 30/255.0, green: 168/255.0, blue: 134/255.0, alpha: 1)
    }

    //MARK: TableView Delegate
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if mark == 1 {
            return 3
        }
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
            cell = tableView.dequeueReusableCell(withIdentifier: "travel", for: indexPath) as! TPTravelInfoCell
            if mark == 1{
                (cell as! TPTravelInfoCell).deptTimeLabel.text = self.lvbaninfo?.departureTime
                (cell as! TPTravelInfoCell).destnationLabel.text = lvbaninfo?.destination
                (cell as! TPTravelInfoCell).transportationLabel.text = lvbaninfo?.transportation
                (cell as! TPTravelInfoCell).planpeopleLabel.text = "\((lvbaninfo?.planPeople)!)人"
            }else{
                (cell as! TPTravelInfoCell).deptTimeLabel.text = self.closeinfo?.departureTime
                (cell as! TPTravelInfoCell).destnationLabel.text = closeinfo?.destination
                (cell as! TPTravelInfoCell).transportationLabel.text = "自行前往"
                if let l = (cell as? TPTravelInfoCell)?.planpeopleLabel {
                    l.text = "\((closeinfo?.planPeople) ?? "_" )人"
                }
            }
            
        }else if indexPath.section == 2{
            cell = tableView.dequeueReusableCell(withIdentifier: "detail", for: indexPath) as! TPDetailInfoCell
            if mark == 1 {
                (cell as! TPDetailInfoCell).detailLabel.text = lvbaninfo?.detailed
            }else{
                (cell as! TPDetailInfoCell).detailLabel.text = closeinfo?.detailed
            }
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "geo", for: indexPath) as! TPGeoInfoCell
            if mark == 1 {
                (cell as! TPGeoInfoCell).targetLocation = CLLocationCoordinate2D.init(latitude: CLLocationDegrees.init((lvbaninfo?.latitude)!)!, longitude: CLLocationDegrees.init((lvbaninfo?.longitude)!)!)
            }
        }
        cell.selectionStyle = .none
//        cell.isUserInteractionEnabled = false
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
        
        ctBtn?.addTarget(self, action: #selector(TravelPalDetailViewController.contactDidTapped), for: .touchUpInside)
        coBtn?.addTarget(self, action: #selector(addToCollection), for: .touchUpInside)
        
 
    }
    
    func addToCollection() {

    }
    
    func contactDidTapped(){
        let a = RCConversationViewController.init(conversationType: .ConversationType_PRIVATE, targetId: "13605361772")
        
        self.navigationController?.pushViewController(a!, animated: true)
    }
    
    func createRightBtn(){
        self.navigationItem.title = "旅伴详情"
        let btn = UIBarButtonItem.init(image: UIImage.init(named: "分享"), style: .plain, target: self, action: #selector(TravelPalDetailViewController.ds))
        btn.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = btn
        
        
        
    }
    
    func sheetFast(itemSize: CGSize, hasClose: Bool, items array: Array<String>, prefixName: String) -> TPFabuView {
        var items: [BannerItem] = []
        for (_, name) in array.enumerated() {
            let item = BannerItem()
            item.title = name
            if let img = UIImage(named: prefixName.appending(name)) { item.image = img }
            items.append(item)
        }
        let sheet = TPFabuView()
        sheet.width = UIScreen.width
        sheet.items = items
        sheet.close.isHidden = hasClose
        sheet.bannerTouchClosure = {(anyObj: Any, index: Int) -> Void in
            let sheetView = anyObj as! TPFabuView
            print(index)
            //index是选择的哪一个按钮
            if let text = sheetView.bannerViews[index].label.text { print(text) }
            
        }
        return sheet
    }
    
    func ds(){
        let array = [
            "微信好友", "朋友圈", "新浪微博", "QQ好友"
        ]
        let size = CGSize(width: 80, height: 100)
        let sheetView = sheetFast(itemSize: size, hasClose: true, items: array, prefixName: "")
        sheetView.height += 45;
        
        overlayController = OverlayController(aView: sheetView, overlayStyle: .BlackTranslucent)
        overlayController.presentationStyle = .Bottom
        overlayController.isAllowDrag = true
        overlayController.isUsingElastic = true
        overlayController.delegate = self;
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
