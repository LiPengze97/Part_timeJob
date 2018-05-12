//
//  DetailDingDanViewController.swift
//  ShiXun
//
//  Created by macbook on 2017/6/13.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit



class DetailDingDanViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    //从个人页面的按钮传值过来
    var navigationTitle : String!
    var tableview : UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white;
        title = navigationTitle
        UserManager.addObserver(observer: self, selector: #selector(shouldReload), notification: .shouldReloadData)
        
        switch navigationTitle {
        case "全部订单":
            if UserManager.shared.names1.count == 0 {
                self.view.addSubview(getImgV())
                self.view.addSubview(getLabel())
            }else{
                initTable()
                tableview.register(QuanBuTableViewCell.self, forCellReuseIdentifier: "QuanBucell")
            }
            
        case "待付款":
            if UserManager.shared.names2.count == 0 {
                self.view.addSubview(getImgV())
                self.view.addSubview(getLabel())
            }else{
                initTable()
                tableview.register(DaiFuKuanTableViewCell.self, forCellReuseIdentifier: "DaiFuKuancell")
            }

        case "已成功":
            if UserManager.shared.names3.count == 0 {
                self.view.addSubview(getImgV())
                self.view.addSubview(getLabel())
            }else{
                initTable()
                tableview.register(ChengGongTableViewCell.self, forCellReuseIdentifier: "ChengGongcell")
            }

        default:
            break
        }
        
        
    }
    
    func shouldReload() {
        self.tableview .reloadData()
    }
    
    func getImgV() -> UIImageView {
        let image = UIImageView(frame: CGRect(x: SCREEN_WIDTH/2-100, y: SCREEN_HEIGHT/2-200, width: 200, height: 200))
        image.image = UIImage(named: "nothing_icon")
        return image
    }
    
    func getLabel() -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: SCREEN_HEIGHT/2+20, width: SCREEN_WIDTH, height: 20))
        label.text = "您还没有相关订单~"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label;
    }
    
    func initTable() {
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: UITableViewStyle.plain)
        tableview.tableFooterView = UIView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.estimatedRowHeight = 0;
        tableview.rowHeight = 132
        self.view.addSubview(tableview)
    }

 


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch navigationTitle {
        case "全部订单":
            return UserManager.shared.names1.count
        case "待付款":
            return UserManager.shared.names2.count
        case "已成功":
            return UserManager.shared.names3.count
        default:
            return UserManager.shared.names1.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch navigationTitle {
        case "全部订单":
            var cell = tableview.dequeueReusableCell(withIdentifier: "QuanBucell") as? QuanBuTableViewCell
            if cell == nil{
                cell = UITableViewCell(style:UITableViewCellStyle.default , reuseIdentifier: "QuanBucell") as? QuanBuTableViewCell
            }
            //cccccccccccccccccccccccccccccccccccc
            let nameString = "订单："+UserManager.shared.names1[indexPath.row]
            let describeString = "描述："+UserManager.shared.describes1[indexPath.row]
            let priceString = "价格："+UserManager.shared.prices1[indexPath.row]
            let dateString = "日期："+UserManager.shared.dates1[indexPath.row]
            let strokeString = "行程安排:"+UserManager.shared.strokes1[indexPath.row]
            
            cell?.setupUI(beginString: nameString, destinationString: describeString, priceString: priceString, dateString: dateString, trafficString: strokeString)
            return cell!
        case "待付款":
            var cell = tableview.dequeueReusableCell(withIdentifier: "DaiFuKuancell") as? DaiFuKuanTableViewCell
            if cell == nil{
                cell = UITableViewCell(style:UITableViewCellStyle.default , reuseIdentifier: "DaiFuKuancell") as? DaiFuKuanTableViewCell
            }
            let nameString = "订单："+UserManager.shared.names2[indexPath.row]
            let describeString = "描述："+UserManager.shared.describes2[indexPath.row]
            let priceString = "价格："+UserManager.shared.prices2[indexPath.row]
            let dateString = "日期："+UserManager.shared.dates2[indexPath.row]
            let strokeString = "行程安排:"+UserManager.shared.strokes2[indexPath.row]
            
            cell?.setupUI(beginString: nameString, destinationString: describeString, priceString: priceString, dateString: dateString, trafficString: strokeString)
            return cell!
        case "已成功":
            var cell = tableview.dequeueReusableCell(withIdentifier: "ChengGongcell") as? ChengGongTableViewCell
            if cell == nil{
                cell = UITableViewCell(style:UITableViewCellStyle.default , reuseIdentifier: "ChengGongcell") as? ChengGongTableViewCell
            }
            let nameString = "订单："+UserManager.shared.names3[indexPath.row]
            let describeString = "描述："+UserManager.shared.describes3[indexPath.row]
            let priceString = "价格："+UserManager.shared.prices3[indexPath.row]
            let dateString = "日期："+UserManager.shared.dates3[indexPath.row]
            let strokeString = "行程安排:"+UserManager.shared.strokes3[indexPath.row]
            
            cell?.setupUI(beginString: nameString, destinationString: describeString, priceString: priceString, dateString: dateString, trafficString: strokeString)
            return cell!
        default:
            var cell = tableview.dequeueReusableCell(withIdentifier: "DaiFuKuancell") as? DaiFuKuanTableViewCell
            if cell == nil{
                cell = UITableViewCell(style:UITableViewCellStyle.default , reuseIdentifier: "DaiFuKuancell") as? DaiFuKuanTableViewCell
            }
            let nameString = "订单："+UserManager.shared.names1[indexPath.row]
            let describeString = "描述："+UserManager.shared.describes1[indexPath.row]
            let priceString = "价格："+UserManager.shared.prices1[indexPath.row]
            let dateString = "日期："+UserManager.shared.dates1[indexPath.row]
            let strokeString = "行程安排:"+UserManager.shared.strokes1[indexPath.row]
            
            cell?.setupUI(beginString: nameString, destinationString: describeString, priceString: priceString, dateString: dateString, trafficString: strokeString)
            return cell!
           
        }
        
    }
    
 

}
