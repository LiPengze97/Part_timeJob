//
//  TPPoster2TableViewController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/30.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class TPPoster2TableViewController: UITableViewController,AMapLocationManagerDelegate {
    //取消
    @IBOutlet weak var cancelBtn: UIButton!
    //发布
    @IBOutlet weak var postBtn: UIButton!
    //Textfields
    @IBOutlet weak var destText: UITextField!
    @IBOutlet weak var purposeText: UITextField!
    @IBOutlet weak var planPeopleText: UITextField!
    @IBOutlet weak var deptTimeText: UITextField!
    var locationManager:AMapLocationManager? = nil
    let purposeArr = ["进程游玩","拼车","看电影","约饭","跑腿"]
    
    @IBOutlet weak var userLoactionText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelBtn.layer.cornerRadius = 10
        postBtn.layer.cornerRadius = 10
        self.tableView.separatorStyle = .none
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 4
        }else if section == 1{
            return 1
        }else{
            return 1
        }

    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20))
        let keys = ["简要信息","详细信息","位置信息"]

        if section != 3{
            
            myView.backgroundColor = UIColor.init(white: 0.950, alpha: 0.7)
            
            let view = UIView.init(frame: CGRect.init(x: 4, y: 10, width: 20, height: 20))
            view.backgroundColor = UIColor.init(red: 35/255.0, green: 173/255.0, blue: 130/255.0, alpha: 1)
            myView.addSubview(view)
            
            let label = UILabel.init(frame: CGRect.init(x: 30, y: 9, width: 200, height: 22))
            label.textColor = UIColor.init(white: 0.5, alpha: 1.0)
            label.backgroundColor = UIColor.clear
            label.font = UIFont.systemFont(ofSize: 18)
            label.text = keys[section]
            myView.addSubview(label)
        }
        
        
        
        return myView    }

    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        self.dismiss(animated: true) { 
            //TODO:加HUD
        }
    }

    
    @IBAction func deptSelect(_ sender: Any) {
        let w = WSDatePickerView.init(dateStyle: .init(0)) { (startDate) in
            print(startDate!)
            let dateformat = DateFormatter()
            dateformat.dateFormat = "YYYY-MM-dd HH:mm"
            let str = dateformat.string(from: startDate!)
            self.deptTimeText.text = str
        }
        w?.doneButtonColor = UIColor.orange
        w?.show()
    }
    
    @IBAction func purposeSelect(_ sender: Any) {
        ActionSheetStringPicker.show(withTitle: "选择交通方式", rows: self.purposeArr, initialSelection: 1, doneBlock: {
            picker, index, value in
            self.purposeText.text = value as! String
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    //MARK:初始化页面需要的方法
    func setLocation(){
        locationManager = AMapLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager?.locationTimeout = 2
        locationManager?.reGeocodeTimeout = 2
        locationManager?.requestLocation(withReGeocode: true, completionBlock: {[weak self] (location: CLLocation?, reGeocode: AMapLocationReGeocode?, error: Error?) in
            if let error = error {
                let error = error as NSError
                
                if error.code == AMapLocationErrorCode.locateFailed.rawValue {
                    //定位错误：此时location和regeocode没有返回值，不进行annotation的添加
                    NSLog("定位错误:{\(error.code) - \(error.localizedDescription)};")
                    return
                }
                else if error.code == AMapLocationErrorCode.reGeocodeFailed.rawValue
                    || error.code == AMapLocationErrorCode.timeOut.rawValue
                    || error.code == AMapLocationErrorCode.cannotFindHost.rawValue
                    || error.code == AMapLocationErrorCode.badURL.rawValue
                    || error.code == AMapLocationErrorCode.notConnectedToInternet.rawValue
                    || error.code == AMapLocationErrorCode.cannotConnectToHost.rawValue {
                    
                    //逆地理错误：在带逆地理的单次定位中，逆地理过程可能发生错误，此时location有返回值，regeocode无返回值，进行annotation的添加
                    NSLog("逆地理错误:{\(error.code) - \(error.localizedDescription)};")
                }
                else {
                    //没有错误：location有返回值，regeocode是否有返回值取决于是否进行逆地理操作，进行annotation的添加
                }
            }
            
            if let location = location {
                NSLog("🐶location:%@", location)
            }
            
            if let reGeocode = reGeocode {
                NSLog("🐥reGeocode:%@", reGeocode)
                self?.userLoactionText.text = reGeocode.aoiName
                
            }
        })
    }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
