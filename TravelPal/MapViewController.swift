//
//  MapViewController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/4/24.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit
//当前经纬度：36.6669400000,117.1401700000
class MapViewController: UIViewController,MAMapViewDelegate,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = "附近旅伴"
        setupMap()
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupMap(){
        //创建地图
        let mapview = MAMapView(frame: self.view.bounds)
        mapview.delegate = self
        self.view.addSubview(mapview)
        //显示用户位置
        mapview.isShowsUserLocation = true
        mapview.userTrackingMode = .follow
        //配置显示当前位置的小蓝点
        mapview.userLocation.title = "Bohemian"
        mapview.userLocation.subtitle = "Rey"
        
        //后台更新坐标
        mapview.pausesLocationUpdatesAutomatically = false
        mapview.allowsBackgroundLocationUpdates = true
        
        AMapServices.shared().enableHTTPS = true
        
        //大头针测试
        let mapa = MAPointAnnotation()
        mapa.coordinate = CLLocationCoordinate2DMake(36.66694, 117.14017)
        mapa.title = "山东大学软件学院"
        mapa.subtitle = "Here we are"
        
        mapview.addAnnotation(mapa)
    }
    
    //MARK:Tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
 
}
