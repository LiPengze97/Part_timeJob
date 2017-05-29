//
//  TPPosterTableViewController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/21.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit
//本类为发布寻找旅伴的页面
class TPPosterTableViewController: UITableViewController,AMapLocationManagerDelegate,UITextViewDelegate,UITextFieldDelegate {
    //发布按钮
    @IBOutlet weak var postBtn: UIButton!
    //所有的Textfield
    @IBOutlet weak var fromText: UITextField!
    @IBOutlet weak var destText: UITextField!
    @IBOutlet weak var deptTimeText: UITextField!
    @IBOutlet weak var backTimeText: UITextField!
    @IBOutlet weak var havePeopleText: UITextField!
    @IBOutlet weak var planPeopleText: UITextField!
    @IBOutlet weak var budgetText: UITextField!
    @IBOutlet weak var transportationText: UITextField!
    @IBOutlet weak var userLoactionText: UITextField!
    
    //Textview及其上面的label
    @IBOutlet weak var textviewLabel: UILabel!
    @IBOutlet weak var detailText: UITextView!
    //datePicker日期选择器
    var datePicker = UIDatePicker.init()
    
    
    var locationManager:AMapLocationManager? = nil
    let keys = ["简要信息","详细信息","位置信息"]
    override func viewDidLoad() {
        super.viewDidLoad()
        detailText.delegate = self
        datePicker.datePickerMode = .dateAndTime
        datePicker.minuteInterval = 1
        datePicker.tag = 1
        deptTimeText.tag = 2
        backTimeText.tag = 3
        datePicker.addTarget(self, action: #selector(TPPosterTableViewController.setTime), for: .valueChanged)
        deptTimeText.delegate = self
        backTimeText.delegate = self
        setLocation()
        tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        tableView.separatorStyle = .none
        postBtn.layer.cornerRadius = 10
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTime(datePicker:UIDatePicker){
        let dateformat = DateFormatter.init()
        let date = datePicker.date
        dateformat.dateFormat = "yyyy-MM-dd HH:mm"
        let str = dateformat.string(from: date)
        
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
    
    func resignResponder(){
        budgetText.resignFirstResponder()
        fromText.resignFirstResponder()
        destText.resignFirstResponder()
        havePeopleText.resignFirstResponder()
        planPeopleText.resignFirstResponder()
        budgetText.resignFirstResponder()
        transportationText.resignFirstResponder()
        userLoactionText.resignFirstResponder()
    }
    
    //MARK:TablviewDelegate
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20))
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
            myView.addSubview(label)}
        
        
        
        return myView
        
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    //MARK: TextviewDelegate
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == ""{
            textviewLabel.isHidden = false
        }else{
            textviewLabel.isHidden = true
        }
        
        if text == "\n" {
            return false
        }
        return true
    }
    //MARK:TextfileDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField.tag != 2 || textField.tag != 3){
            if (self.datePicker.superview != nil){
                self.datePicker.removeFromSuperview()
                }
            return true
        }
        
        if self.datePicker.superview == nil{
            self.resignFirstResponder()
            
            //动画展示需要
            self.datePicker.frame = CGRect.init(x: 0, y: SCREEN_HEIGHT, width: SCREEN_WIDTH, height: 216)
            self.view.addSubview(datePicker)
            
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationCurve(.easeOut)
            self.datePicker.bottom -= self.datePicker.height
            UIView.commitAnimations()
        }
        return true
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