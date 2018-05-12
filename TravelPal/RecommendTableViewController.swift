//
//  RecommendTableViewController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/10/12.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class RecommendTableViewController: UITableViewController {
    let typetodo = ["近程游玩","拼车","美食","购物","观影"]
    var closeinfos:[CloseLvbanInfo] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "RecommendTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "recommend")
        self.navigationController?.navigationItem.title = "猜您喜欢"
        self.getClose()
        tableView.tableFooterView = UIView()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getClose(){
        Alamofire.request(Router.getClose).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let value = response.result.value else{
                    log("response.result.value is nil", .error)
                    return
                }
                let json = JSON(value)
                print("📺",json)
                for (_, subJson):(String, JSON) in json["data"] {
                    //Do something you want
                    let a = CloseLvbanInfo.init(json: subJson)
                    self.closeinfos.append(a)
                }
 
                return
            case .failure(let error):
                log(error, .error)
                return
            }
            
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return closeinfos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recommend", for: indexPath) as! RecommendTableViewCell
        cell.closeImage.image = UIImage.init(named: "Bitmap\(indexPath.row%8)")
        cell.closeTitle.text = self.closeinfos[indexPath.row].destination
        cell.closeSubtitle.text = typetodo[Int(self.closeinfos[indexPath.row].type!)!-1]
        cell.closePricetag.text = self.closeinfos[indexPath.row].budget
        // Configure the cell...
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tpd = TravelPalDetailViewController()
        tpd.closeinfo = self.closeinfos[indexPath.row]
        tpd.mark = 0
        self.navigationController?.pushViewController(tpd, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
