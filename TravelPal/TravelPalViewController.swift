//
//  TravelPalViewController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/3.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit
import Alamofire


class TravelPalViewController: UIViewController,AMapLocationManagerDelegate,MAMapViewDelegate,TPCalloutViewDelegate {
    var vcArray = Array<MainTableViewController>()
    var tableViewArray = Array<UITableView>()
    var tourismLvbanInfos:[[TourismLvbanInfo]]?
    var closeLvbanInfos:[[CloseLvbanInfo]]?
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
        self.view.addSubview(self.bottomScroll!)
        for i in 0..<headSegmentArray.count {
            let ma = stb.instantiateViewController(withIdentifier: "MainTableViewController") as! MainTableViewController
            ma.view.frame = CGRect.init(x: SCREEN_WIDTH*CGFloat(i), y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            ma.vview.backgroundColor = UIColor.clear
            ma.tableView.tableHeaderView = ma.vview
            self.bottomScroll?.addSubview(ma.tableView)
            self.vcArray.append(ma)
            self.tableViewArray.append(ma.tableView)
            
            for j in 0..<ma.tableView.visibleCells.count {
                
                (ma.tableView.visibleCells[j] as! DemoCell).delegate = self
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
        
        UserManager.shared.getTourism()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        mapView.addAnnotation(mm)
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
            
            if let reGeocode = reGeocode {
               // NSLog("🐥reGeocode:%@", reGeocode)
                
                
            }
        })
    }

    
    
    //MARK: - Set up UI
    func setupUI(){
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
    func requestJump() {
        
        let tpd = TravelPalDetailViewController()
        self.navigationController?.pushViewController(tpd, animated: true)
    }
}

fileprivate extension Selector{
//    static let getTourismInfo = #selector()
}

