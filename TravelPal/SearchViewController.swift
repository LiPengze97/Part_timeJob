//
//  SearchViewController.swift
//  lvban
//
//  Created by 冼啟棉 on 17/5/12.
//  Copyright © 2017年 冼啟棉. All rights reserved.
//

import UIKit



class SearchViewController: UIViewController,UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate{
    
    //CCCCCCCCCCCCCCCCCC1
    let array = ["北京","上海","广州","深圳" ,"香港","杭州","重庆","伦敦","济南","济宁","济州岛"]
    //CCCCCCCCCCCCCCCCCC1
    
    var result = [String]()
    var historical = [String]()
    var hotsearch = [String]()
    var searchBar:UISearchBar!
    var tableView:UITableView!
    var a = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hotsearch = ["伦敦","北京","上海","广州","深圳" ,"香港","杭州","重庆"]
        self.historical = ["伦敦","北京","上海","广州","香港","杭州","重庆"]
        
        self.view.backgroundColor = UIColor.white
        searchBar = UISearchBar(frame: CGRect(x: 60, y: 27, width: self.view.frame.width-120, height: 50))
        //searchBar.backgroundColor = UIColor.white
        searchBar.tintColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1)
        
        
        tableView = UITableView(frame: CGRect(x: 0, y: 70, width: self.view.frame.width, height: self.view.frame.height-70))
        
        //CCCCCCCCCCCCCCCCCCCC2
        let leftbutton = UIButton(frame: CGRect(x: 11, y: 32, width:60 , height: 36))
        
        // leftbutton.backgroundColor = UIColor.orangeColor()
        leftbutton.setTitle("返回", for: UIControlState())
        leftbutton.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        leftbutton.setTitleColor(UIColor.black, for: UIControlState())
        leftbutton.addTarget(self, action: #selector(SearchViewController.tappedLeft(_:)), for: UIControlEvents.touchUpInside)
        //CCCCCCCCCCCCCCCCCCCC2
        
        
        
        
        // 搜索内容为空时，显示全部内容
        //    self.result = self.array
        self.searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.searchBar.placeholder = "搜索"
        //        searchBar.showsCancelButton = false
        //        searchBar.layer.cornerRadius = 25
        
        
        if(a != ""){
            searchBar.text = a
            // 匹配用户输入的前缀，不区分大小写
            self.result = []
            
            for arr in self.array {
                
                if arr.lowercased().hasPrefix(a.lowercased()) {
                    self.result.append(arr)
                }
            }
 
            // 刷新tableView 数据显示
            self.tableView.reloadData()
        }
        
        
        
        // 注册tableviewCell
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(searchBar)
        self.view.addSubview(tableView)
        self.view.addSubview(leftbutton)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchBar.text == "" || self.result == []){return 4}
        return self.result.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath:IndexPath) ->CGFloat{
        if(searchBar.text == "" || self.result == []){
            if(indexPath.row == 0 || indexPath.row == 2){return 44}
            else if(indexPath.row == 1 ){return CGFloat(Int(self.hotsearch.count/3+1)*46)}
            else {return CGFloat(self.historical.count*45)}
            
        }
        else{return 44}
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify: String = "cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as UITableViewCell
        
        
//        if(searchBar.text != ""){
//            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
//            cell.textLabel?.text = self.result[indexPath.row]
//
//        }
        
//        if(searchBar.text == ""){
        
        
        if true {
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            if(indexPath.row == 0){
                cell.textLabel?.text = "热门搜索"
                cell.textLabel?.font = UIFont.systemFont(ofSize: 14)}
            else if(indexPath.row == 2){
                cell.textLabel?.text = "历史纪录"
                cell.textLabel?.font = UIFont.systemFont(ofSize: 14)}
            else if(indexPath.row == 1){
                for p in 0..<Int(self.hotsearch.count/3)+1{
                    let sw = (SCREEN_WIDTH-4)/3
                    let sx = sw+2;
                    for s in 0..<3{
                        let button = UIButton(frame: CGRect(x: Int(sx)*s, y: 46*p, width: Int(sw), height: 44))
                        if(p*3+s < self.hotsearch.count){
                            button.setTitle(self.hotsearch[p*3+s], for: UIControlState())}
                        button.titleLabel!.font = UIFont.systemFont(ofSize: 15)
                        button.setTitleColor(UIColor.black, for: UIControlState())
                        button.backgroundColor = UIColor.white
                        button.tag = 100+p*3+s
                        if(p*3+s < self.hotsearch.count){
                            button.addTarget(self, action: #selector(SearchViewController.tappedSearch(_:)), for: UIControlEvents.touchUpInside)}
                        cell.addSubview(button)}}
                
            }
            else if(indexPath.row == 3){
                for  t in 0..<historical.count{
                    let tbutton = UIButton(frame: CGRect(x: 0, y:CGFloat(45*t) , width: self.view.frame.width, height: 44))
                    tbutton.setTitle("         "+self.historical[t], for: UIControlState())
                    tbutton.backgroundColor = UIColor.white
                    tbutton.titleLabel!.font = UIFont.systemFont(ofSize: 15)
                    tbutton.setTitleColor(UIColor.black, for: UIControlState())
                    tbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
                    tbutton.tag = 200+t
                    tbutton.addTarget(self, action: #selector(SearchViewController.tappedSearch(_:)), for: UIControlEvents.touchUpInside)
                    cell.addSubview(tbutton)
                }
            }
            
            
        }
        cell.backgroundColor = UIColor(red : 0xD9/255, green : 0xD9/255, blue : 0xD9/255, alpha : 1);
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        print("[ViewController searchBar] searchText: \(searchText)")
        /*
         // 没有搜索内容时显示全部内容
         if searchText == "" {
         
         //  self.result = self.array
         } else {
         
         // 匹配用户输入的前缀，不区分大小写
         self.result = []
         
         for arr in self.array {
         
         if arr.lowercased().hasPrefix(searchText.lowercased()) {
         self.result.append(arr)
         }
         }
         }
         
         // 刷新tableView 数据显示
         self.tableView.reloadData()
         */
    }
    
    // 搜索触发事件，点击虚拟键盘上的search按钮时触发此方法
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
    }
    
    // 书签按钮触发事件
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        
        print("搜索历史")
    }
    
    // 取消按钮触发事件
    
    //    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
    //        // 搜索内容置空
    //        searchBar.text = ""
    //        self.result = self.array
    //        self.tableView.reloadData()
    //        
    //        self.dismissViewControllerAnimated(true, completion: nil)
    //    }
    
 
    
    func tappedLeft(_ button:UIButton){
        // 搜索内容置空
        searchBar.text = ""
        self.result = self.array
        //self.tableView.reloadData()
        navigationController?.popViewController(animated: true)
        // self.dismiss(animated: true, completion: nil)
    }
    
    func tappedSearch(_ button:UIButton){
        //        var cbutton = String(button.titleForState(.Normal))
        //        print(cbutton)
        var s = String()
        if(button.tag < 200){s=hotsearch[button.tag-100]}
        else {s = historical[button.tag-200]}
        print(s)
        
        //CCCCCCCCCCCCCCCCCCCC3
        let secondView = SearchResultViewController()
        secondView.result = s
        //self.present(secondView, animated: true, completion: nil)
        pushWithoutTab(secondView)
        
        
    }
    
    
    
}

