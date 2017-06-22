//
//  TPGeoInfoCell.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/14.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class TPGeoInfoCell: UITableViewCell,AMapLocationManagerDelegate,MAMapViewDelegate {

    let userLocation:CLLocationCoordinate2D? = nil
    let targetLocation:CLLocationCoordinate2D? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        let mapview = MAMapView.init(frame: self.bounds)
        mapview.delegate = self
        self.addSubview(mapview)
        
        mapview.isShowsUserLocation = true
        mapview.userTrackingMode = .follow
        
        
        if let location = userLocation{
            let anno = MAPointAnnotation.init()
            anno.coordinate = location
            anno.title = "Ta在这里！"
            mapview.addAnnotation(anno)
            
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
