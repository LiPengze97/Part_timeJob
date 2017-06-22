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
    
    let screenwidth = UIScreen.main.applicationFrame.size.width
    let screenheight = UIScreen.main.applicationFrame.size.height
    override func viewDidLoad() {
        super.viewDidLoad()

        //ccccccccccccccccccccccccccc
        switch navigationTitle {
        case "全部订单":
            if UserManager.shared.names1.count == 0 {
                let image = UIImageView(frame: CGRect(x: screenwidth/2-100, y: screenheight/2-150, width: 200, height: 200))
                image.image = UIImage(named: "nothing_icon")
                let label = UILabel(frame: CGRect(x: 0, y: screenheight/2+70, width: screenwidth, height: 20))
                label.text = "您还没有相关订单~"
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 20)
                self.view.addSubview(image)
                self.view.addSubview(label)
                self.view.backgroundColor = UIColor.white
                self.navigationItem.title = "我的订单"
            }else{
                tableview = UITableView(frame: CGRect(x: 0, y: 0, width: screenwidth, height: screenheight), style: UITableViewStyle.plain)
                tableview.delegate = self
                tableview.dataSource = self
                tableview.showsHorizontalScrollIndicator = false
                tableview.showsVerticalScrollIndicator = false
                tableview.bounces = false
                //tableview.separatorStyle = .none
                tableview.register(QuanBuTableViewCell.self, forCellReuseIdentifier: "QuanBucell")
                self.view.addSubview(tableview)
                
                self.navigationItem.title = navigationTitle
            }

        case "待付款":
            if UserManager.shared.names2.count == 0 {
                let image = UIImageView(frame: CGRect(x: screenwidth/2-100, y: screenheight/2-150, width: 200, height: 200))
                image.image = UIImage(named: "nothing_icon")
                let label = UILabel(frame: CGRect(x: 0, y: screenheight/2+70, width: screenwidth, height: 20))
                label.text = "您还没有相关订单~"
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 20)
                self.view.addSubview(image)
                self.view.addSubview(label)
                self.view.backgroundColor = UIColor.white
                self.navigationItem.title = "我的订单"
            }else{
                tableview = UITableView(frame: CGRect(x: 0, y: 0, width: screenwidth, height: screenheight), style: UITableViewStyle.plain)
                tableview.delegate = self
                tableview.dataSource = self
                tableview.showsHorizontalScrollIndicator = false
                tableview.showsVerticalScrollIndicator = false
                tableview.bounces = false
                //tableview.separatorStyle = .none
                tableview.register(DaiFuKuanTableViewCell.self, forCellReuseIdentifier: "DaiFuKuancell")
                self.view.addSubview(tableview)
                
                self.navigationItem.title = navigationTitle
            }

        case "已成功":
            if UserManager.shared.names3.count == 0 {
                let image = UIImageView(frame: CGRect(x: screenwidth/2-100, y: screenheight/2-150, width: 200, height: 200))
                image.image = UIImage(named: "nothing_icon")
                let label = UILabel(frame: CGRect(x: 0, y: screenheight/2+70, width: screenwidth, height: 20))
                label.text = "您还没有相关订单~"
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 20)
                self.view.addSubview(image)
                self.view.addSubview(label)
                self.view.backgroundColor = UIColor.white
                self.navigationItem.title = "我的订单"
            }else{
                tableview = UITableView(frame: CGRect(x: 0, y: 0, width: screenwidth, height: screenheight), style: UITableViewStyle.plain)
                tableview.delegate = self
                tableview.dataSource = self
                tableview.showsHorizontalScrollIndicator = false
                tableview.showsVerticalScrollIndicator = false
                tableview.bounces = false
                //tableview.separatorStyle = .none
                tableview.register(ChengGongTableViewCell.self, forCellReuseIdentifier: "ChengGongcell")
                self.view.addSubview(tableview)
                
                self.navigationItem.title = navigationTitle
            }

        default:
            if UserManager.shared.names1.count == 0 {
                let image = UIImageView(frame: CGRect(x: screenwidth/2-100, y: screenheight/2-150, width: 200, height: 200))
                image.image = UIImage(named: "nothing_icon")
                let label = UILabel(frame: CGRect(x: 0, y: screenheight/2+70, width: screenwidth, height: 20))
                label.text = "您还没有相关订单~"
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 20)
                self.view.addSubview(image)
                self.view.addSubview(label)
                self.view.backgroundColor = UIColor.white
                self.navigationItem.title = "我的订单"
            }else{
                tableview = UITableView(frame: CGRect(x: 0, y: 0, width: screenwidth, height: screenheight), style: UITableViewStyle.plain)
                tableview.delegate = self
                tableview.dataSource = self
                tableview.showsHorizontalScrollIndicator = false
                tableview.showsVerticalScrollIndicator = false
                tableview.bounces = false
                //tableview.separatorStyle = .none
                tableview.register(QuanBuTableViewCell.self, forCellReuseIdentifier: "QuanBucell")
                self.view.addSubview(tableview)
                
                self.navigationItem.title = navigationTitle
            }

        }
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 20, width: screenwidth, height: 44)
        self.navigationController?.navigationBar.setTitleVerticalPositionAdjustment(0, for: UIBarMetrics.default)
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }
    //cccccccccccccccccccccccccccccccc
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            var describeString = "描述："+UserManager.shared.describes1[indexPath.row]
            var priceString = "价格："+UserManager.shared.prices1[indexPath.row]
            var dateString = "日期："+UserManager.shared.dates1[indexPath.row]
            var strokeString = "行程安排:"+UserManager.shared.strokes1[indexPath.row]
            
            cell?.setupUI(beginString: nameString, destinationString: describeString, priceString: priceString, dateString: dateString, trafficString: strokeString)
            return cell!
        case "待付款":
            var cell = tableview.dequeueReusableCell(withIdentifier: "DaiFuKuancell") as? DaiFuKuanTableViewCell
            if cell == nil{
                cell = UITableViewCell(style:UITableViewCellStyle.default , reuseIdentifier: "DaiFuKuancell") as? DaiFuKuanTableViewCell
            }
            let nameString = "订单："+UserManager.shared.names2[indexPath.row]
            var describeString = "描述："+UserManager.shared.describes2[indexPath.row]
            var priceString = "价格："+UserManager.shared.prices2[indexPath.row]
            var dateString = "日期："+UserManager.shared.dates2[indexPath.row]
            var strokeString = "行程安排:"+UserManager.shared.strokes2[indexPath.row]
            
            cell?.setupUI(beginString: nameString, destinationString: describeString, priceString: priceString, dateString: dateString, trafficString: strokeString)
            return cell!
        case "已成功":
            var cell = tableview.dequeueReusableCell(withIdentifier: "ChengGongcell") as? ChengGongTableViewCell
            if cell == nil{
                cell = UITableViewCell(style:UITableViewCellStyle.default , reuseIdentifier: "ChengGongcell") as? ChengGongTableViewCell
            }
            let nameString = "订单："+UserManager.shared.names3[indexPath.row]
            var describeString = "描述："+UserManager.shared.describes3[indexPath.row]
            var priceString = "价格："+UserManager.shared.prices3[indexPath.row]
            var dateString = "日期："+UserManager.shared.dates3[indexPath.row]
            var strokeString = "行程安排:"+UserManager.shared.strokes3[indexPath.row]
            
            cell?.setupUI(beginString: nameString, destinationString: describeString, priceString: priceString, dateString: dateString, trafficString: strokeString)
            return cell!
        default:
            var cell = tableview.dequeueReusableCell(withIdentifier: "DaiFuKuancell") as? DaiFuKuanTableViewCell
            if cell == nil{
                cell = UITableViewCell(style:UITableViewCellStyle.default , reuseIdentifier: "DaiFuKuancell") as? DaiFuKuanTableViewCell
            }
            let nameString = "订单："+UserManager.shared.names1[indexPath.row]
            var describeString = "描述："+UserManager.shared.describes1[indexPath.row]
            var priceString = "价格："+UserManager.shared.prices1[indexPath.row]
            var dateString = "日期："+UserManager.shared.dates1[indexPath.row]
            var strokeString = "行程安排:"+UserManager.shared.strokes1[indexPath.row]
            
            cell?.setupUI(beginString: nameString, destinationString: describeString, priceString: priceString, dateString: dateString, trafficString: strokeString)
            return cell!
            //ccccccccccccccccccccccccccccc
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }

}
