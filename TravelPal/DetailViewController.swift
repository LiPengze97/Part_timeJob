//
//  DetailViewController.swift
//  ShiXun
//
//  Created by macbook on 2017/5/1.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    //ccccccccccccccccc
    var tableview : UITableView!
    var titleString : String!
    
    let screenwidth = UIScreen.main.applicationFrame.size.width
    let screenheight = UIScreen.main.applicationFrame.size.height
    override func viewDidLoad() {
        super.viewDidLoad()

        //cccccccccccccccccccccccccccccc
        switch titleString {
        case "收藏商品":
            if UserManager.shared.tits4.count == 0 {
                let image = UIImageView(frame: CGRect(x: screenwidth/2-100, y: screenheight/2-150, width: 200, height: 200))
                image.image = UIImage(named: "nothing_icon")
                let label = UILabel(frame: CGRect(x: 0, y: screenheight/2+70, width: screenwidth, height: 20))
                label.text = "您还没有相关收藏~"
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 20)
                self.view.addSubview(image)
                self.view.addSubview(label)
                self.view.backgroundColor = UIColor.white
                self.navigationItem.title = titleString
            }
            else{
                self.navigationItem.title = titleString
                tableview = UITableView(frame: CGRect(x: 0, y: 0, width: screenwidth, height: screenheight), style: UITableViewStyle.plain)
                tableview.delegate = self
                tableview.dataSource = self
                tableview.showsHorizontalScrollIndicator = false
                tableview.showsVerticalScrollIndicator = false
                tableview.bounces = false
                //tableview.separatorStyle = .none
                tableview.register(ProductTableViewCell.self, forCellReuseIdentifier: "productcell")
                
                self.view.addSubview(tableview)
            }

        case "报名旅游信息":
            if UserManager.shared.tits5.count == 0 {
                let image = UIImageView(frame: CGRect(x: screenwidth/2-100, y: screenheight/2-150, width: 200, height: 200))
                image.image = UIImage(named: "nothing_icon")
                let label = UILabel(frame: CGRect(x: 0, y: screenheight/2+70, width: screenwidth, height: 20))
                label.text = "您还没有相关收藏~"
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 20)
                self.view.addSubview(image)
                self.view.addSubview(label)
                self.view.backgroundColor = UIColor.white
                self.navigationItem.title = titleString
            }
            else{
                self.navigationItem.title = titleString
                tableview = UITableView(frame: CGRect(x: 0, y: 0, width: screenwidth, height: screenheight), style: UITableViewStyle.plain)
                tableview.delegate = self
                tableview.dataSource = self
                tableview.showsHorizontalScrollIndicator = false
                tableview.showsVerticalScrollIndicator = false
                tableview.bounces = false
                //tableview.separatorStyle = .none
                tableview.register(ProductTableViewCell.self, forCellReuseIdentifier: "productcell")
                
                self.view.addSubview(tableview)
            }

        case "我的旅伴":
            if UserManager.shared.tits6.count == 0 {
                let image = UIImageView(frame: CGRect(x: screenwidth/2-100, y: screenheight/2-150, width: 200, height: 200))
                image.image = UIImage(named: "nothing_icon")
                let label = UILabel(frame: CGRect(x: 0, y: screenheight/2+70, width: screenwidth, height: 20))
                label.text = "您还没有相关收藏~"
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 20)
                self.view.addSubview(image)
                self.view.addSubview(label)
                self.view.backgroundColor = UIColor.white
                self.navigationItem.title = titleString
            }
            else{
                self.navigationItem.title = titleString
                tableview = UITableView(frame: CGRect(x: 0, y: 0, width: screenwidth, height: screenheight), style: UITableViewStyle.plain)
                tableview.delegate = self
                tableview.dataSource = self
                tableview.showsHorizontalScrollIndicator = false
                tableview.showsVerticalScrollIndicator = false
                tableview.bounces = false
                //tableview.separatorStyle = .none
                tableview.register(ProductTableViewCell.self, forCellReuseIdentifier: "productcell")
                
                self.view.addSubview(tableview)
            }

        case "想去目的地":
            if UserManager.shared.tits7.count == 0 {
                let image = UIImageView(frame: CGRect(x: screenwidth/2-100, y: screenheight/2-150, width: 200, height: 200))
                image.image = UIImage(named: "nothing_icon")
                let label = UILabel(frame: CGRect(x: 0, y: screenheight/2+70, width: screenwidth, height: 20))
                label.text = "您还没有相关收藏~"
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 20)
                self.view.addSubview(image)
                self.view.addSubview(label)
                self.view.backgroundColor = UIColor.white
                self.navigationItem.title = titleString
            }
            else{
                self.navigationItem.title = titleString
                tableview = UITableView(frame: CGRect(x: 0, y: 0, width: screenwidth, height: screenheight), style: UITableViewStyle.plain)
                tableview.delegate = self
                tableview.dataSource = self
                tableview.showsHorizontalScrollIndicator = false
                tableview.showsVerticalScrollIndicator = false
                tableview.bounces = false
                //tableview.separatorStyle = .none
                tableview.register(ProductTableViewCell.self, forCellReuseIdentifier: "productcell")
                
                self.view.addSubview(tableview)
            }

        case "曾经去过":
            if UserManager.shared.tits8.count == 0 {
                let image = UIImageView(frame: CGRect(x: screenwidth/2-100, y: screenheight/2-150, width: 200, height: 200))
                image.image = UIImage(named: "nothing_icon")
                let label = UILabel(frame: CGRect(x: 0, y: screenheight/2+70, width: screenwidth, height: 20))
                label.text = "您还没有相关收藏~"
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 20)
                self.view.addSubview(image)
                self.view.addSubview(label)
                self.view.backgroundColor = UIColor.white
                self.navigationItem.title = titleString
            }
            else{
                self.navigationItem.title = titleString
                tableview = UITableView(frame: CGRect(x: 0, y: 0, width: screenwidth, height: screenheight), style: UITableViewStyle.plain)
                tableview.delegate = self
                tableview.dataSource = self
                tableview.showsHorizontalScrollIndicator = false
                tableview.showsVerticalScrollIndicator = false
                tableview.bounces = false
                //tableview.separatorStyle = .none
                tableview.register(ProductTableViewCell.self, forCellReuseIdentifier: "productcell")
                
                self.view.addSubview(tableview)
            }

        default:
            if UserManager.shared.tits4.count == 0 {
                let image = UIImageView(frame: CGRect(x: screenwidth/2-100, y: screenheight/2-150, width: 200, height: 200))
                image.image = UIImage(named: "nothing_icon")
                let label = UILabel(frame: CGRect(x: 0, y: screenheight/2+70, width: screenwidth, height: 20))
                label.text = "您还没有相关收藏~"
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 20)
                self.view.addSubview(image)
                self.view.addSubview(label)
                self.view.backgroundColor = UIColor.white
                self.navigationItem.title = titleString
            }
            else{
                self.navigationItem.title = titleString
                tableview = UITableView(frame: CGRect(x: 0, y: 0, width: screenwidth, height: screenheight), style: UITableViewStyle.plain)
                tableview.delegate = self
                tableview.dataSource = self
                tableview.showsHorizontalScrollIndicator = false
                tableview.showsVerticalScrollIndicator = false
                tableview.bounces = false
                //tableview.separatorStyle = .none
                tableview.register(ProductTableViewCell.self, forCellReuseIdentifier: "productcell")
                
                self.view.addSubview(tableview)
            }

        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch titleString {
        case "收藏商品":
            return UserManager.shared.tits4.count
        case "报名旅游信息":
            return UserManager.shared.tits5.count
        case "我的旅伴":
            return UserManager.shared.tits6.count
        case "想去目的地":
            return UserManager.shared.tits7.count
        case "曾经去过":
            return UserManager.shared.tits8.count
        default:
            return UserManager.shared.tits4.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableview.dequeueReusableCell(withIdentifier: "productcell") as? ProductTableViewCell
        
        if cell == nil{
            cell = UITableViewCell(style:UITableViewCellStyle.default , reuseIdentifier: "productcell") as? ProductTableViewCell
        }
        
        //cccccccccccccccccccccccccccc
        switch titleString {
        case "收藏商品":
            var titleString = UserManager.shared.tits4[indexPath.row]
            var priceString = "价格："+UserManager.shared.price4[indexPath.row]
            let imageString = UserManager.shared.images4[indexPath.row]
            let collectString = UserManager.shared.collects4[indexPath.row]+"人收藏"
            let siteString = "描述："+UserManager.shared.describe4[indexPath.row]
            
            cell?.setupUI(imageString: imageString, titleString: titleString, priceString: priceString, collectString: collectString, siteString: siteString)
            return cell!
        case "报名旅游信息":
            var titleString = UserManager.shared.tits5[indexPath.row]
            var priceString = "价格："+UserManager.shared.price5[indexPath.row]
            let imageString = UserManager.shared.images5[indexPath.row]
            let collectString = UserManager.shared.collects5[indexPath.row]+"人收藏"
            let siteString = "描述："+UserManager.shared.describe5[indexPath.row]
            
            cell?.setupUI(imageString: imageString, titleString: titleString, priceString: priceString, collectString: collectString, siteString: siteString)
            return cell!
        case "我的旅伴":
            var titleString = UserManager.shared.tits6[indexPath.row]
            var priceString = "价格："+UserManager.shared.price6[indexPath.row]
            let imageString = UserManager.shared.images6[indexPath.row]
            let collectString = UserManager.shared.collects6[indexPath.row]+"人收藏"
            let siteString = "描述："+UserManager.shared.describe6[indexPath.row]
            
            cell?.setupUI(imageString: imageString, titleString: titleString, priceString: priceString, collectString: collectString, siteString: siteString)
            return cell!
        case "想去目的地":
            var titleString = UserManager.shared.tits7[indexPath.row]
            var priceString = "出行时间："+UserManager.shared.price7[indexPath.row]
            let imageString = UserManager.shared.images7[indexPath.row]
            let collectString = "评分："+UserManager.shared.collects7[indexPath.row]
            let siteString = "下单时间："+UserManager.shared.describe7[indexPath.row]
            
            cell?.setupUI(imageString: imageString, titleString: titleString, priceString: priceString, collectString: collectString, siteString: siteString)
            return cell!
        case "曾经去过":
            var titleString = UserManager.shared.tits8[indexPath.row]
            var priceString = "出行时间："+UserManager.shared.price8[indexPath.row]
            let imageString = UserManager.shared.images8[indexPath.row]
            let collectString = "评分："+UserManager.shared.collects8[indexPath.row]
            let siteString = "下单时间："+UserManager.shared.describe8[indexPath.row]
            
            cell?.setupUI(imageString: imageString, titleString: titleString, priceString: priceString, collectString: collectString, siteString: siteString)
            return cell!
        default:
            var titleString = UserManager.shared.tits4[indexPath.row]
            var priceString = "价格："+UserManager.shared.price4[indexPath.row]
            let imageString = UserManager.shared.images4[indexPath.row]
            let collectString = UserManager.shared.collects4[indexPath.row]+"人收藏"
            let siteString = "描述："+UserManager.shared.describe4[indexPath.row]
            
            cell?.setupUI(imageString: imageString, titleString: titleString, priceString: priceString, collectString: collectString, siteString: siteString)
            return cell!
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.setTitleVerticalPositionAdjustment(0, for: UIBarMetrics.default)
//        username = UserManager.shared.username
        self.tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
