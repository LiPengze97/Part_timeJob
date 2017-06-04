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
    var images: [String] = []
    var tits: [String] = []
    var prices: [String] = []
    
    let screenwidth = UIScreen.main.applicationFrame.size.width
    let screenheight = UIScreen.main.applicationFrame.size.height
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview = UITableView(frame: CGRect(x: 0, y: 64, width: screenwidth, height: screenheight-64), style: UITableViewStyle.plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.showsHorizontalScrollIndicator = false
        tableview.showsVerticalScrollIndicator = false
        tableview.bounces = false
        //tableview.separatorStyle = .none
        tableview.register(ProductTableViewCell.self, forCellReuseIdentifier: "productcell")
        
        self.view.addSubview(tableview)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return tits.count
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableview.dequeueReusableCell(withIdentifier: "productcell") as? ProductTableViewCell
        
        if cell == nil{
            cell = UITableViewCell(style:UITableViewCellStyle.default , reuseIdentifier: "productcell") as? ProductTableViewCell
        }
//        var imageString = images[indexPath.row]
//        var titleString = tits[indexPath.row]
//        var priceString = prices[indexPath.row]
        let imageString = "xiamen.jpg"
        let titleString = "厦门"
        let priceString = "2333人去过"
        let collectString = "23232人收藏"
        let siteString = "鼓浪屿、曾厝垵、厦门大学、日光岩"
        
        cell?.setupUI(imageString: imageString, titleString: titleString, priceString: priceString, collectString: collectString, siteString: siteString)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
