//
//  TravelPalViewController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/3.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


class TravelPalViewController: UIViewController,AMapLocationManagerDelegate,MAMapViewDelegate,TPCalloutViewDelegate {
    var vcArray = Array<MainTableViewController>()
    var tableViewArray = Array<UITableView>()
    //0-远途旅伴 1-近程游玩 2-拼车 3-饮食 4-电影 5-购物
    var tourismLvbanInfos = Array<TourismLvbanInfo>()
    var closeLvbanInfos:[[CloseLvbanInfo]] = []
    var currentTabelView = UITableView()
    var locationManager:AMapLocationManager?
    var stb = UIStoryboard.init(name: "Main", bundle: nil)
    //用户位置信息
    var userLocation:CLLocation?
    var userReGeocode: AMapLocationReGeocode?
    var lastTableViewOffsetY = CGFloat()
    
    let mapView:MAMapView = MAMapView(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 64))
    
    var headSegmentView: HeadSegmentView?
    
    var bottomScroll: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//        self.nv = UINavigationController.init(rootViewController: self)
        setLocation()
        self.automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.white
        self.view.addSubview(self.bottomScroll!)
        for i in 0..<headSegmentArray.count {
            let ma = stb.instantiateViewController(withIdentifier: "MainTableViewController") as! MainTableViewController
            if i==0{
                ma.mark = 1
            }
            ma.tableid = i
            ma.view.frame = CGRect.init(x: SCREEN_WIDTH*CGFloat(i), y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            ma.vview.backgroundColor = UIColor.clear
            ma.tableView.tableHeaderView = ma.vview
            self.bottomScroll?.addSubview(ma.tableView)
            self.vcArray.append(ma)
            self.tableViewArray.append(ma.tableView)
            
            for j in 0..<ma.tableView.visibleCells.count {
                
                (ma.tableView.visibleCells[j] as! DemoCell).delegate = self
                (ma.tableView.visibleCells[j] as! DemoCell).tableid = i
            }
            
            ma.tableView.addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.new, context: nil)
        }
        self.view.addSubview(mapView)
        self.view.addSubview(headSegmentView!)
        self.headSegmentView?.sendData(titles: headSegmentArray)
        self.mapView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 200);
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
        
        getTourism()
        getClose()
        
    }
    
    func getTourism(){
        Alamofire.request(Router.getTourism).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let value = response.result.value else{
                    log("response.result.value is nil", .error)
                    return
                }
                let json = JSON(value)
                print(" ",json)
                
                self.tourismLvbanInfos = []
                
                for (_, subJson):(String, JSON) in json["data"] {
          
                    let a = TourismLvbanInfo.init(json: subJson)
 
                    self.tourismLvbanInfos.append(a)
                }
                
                //DispatchQueue.global().async {
                 //   DispatchQueue.main.async {
                        self.vcArray[0].tourismLvbanInfos = self.tourismLvbanInfos
                        self.vcArray[0].tableView.reloadData()
                        let ma = self.vcArray[0]
                        for j in 0..<ma.tableView.visibleCells.count {
                            (ma.tableView.visibleCells[j] as! DemoCell).delegate = self
                        }
                 //   }
                //}
                
                
                guard let status = json["status"].int else { return }
                
                guard status == 200 else {
//                    log(json, .error)
                    return
                }
                return
            case .failure(let error):
                log(error, .error)
                return
            }
        }
    }

    func getClose(){
        Alamofire.request(Router.getClose).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let value = response.result.value else{
                    log("response.result.value is nil", .error)
                    return
                }
                let json = JSON(value)
                print("📺",json)
                 
                self.closeLvbanInfos = []
                for _ in 0..<5{
                    let a:[CloseLvbanInfo] = []
                    self.closeLvbanInfos.append(a)
                }
                
                for (_, subJson):(String, JSON) in json["data"] {
          
                    let a = CloseLvbanInfo.init(json: subJson)
                    let indexa = Int(a.type!)
                    self.closeLvbanInfos[indexa!-1].append(a)
    
                }
                
                //DispatchQueue.global().async {
                 //   DispatchQueue.main.async {
                        for i in 1..<self.vcArray.count{
                            self.vcArray[i].closeLvbanInfos = self.closeLvbanInfos[i-1]
                            self.vcArray[i].tableView.reloadData()
                            let ma = self.vcArray[i]
                            for j in 0..<ma.tableView.visibleCells.count {
                                (ma.tableView.visibleCells[j] as! DemoCell).delegate = self
                            }
                        }
                 //   }
                //}
               
            case .failure(let error):
                log(error, .error)
                return
            }
            
        }
    }
 
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let tableView = object as! UITableView
        
        if !(keyPath == "contentOffset") {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }
        
        let tableViewoffsetY = tableView.contentOffset.y
        
        self.lastTableViewOffsetY = tableViewoffsetY
        
        if ( tableViewoffsetY >= 0 && tableViewoffsetY <= 136) {
            self.headSegmentView?.frame = CGRect.init(x: 0, y: 200-tableViewoffsetY, width: SCREEN_WIDTH, height: 40)
            self.mapView.frame = CGRect.init(x: 0, y: 0-tableViewoffsetY, width: SCREEN_WIDTH, height: 200)
            
        }else if( tableViewoffsetY < 0){
            self.headSegmentView?.frame = CGRect.init(x: 0, y: 200, width: SCREEN_WIDTH, height:40);
            self.mapView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 200);
            
        }else if (tableViewoffsetY > 136){
            self.headSegmentView?.frame = CGRect.init(x: 0, y: 64, width: SCREEN_WIDTH, height:40);
            self.mapView.frame = CGRect.init(x: 0, y: -136, width: SCREEN_WIDTH, height: 200);
        }

    }

    //MARK: -MapDelegate
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        if annotation.isKind(of: MAPointAnnotation.self){
        let reuseIdentifier = "annotationReuseIndetifier"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? TPAnnotationView
        
        if annotationView == nil {
            annotationView  = TPAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            annotationView?.calloutView.delegate = self
        }
        
        annotationView?.image = UIImage.init(named: "location")
        annotationView?.centerOffset = CGPoint(x: 0, y: -18)
        
        return annotationView
        }
        
        return nil
    }
    
    //点击气泡
    func mapView(_ mapView: MAMapView!, didAnnotationViewCalloutTapped view: MAAnnotationView!) {
        
       
    }
    
    func navibtnDidTapped() {
        let tt = TravelPalDetailViewController()
        
        self.navigationController?.pushViewController(tt, animated: true)
    }
    
    //设置小蓝点
    func setUserLocationRepresentation(){
        
    }
    
    //添加标注
    func addAnnotation(){
        let mm = MAPointAnnotation.init()
        mm.coordinate = (userLocation?.coordinate)!
        //print("🤞",userLocation?.coordinate)
        mm.title = "ssss"
        mm.subtitle = "wwww"
        //36.6354400000,117.2697700000商职
        let lons = [117.15017,117.13017,117.13517,117.14700,117.26897,117.26947,117.27077,117.26900,117.26877]
        let lats = [36.66494,36.67694,36.66894,36.66594,36.63544,36.63644,36.63444,36.63244,36.63500]
        var annos:[MAPointAnnotation] = []
        for i in 0..<lons.count{
            let m = MAPointAnnotation.init()
            //当前经纬度：36.66694,117.14017
            m.coordinate = CLLocationCoordinate2D.init(latitude: lats[i], longitude: lons[i])
            annos.append(m)
        }
        annos.append(mm)
        mapView.addAnnotations(annos)
    }
    //MARK:初始化页面需要的方法
    func setLocation(){
        AMapServices.shared().enableHTTPS = true
        let r = MAUserLocationRepresentation.init()
        r.showsAccuracyRing = false
        r.showsHeadingIndicator = true
        
        
        self.mapView.update(r)
//        mapView.isShowsUserLocation = true
        mapView.delegate = self
        mapView.userTrackingMode = .follow
        mapView.setZoomLevel(14, animated: true)
        
        locationManager = AMapLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager?.locationTimeout = 2
        locationManager?.reGeocodeTimeout = 2
        locationManager?.requestLocation(withReGeocode: true, completionBlock: {[weak self] (location: CLLocation?, reGeocode: AMapLocationReGeocode?, error: Error?) in
            if let error = error {
                let error = error as NSError
                
                if error.code == AMapLocationErrorCode.locateFailed.rawValue {
                    //定位错误：此时location和regeocode没有返回值，不进行annotation的添加
                    NSLog("定位错误:{\(error.code) - \(error.localizedDescription)};")
                    return
                }
                else if error.code == AMapLocationErrorCode.reGeocodeFailed.rawValue
                    || error.code == AMapLocationErrorCode.timeOut.rawValue
                    || error.code == AMapLocationErrorCode.cannotFindHost.rawValue
                    || error.code == AMapLocationErrorCode.badURL.rawValue
                    || error.code == AMapLocationErrorCode.notConnectedToInternet.rawValue
                    || error.code == AMapLocationErrorCode.cannotConnectToHost.rawValue {
                    
                    //逆地理错误：在带逆地理的单次定位中，逆地理过程可能发生错误，此时location有返回值，regeocode无返回值，进行annotation的添加
                    NSLog("逆地理错误:{\(error.code) - \(error.localizedDescription)};")
                }
                else {
                    //没有错误：location有返回值，regeocode是否有返回值取决于是否进行逆地理操作，进行annotation的添加
                    self?.mapView.setCenter((location?.coordinate)!, animated: true)
                    
                    
                }
            }
            
            if let location = location {
                //NSLog("🐶location:%@", location)
                //print("🐶",location.coordinate)
                self?.userLocation = location
                self?.addAnnotation()
            }
            
            if reGeocode != nil {
               // NSLog("🐥reGeocode:%@", reGeocode)
                
                
            }
        })
    }

    
    
    //MARK: - Set up UI
    func setupUI(){
        
        for _ in 0..<5{
            let a:[CloseLvbanInfo] = []
            self.closeLvbanInfos.append(a)
        }
        
        self.headSegmentView = HeadSegmentView.init(frame: CGRect.init(x: 0, y: 200, width: SCREEN_WIDTH, height: 40))
        self.headSegmentView?.delegate = self
        
        self.bottomScroll = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        bottomScroll?.showsHorizontalScrollIndicator = false
        bottomScroll?.isPagingEnabled = true
        bottomScroll?.delegate = self
        bottomScroll?.contentSize = CGSize.init(width: CGFloat(headSegmentArray.count)*SCREEN_WIDTH, height: SCREEN_HEIGHT)

    }
    
    func userDidGetTourism(notification: NSNotification){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(0), execute: {
//            self.closeButtonTapped()
        })
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    
}


extension TravelPalViewController: HeadSegmentViewDelegate {
    func clickSegement(index: NSInteger) {
        self.currentTabelView = self.tableViewArray[0]
        for table:UITableView in self.tableViewArray{
            if(self.lastTableViewOffsetY >= 0 && self.lastTableViewOffsetY<=136){
                table.contentOffset = CGPoint.init(x: 0, y: self.lastTableViewOffsetY)
            }else if(self.lastTableViewOffsetY < 0){
                table.contentOffset = CGPoint.init(x: 0, y: 0)
            }else if(self.lastTableViewOffsetY>136){
                table.contentOffset = CGPoint.init(x: 0, y: 136)
            }
        }
        UIView.animate(withDuration: 0.3) { 
            self.bottomScroll?.contentOffset = CGPoint.init(x: SCREEN_WIDTH*CGFloat(index), y: 0)
        }
    }
    
    
}

extension MainTableViewController{

}

extension TravelPalViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.headSegmentView?.getIndex(index: Int(scrollView.contentOffset.x / SCREEN_WIDTH))
        
        self.currentTabelView = self.tableViewArray[Int(scrollView.contentOffset.x / SCREEN_WIDTH)]
        
        for table: UITableView in self.tableViewArray {
            if ( self.lastTableViewOffsetY>=0 &&  self.lastTableViewOffsetY<=136) {
                table.contentOffset = CGPoint.init(x: 0, y: self.lastTableViewOffsetY)
                
            }else if(  self.lastTableViewOffsetY < 0){
                table.contentOffset = CGPoint.init(x: 0, y: 0)
                
            }else if ( self.lastTableViewOffsetY > 136){
                table.contentOffset = CGPoint.init(x: 0, y: 136)
            }
            
        }

    }
}

extension TravelPalViewController: RequestJumpDelegate{

    func requestJump(index: Int) {
        
        let tpd = TravelPalDetailViewController()
        
        if index == 0{
            tpd.lvbaninfo = self.tourismLvbanInfos[self.vcArray[0].selectnum]
            tpd.mark = 1
        }else{
            tpd.closeinfo = self.closeLvbanInfos[index-1][self.vcArray[index].selectnum]
            tpd.mark = 0
        }
        
        self.navigationController?.pushViewController(tpd, animated: true)

    }
}

fileprivate extension Selector{

}

