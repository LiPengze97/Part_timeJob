//
//  TravelPalDetailViewController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/4/24.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class TravelPalDetailViewController: UIViewController,UITableViewDelegate,UIGestureRecognizerDelegate {//记得加datasoure
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.isToolbarHidden = false
        self.view.backgroundColor = UIColor.white
        setToolbar()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableView Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func setToolbar(){
//        self.navigationController?.setToolbarHidden(false, animated: true)
//        self.navigationController?.toolbar.barStyle = .default
        let ctBtn = UIButton.init(frame: CGRect.init(x: SCREEN_WIDTH * 256.0/483, y: SCREEN_HEIGHT-48, width: SCREEN_WIDTH * 227.0/483, height: 48))
        ctBtn.setImage(#imageLiteral(resourceName: "contactBtn"), for: .normal)
        let coBtn = UIButton.init(frame: CGRect.init(x: SCREEN_WIDTH * 128.0/483, y: SCREEN_HEIGHT-48, width: SCREEN_WIDTH * 128.0/483, height: 48))
        coBtn.setImage(#imageLiteral(resourceName: "collectBtn"), for: .normal)
        let frBtn = UIButton.init(frame: CGRect.init(x: 0, y: SCREEN_HEIGHT-48, width: SCREEN_WIDTH * 128.0/483, height: 48))
        frBtn.setImage(#imageLiteral(resourceName: "friendsBtn"), for: .normal)
        self.view.addSubview(ctBtn)
        self.view.addSubview(coBtn)
        self.view.addSubview(frBtn)
//        let contactBtn = UIBarButtonItem.init(image: #imageLiteral(resourceName: "contactBtn"), style: .done, target: self, action: nil)//联系
//        let collectBtn = UIBarButtonItem.init(image: #imageLiteral(resourceName: "collectBtn"), style: .done, target: self, action: nil) //收藏
//        let friendsBtn = UIBarButtonItem.init(image: #imageLiteral(resourceName: "friendsBtn"), style: .done, target: self, action: nil)//加好友
//        contactBtn.title = "联系Ta"
//        contactBtn.tintColor = UIColor.init(red: 30/255.0, green: 168/255.0, blue: 134/255.0, alpha: 1)
        
//        collectBtn.title = "收藏"
//        collectBtn.tintColor = UIColor.init(red: 30/255.0, green: 168/255.0, blue: 134/255.0, alpha: 0.8)
        
//        friendsBtn.title = "加好友"
//        friendsBtn.tintColor = UIColor.init(red: 30/255.0, green: 168/255.0, blue: 134/255.0, alpha: 0.6)
        
//        let flexibleSpace = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
//        let btnarr:[UIBarButtonItem] = [friendsBtn,collectBtn,contactBtn]
//        self.toolbarItems = btnarr
        
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
