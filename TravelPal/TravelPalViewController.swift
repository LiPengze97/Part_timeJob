//
//  TravelPalViewController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/3.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class TravelPalViewController: UIViewController {
    var vcArray = Array<MainTableViewController>()
    var tableViewArray = Array<UITableView>()
    var currentTabelView = UITableView()
    var stb = UIStoryboard.init(name: "Main", bundle: nil)
    
    
    var lastTableViewOffsetY = CGFloat()
    
    
    lazy var mapView = MAMapView(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 64))
    
    lazy var headSegmentView: HeadSegmentView = {
        let headSeg = HeadSegmentView.init(frame: CGRect.init(x: 0, y: 200, width: SCREEN_WIDTH, height: 40))
        headSeg.delegate = self
        return headSeg
    }()

    lazy var bottomScroll: UIScrollView = {
        let scroll = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        scroll.showsHorizontalScrollIndicator = false
        scroll.isPagingEnabled = true
        scroll.delegate = self
        scroll.contentSize = CGSize.init(width: CGFloat(headSegmentArray.count)*SCREEN_WIDTH, height: SCREEN_HEIGHT)
        return scroll
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(self.bottomScroll)
        for i in 0..<headSegmentArray.count {
            let ma = stb.instantiateViewController(withIdentifier: "MainTableViewController") as! MainTableViewController
            ma.view.frame = CGRect.init(x: SCREEN_WIDTH*CGFloat(i), y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            ma.vview.backgroundColor = UIColor.clear
            ma.tableView.tableHeaderView = ma.vview
            self.bottomScroll.addSubview(ma.tableView)
            self.vcArray.append(ma)
            self.tableViewArray.append(ma.tableView)
            for j in 0..<ma.tableView.visibleCells.count {
                (ma.tableView.visibleCells[j] as! DemoCell).delegate = self
            }
            ma.tableView.addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.new, context: nil)
        }
        self.view.addSubview(mapView)
        self.view.addSubview(headSegmentView)
        self.headSegmentView.sendData(titles: headSegmentArray)
        self.mapView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 200);
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
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
            self.headSegmentView.frame = CGRect.init(x: 0, y: 200-tableViewoffsetY, width: SCREEN_WIDTH, height: 40)
            self.mapView.frame = CGRect.init(x: 0, y: 0-tableViewoffsetY, width: SCREEN_WIDTH, height: 200)
            
        }else if( tableViewoffsetY < 0){
            self.headSegmentView.frame = CGRect.init(x: 0, y: 200, width: SCREEN_WIDTH, height:40);
            self.mapView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 200);
            
        }else if (tableViewoffsetY > 136){
            self.headSegmentView.frame = CGRect.init(x: 0, y: 64, width: SCREEN_WIDTH, height:40);
            self.mapView.frame = CGRect.init(x: 0, y: -136, width: SCREEN_WIDTH, height: 200);
        }

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
        print("ssss")
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
            self.bottomScroll.contentOffset = CGPoint.init(x: SCREEN_WIDTH*CGFloat(index), y: 0)
        }
    }
    
    
}

extension MainTableViewController{

}

extension TravelPalViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.headSegmentView.getIndex(index: Int(scrollView.contentOffset.x / SCREEN_WIDTH))
        
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


