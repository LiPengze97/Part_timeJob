//
//  allDingDan.swift
//  ShiXun
//
//  Created by macbook on 2017/4/25.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit

class allDingDan: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var tableView : UITableView!
    let screenwidth = UIScreen.main.applicationFrame.size.width
    let screenheight = UIScreen.main.applicationFrame.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: screenwidth, height: screenheight))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 20
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "dingdancell")! as! ProductTableViewCell
        
        return cell
    }


}
