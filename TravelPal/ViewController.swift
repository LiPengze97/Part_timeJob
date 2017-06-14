//
//  ViewController.swift
//  lvban
//
//  Created by 冼啟棉 on 17/5/4.
//  Copyright © 2017年 冼啟棉. All rights reserved.
//

import UIKit


class ViewController: UIViewController,tableViewDelegate{
    
    var location = String()
    
    var topView = UIView()
    var mainTableView: MaintableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        location = "广州"
        
        var r = CGFloat(29)
        
        self.view.backgroundColor = UIColor(red : 242/255, green : 242/255, blue : 242/255, alpha : 1);
        
        //top view的初始化设置
        var rect3 = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 64)
        topView.frame = rect3
        topView.backgroundColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1);
        
        
        var topButton = UIButton(frame: CGRect(x: 11+2*r, y: 31-3.5, width: 250, height: r))
        topButton.backgroundColor = UIColor(red : 255/255, green : 255/255, blue : 255/255, alpha : 0.2);
        topButton.layer.cornerRadius = 29/2
        topButton.addTarget(self, action: #selector(ViewController.topButtonTap(_:)), for: UIControlEvents.touchUpInside)
        topButton.setTitle("立即搜索您想去的地方", for: UIControlState())
        topButton.titleLabel!.font = UIFont.systemFont(ofSize: 14)
        topButton.titleLabel?.textColor = UIColor.white
        topView.addSubview(topButton)
        
        var rightButton = UIButton(frame:CGRect(x: 250+20+60, y: 31-3.5, width: r, height: r))
        rightButton.backgroundColor = UIColor.white
        rightButton.layer.cornerRadius = r/2
        topView.addSubview(rightButton)
        
        var leftButton = UIButton(frame:CGRect(x: 11, y: 31-3.5, width: 2*r, height: r))
        leftButton.backgroundColor = UIColor(red : 13/255, green : 168/255, blue : 133/255, alpha : 1);
        leftButton.setTitle(location, for: UIControlState())
        leftButton.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        leftButton.titleLabel?.textColor = UIColor.white
        leftButton.addTarget(self, action: #selector(ViewController.leftButtonTap(_:)), for: UIControlEvents.touchUpInside)
        topView.addSubview(leftButton)
        
        
        
        mainTableView = MaintableView(frame: CGRect(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height-64))
        mainTableView.delegate = self
        
        
        self.view.addSubview(topView)
        self.view.addSubview(mainTableView)
        
    }
    
    func topButtonTap(_ _button:UIButton){
        
        let secondView = SearchViewController()
        self.present(secondView, animated: true, completion: nil)
        
    }
    
    func leftButtonTap(_ _button:UIButton){
        
        
        let secondView = SearchViewController()
        secondView.a = location
        self.present(secondView, animated: true, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //maintableview里点击cell的代理方法
    func didSelectCell(_ Section: Int, Row: Int) {
        print("k0")
    }
    func jumpToInformationView(_ title:String){
        print("k1")
        let secondView = InformationViewController()
        secondView.titlek = title
        self.present(secondView, animated: true, completion: nil)
        
    }
    
    
    //maintableview里scrollview用到的代理方法
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("aa")
        //设置rollingEnable为true即可开启自动滚动功能
        mainTableView.loopPage.rollingEnable = true
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        //需要在退出前停止自动滚动,否则会内存泄露

        
        mainTableView.loopPage.rollingEnable = false
    }
    
    
}

