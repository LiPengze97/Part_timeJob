//
//  PayViewController.swift
//  lvban
//
//  Created by 冼啟棉 on 17/6/15.
//  Copyright © 2017年 冼啟棉. All rights reserved.
//

import UIKit

class PayViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    var tableview = UITableView()
    
    var picture = UIImage()
    var name = ""
    var cost = 1
    var aa = ""
    var cc = ""
    var nn = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftbutton = UIButton(frame: CGRect(x: 11, y: 30, width:24 , height: 24))
        leftbutton.setBackgroundImage(#imageLiteral(resourceName: "back"), for: .normal)
        leftbutton.addTarget(self, action: #selector(SearchResultViewController.tappedLeft(_:)), for: UIControlEvents.touchUpInside)
        
        let topView = UIView()
        topView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 64)
        topView.backgroundColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1);
        
        let title = UILabel()
        title.frame = CGRect(x: 0, y: 25, width: self.view.frame.width, height: 35)
        title.backgroundColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1);
        title.text = "确认付款"
        title.textAlignment = NSTextAlignment.center
        title.textColor = UIColor.white
        
        topView.addSubview(title)
        topView.addSubview(leftbutton)
        self.view.addSubview(topView)
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.frame = CGRect(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height-64-50)
        self.view.addSubview(tableview)
        
        
        let pp = UIButton()
        pp.frame = CGRect(x: 150, y: self.view.frame.height-50, width: self.view.frame.width-150, height: 50)
        pp.backgroundColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1);
        pp.setTitle("立即付款", for: UIControlState())
        pp.titleLabel?.textColor = UIColor.white
        self.view.addSubview(pp)
        
        let kk = UIButton()
        kk.frame = CGRect(x: 0, y: self.view.frame.height-50, width: 150, height: 50)
        kk.backgroundColor = UIColor.gray
        kk.setTitle("客服", for: UIControlState())
        kk.titleLabel?.textColor = UIColor.white
        self.view.addSubview(kk)
        

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath:IndexPath) ->CGFloat{
        
        if(indexPath.section == 0){return 120}
        if(indexPath.section == 1){return 450}
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return   4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return   3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell!{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "aaa")
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if(indexPath.section == 0){
            let ii = UIImageView(image: picture)
            ii.frame = CGRect(x: 8, y: 8, width: 150, height: 120-16)
            cell.addSubview(ii)
            
            
            let ll = UILabel()
            ll.frame = CGRect(x: 170, y: 16, width:self.view.frame.width-186 , height: 50)
            ll.text = name
            ll.textColor = UIColor.black
            ll.font = UIFont.systemFont(ofSize: 17)
            ll.lineBreakMode = NSLineBreakMode.byWordWrapping
            ll.numberOfLines = 0
            ll.textAlignment = NSTextAlignment.center
            cell.addSubview(ll)
            
            let pp = UILabel()
            pp.frame = CGRect(x: 170, y: 76, width:self.view.frame.width-186 , height: 30)
            pp.text = "￥"+String(cost)
            pp.textColor = UIColor.orange
            pp.font = UIFont.systemFont(ofSize: 23)
            pp.textAlignment = NSTextAlignment.right
            cell.addSubview(pp)
            
        }
        
        if(indexPath.section == 1){
            
            let kk = UILabel()
            kk.frame = CGRect(x: 16, y: 20, width: 200, height: 30)
            
            kk.text = "费用说明"
            kk.textColor = UIColor.black
            kk.font = UIFont.systemFont(ofSize: 18)
            cell.addSubview(kk)
            
            let dd = UILabel()
            dd.frame = CGRect(x: 16, y: 50, width: self.view.frame.width-16*2, height: 360)
            dd.text = cc
            dd.font = UIFont.systemFont(ofSize: 14)
            dd.lineBreakMode = NSLineBreakMode.byWordWrapping
            dd.numberOfLines = 0
            cell.addSubview(dd)
            
            
        }
        
        if(indexPath.section == 2){
            let pp = UILabel()
            pp.frame = CGRect(x: 170, y: 35, width:self.view.frame.width-186 , height: 30)
            pp.text = "￥"+String(cost)
            pp.textColor = UIColor.orange
            pp.font = UIFont.systemFont(ofSize: 24)
            pp.textAlignment = NSTextAlignment.right
            cell.addSubview(pp)
            
            let ss = UILabel()
            ss.frame = CGRect(x: 160, y: 35, width:50, height: 30)
            ss.text = "总价: "
            ss.textColor = UIColor.black
            ss.font = UIFont.systemFont(ofSize: 18)
            // ss.textAlignment = NSTextAlignment.Right
            cell.addSubview(ss)
        }
        
        
        
        return cell
    }

    
    
    func tappedLeft(_ button:UIButton){
        navigationController?.popViewController(animated: true)
       // self.dismiss(animated: true, completion: nil)
    }
    
 
}
