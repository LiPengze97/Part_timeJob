//
//  DetailViewController.swift
//  ShiXun
//
//  Created by macbook on 2017/5/1.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

     
    var tableview : UITableView!
    var titleString : String!
    
    override func viewWillAppear(_ animated: Bool) {
        
        //self.navigationController?.navigationBar.barTintColor = UIColor.white
        //self.navigationController?.navigationBar.tintColor = UIColor.black
        //self.navigationController?.navigationBar.setTitleVerticalPositionAdjustment(0, for: UIBarMetrics.default)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white;
        title = titleString
       
        
        switch titleString {
            
        case "收藏商品":
            if UserManager.shared.tits4.count == 0 {
                self.view.addSubview(getImgV())
                self.view.addSubview(getLabel("您还没有相关收藏~"))
            } else{
                initTable()
                tableview.register(ProductTableViewCell.self, forCellReuseIdentifier: "productcell")
            }

        case "报名旅游信息":
            if UserManager.shared.tits5.count == 0 {
                self.view.addSubview(getImgV())
                self.view.addSubview(getLabel("您还没有相关报名信息~"))
            } else{
                initTable()
                tableview.register(ProductTableViewCell.self, forCellReuseIdentifier: "productcell")
            }
        case "我的旅伴":
            if UserManager.shared.tits6.count == 0 {
                self.view.addSubview(getImgV())
                self.view.addSubview(getLabel("您还没有旅伴~"))
            } else{
                initTable()
                tableview.register(ProductTableViewCell.self, forCellReuseIdentifier: "productcell")
            }
            
        case "想去目的地":
            if UserManager.shared.tits7.count == 0 {
                self.view.addSubview(getImgV())
                self.view.addSubview(getLabel("您还没有添加目的地~"))
            } else {
                initTable();
                tableview.register(ProductTableViewCell.self, forCellReuseIdentifier: "productcell")
            }

        case "曾经去过":
            if UserManager.shared.tits8.count == 0 {
                    self.view.addSubview(getImgV())
                    self.view.addSubview(getLabel("您还没有去过任何地方~"))
            } else {
                initTable()
                tableview.register(ProductTableViewCell.self, forCellReuseIdentifier: "productcell")
            }

        default:
            break;
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
            return 0
        }
        
    }
    func getImgV() -> UIImageView {
        let image = UIImageView(frame: CGRect(x: SCREEN_WIDTH/2-100, y: SCREEN_HEIGHT/2-200, width: 200, height: 200))
        image.image = UIImage(named: "nothing_icon")
        return image
    }
    
    func getLabel(_ txt: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: SCREEN_HEIGHT/2+20, width: SCREEN_WIDTH, height: 20))
        label.text = txt
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label;
    }
    
    func initTable() {
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: UITableViewStyle.plain)
        tableview.tableFooterView = UIView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = 88
        self.view.addSubview(tableview)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableview.dequeueReusableCell(withIdentifier: "productcell") as? ProductTableViewCell
        
        if cell == nil{
            cell = UITableViewCell(style:UITableViewCellStyle.default , reuseIdentifier: "productcell") as? ProductTableViewCell
        }
        
      
        switch titleString {
        case "收藏商品":
            let titleString = UserManager.shared.tits4[indexPath.row]
            let priceString = "价格："+UserManager.shared.price4[indexPath.row]
            let imageString = UserManager.shared.images4[indexPath.row]
            let collectString = UserManager.shared.collects4[indexPath.row]+"人收藏"
            let siteString = "描述："+UserManager.shared.describe4[indexPath.row]
            
            cell?.setupUI(imageString: imageString, titleString: titleString, priceString: priceString, collectString: collectString, siteString: siteString)
            return cell!
        case "报名旅游信息":
            let titleString = UserManager.shared.tits5[indexPath.row]
            let priceString = UserManager.shared.price5[indexPath.row]
            let imageString = UserManager.shared.images5[indexPath.row]
            let collectString = UserManager.shared.collects5[indexPath.row]
            let siteString = UserManager.shared.describe5[indexPath.row]
            
            cell?.setupUI(imageString: imageString, titleString: titleString, priceString: priceString, collectString: collectString, siteString: siteString)
            return cell!
        case "我的旅伴":
            let titleString = UserManager.shared.tits6[indexPath.row]
            let priceString = UserManager.shared.price6[indexPath.row]
            let imageString = UserManager.shared.images6[indexPath.row]
            let collectString = UserManager.shared.collects6[indexPath.row]
            let siteString = UserManager.shared.describe6[indexPath.row]
            
            cell?.setupUI(imageString: imageString, titleString: titleString, priceString: priceString, collectString: collectString, siteString: siteString)
            return cell!
        case "想去目的地":
            let titleString = UserManager.shared.tits7[indexPath.row]
            let priceString = "出行时间："+UserManager.shared.price7[indexPath.row]
            let imageString = UserManager.shared.images7[indexPath.row]
            let collectString = "评分："+UserManager.shared.collects7[indexPath.row]
            let siteString = "下单时间："+UserManager.shared.describe7[indexPath.row]
            
            cell?.setupUI(imageString: imageString, titleString: titleString, priceString: priceString, collectString: collectString, siteString: siteString)
            return cell!
        case "曾经去过":
            let titleString = UserManager.shared.tits8[indexPath.row]
            let priceString = "出行时间："+UserManager.shared.price8[indexPath.row]
            let imageString = UserManager.shared.images8[indexPath.row]
            let collectString = "评分："+UserManager.shared.collects8[indexPath.row]
            let siteString = "下单时间："+UserManager.shared.describe8[indexPath.row]
            
            cell?.setupUI(imageString: imageString, titleString: titleString, priceString: priceString, collectString: collectString, siteString: siteString)
            return cell!
        default:
            let titleString = UserManager.shared.tits4[indexPath.row]
            let priceString = "价格："+UserManager.shared.price4[indexPath.row]
            let imageString = UserManager.shared.images4[indexPath.row]
            let collectString = UserManager.shared.collects4[indexPath.row]+"人收藏"
            let siteString = "描述："+UserManager.shared.describe4[indexPath.row]
            
            cell?.setupUI(imageString: imageString, titleString: titleString, priceString: priceString, collectString: collectString, siteString: siteString)
            return cell!
        }
    }
    
   
 
}
