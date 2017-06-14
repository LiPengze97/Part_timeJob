//
//  TravelPostViewController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/19.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class TravelPostViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    var tableview:UITableView?
    let keys = ["简要信息","详细信息","位置信息"]
    
    
    
    //textfieds
    var fromText:UITextField?//出发地
    var destText:UITextField?//目的地
    var deptText:UITextField?//出发时间
    var backText:UITextField?//返回时间
    var peopleHaveNum:UITextField?//已有人数
    var peopleNeedNum:UITextField?//需要人数
    var budgetText:UITextField?//预算
    var transportText:UITextField?//交通工具
    var locationText:UITextField?//详细地点
    
    //textview
    var detailTextView:UITextView?//详情view
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        tableview?.delegate = self
        tableview?.dataSource = self
        self.view.addSubview(tableview!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }else if section == 1{
            return 1
        }else{
            return 1
        }
    
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myView = UIView.init()
        myView.backgroundColor = UIColor.init(white: 0.950, alpha: 0.7)
        
        let view = UIView.init(frame: CGRect.init(x: 4, y: 4, width: 0, height: 0))
        view.backgroundColor = UIColor.init(red: 35/255.0, green: 173/255.0, blue: 130/255.0, alpha: 1)
        myView.addSubview(view)
        
        let label = UILabel.init(frame: CGRect.init(x: 30, y: 3, width: 200, height: 22))
        label.textColor = UIColor.init(white: 0.5, alpha: 1.0)
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: 0)
        label.text = keys[section]
        myView.addSubview(label)
        
        return myView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 30
        }else if indexPath.section == 1{
            return 130
        }else{
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = NSString.localizedStringWithFormat("%ld%ld", indexPath.section,indexPath.row) as String
        var cell = tableview?.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellID)
        }
        if(indexPath.section == 0){
            if(indexPath.row == 0){
                let label1 = UILabel.init(frame: CGRect.init(x: 4, y: 0, width: 70, height: 30))
                label1.text = "旅游出发地："
                cell?.addSubview(label1)
                
                let label2 = UILabel.init(frame: CGRect.init(x: 186, y: 0, width: 70, height: 30))
                label2.text = "旅游目的地："
                cell?.addSubview(label2)
                
                if(fromText == nil){
                    fromText = UITextField.init(frame: CGRect.init(x: 80, y: 0, width: 80, height: 50))
                    fromText?.layer.borderWidth = 0
                    fromText?.placeholder = "请输入出发地"
                    fromText?.delegate = self
                    fromText?.font = UIFont.systemFont(ofSize: 18)
                    cell?.addSubview(fromText!)
                }
                
                if(destText == nil){
                    destText = UITextField.init(frame: CGRect.init(x: 260, y: 0, width: 80, height: 50))
                    destText?.layer.borderWidth = 0
                    destText?.placeholder = "请输入目的地"
                    destText?.delegate = self
                    destText?.font = UIFont.systemFont(ofSize: 18)
                    cell?.addSubview(destText!)
                }
            }else if(indexPath.row == 1){
                let label1 = UILabel.init(frame: CGRect.init(x: 4, y: 0, width: 70, height: 30))
                label1.text = "出发日期："
                cell?.addSubview(label1)
                
                let label2 = UILabel.init(frame: CGRect.init(x: 186, y: 0, width: 70, height: 30))
                label2.text = "返回时间："
                cell?.addSubview(label2)
                
                if(deptText == nil){
                    deptText = UITextField.init(frame: CGRect.init(x: 80, y: 0, width: 80, height: 50))
                    deptText?.layer.borderWidth = 0
                    deptText?.placeholder = "请输入出发地"
                    deptText?.delegate = self
                    deptText?.font = UIFont.systemFont(ofSize: 18)
                    cell?.addSubview(deptText!)
                }
                
                if(backText == nil){
                    backText = UITextField.init(frame: CGRect.init(x: 260, y: 0, width: 80, height: 50))
                    backText?.layer.borderWidth = 0
                    backText?.placeholder = "请输入目的地"
                    backText?.delegate = self
                    backText?.font = UIFont.systemFont(ofSize: 18)
                    cell?.addSubview(backText!)
                }
            }else if indexPath.row == 2{
                let label1 = UILabel.init(frame: CGRect.init(x: 4, y: 0, width: 70, height: 30))
                label1.text = "已有人数："
                cell?.addSubview(label1)
                
                let label2 = UILabel.init(frame: CGRect.init(x: 186, y: 0, width: 70, height: 30))
                label2.text = "计划人数："
                cell?.addSubview(label2)
                
                if(peopleHaveNum == nil){
                    peopleHaveNum = UITextField.init(frame: CGRect.init(x: 80, y: 0, width: 80, height: 50))
                    peopleHaveNum?.layer.borderWidth = 0
                    peopleHaveNum?.placeholder = "请输入"
                    peopleHaveNum?.delegate = self
                    peopleHaveNum?.font = UIFont.systemFont(ofSize: 18)
                    cell?.addSubview(peopleHaveNum!)
                }
                
                if(peopleNeedNum == nil){
                    peopleNeedNum = UITextField.init(frame: CGRect.init(x: 260, y: 0, width: 80, height: 50))
                    peopleNeedNum?.layer.borderWidth = 0
                    peopleNeedNum?.placeholder = "请输入"
                    peopleNeedNum?.delegate = self
                    peopleNeedNum?.font = UIFont.systemFont(ofSize: 18)
                    cell?.addSubview(peopleNeedNum!)
                }

            }else{
                let label1 = UILabel.init(frame: CGRect.init(x: 4, y: 0, width: 70, height: 30))
                label1.text = "旅游预算："
                cell?.addSubview(label1)
                
                let label2 = UILabel.init(frame: CGRect.init(x: 186, y: 0, width: 70, height: 30))
                label2.text = "交通工具："
                cell?.addSubview(label2)
                
                if(budgetText == nil){
                    budgetText = UITextField.init(frame: CGRect.init(x: 80, y: 0, width: 80, height: 50))
                    budgetText?.layer.borderWidth = 0
                    budgetText?.placeholder = "请输入出发地"
                    budgetText?.delegate = self
                    budgetText?.font = UIFont.systemFont(ofSize: 18)
                    cell?.addSubview(budgetText!)
                }
                
                if(transportText == nil){
                    transportText = UITextField.init(frame: CGRect.init(x: 260, y: 0, width: 80, height: 50))
                    transportText?.layer.borderWidth = 0
                    transportText?.placeholder = "请输入目的地"
                    transportText?.delegate = self
                    transportText?.font = UIFont.systemFont(ofSize: 18)
                    cell?.addSubview(transportText!)
                }
            }
        }else if indexPath.section == 1{
            detailTextView = UITextView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 130))
            cell?.addSubview(detailTextView!)
        }else if indexPath.section == 2{
            let label1 = UILabel.init(frame: CGRect.init(x: 4, y: 0, width: 70, height: 30))
            label1.text = "请输入详细地址"
            cell?.addSubview(label1)
            locationText = UITextField.init(frame: CGRect.init(x: 80, y: 0, width: 160, height: 30))
            locationText?.placeholder = "请输入"
            locationText?.layer.borderWidth = 0
            locationText?.delegate = self
            locationText?.font = UIFont.systemFont(ofSize: 18)
            cell?.addSubview(locationText!)
        }
        return cell!
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
