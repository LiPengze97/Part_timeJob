//
//  TPGeoInfoCell.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/14.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class TPGeoInfoCell: UITableViewCell,AMapLocationManagerDelegate,MAMapViewDelegate {

    var userLocation:CLLocationCoordinate2D? = nil
    var targetLocation:CLLocationCoordinate2D? = nil{
        didSet{
            AddAnno()
        }
    }
    var mapview:MAMapView?
    override func awakeFromNib() {
        super.awakeFromNib()
        mapview = MAMapView.init(frame: self.bounds)
        mapview!.delegate = self
        mapview!.setZoomLevel(14, animated: true)
        self.addSubview(mapview!)
        
        mapview!.isShowsUserLocation = true
        mapview!.userTrackingMode = .follow
        
        
                // Initialization code
    }
    
    func AddAnno(){
        if let location = targetLocation{
            let anno = MAPointAnnotation.init()
            anno.coordinate = location
            anno.title = "Ta在这里！"
            mapview!.addAnnotation(anno)
        }

    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
