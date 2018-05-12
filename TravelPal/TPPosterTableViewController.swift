//
//  TPPosterTableViewController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/21.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import MBProgressHUD
import Alamofire

//本类为发布寻找旅伴的页面
class TPPosterTableViewController: UITableViewController,AMapLocationManagerDelegate,UITextViewDelegate,UITextFieldDelegate {
    //发布按钮
    @IBOutlet weak var postBtn: UIButton!
    //取消按钮
    @IBOutlet weak var cancelBtn: UIButton!
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
    
    //参数
    
    var parameters: Parameters = [
        "userId":"17864154582",
        "departure":"",
        "destination":"",
        "planPeople":0,
        "departureTime":"",
        "returnTime":"",
        "budget":"",
        "transportation":"",
        "detailed":"",
        "longitude":"",
        "latitude":""
    ]

    
    //datePicker日期选择器
    var datePicker = UIDatePicker.init()
    
    var selectedIndex:Int?
    
    let transArr = ["飞机","火车/高铁","大巴","自驾","轮船","步行"]
    
    var locationManager:AMapLocationManager? = nil
    let keys = ["简要信息","详细信息","位置信息"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFields()
        setLocation()
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
        cancelBtn.layer.cornerRadius = 10
        
    }
 
    
    //MARK:初始化页面需要的方法
    
    func setTextFields(){
        self.fromText.tag = 0
        self.destText.tag = 1
        self.deptTimeText.tag = 2
        self.backTimeText.tag = 3
        self.havePeopleText.tag = 4
        self.planPeopleText.tag = 5
        self.budgetText.tag = 6
        self.transportationText.tag = 7
        self.userLoactionText.tag = 8
        
        self.planPeopleText.keyboardType = .numberPad
        self.havePeopleText.keyboardType = .numberPad
        self.budgetText.keyboardType = .numberPad
        
        self.fromText.delegate = self
        self.destText.delegate = self
        self.deptTimeText.delegate = self
        self.backTimeText.delegate = self
        self.havePeopleText.delegate = self
        self.planPeopleText.delegate = self
        self.budgetText.delegate = self
        self.transportationText.delegate = self
        self.userLoactionText.delegate = self
        
    }
    
    func setTime(datePicker:UIDatePicker){
//        let dateformat = DateFormatter.init()
//        let date = datePicker.date
//        dateformat.dateFormat = "yyyy-MM-dd HH:mm"
//        let str = dateformat.string(from: date)
        
    }
    
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
                self?.parameters["longitude"] = location.coordinate.longitude.description
                self?.parameters["latitude"] = location.coordinate.latitude.description
            }
            
            if let reGeocode = reGeocode {
                NSLog("🐥reGeocode:%@", reGeocode)
                self?.userLoactionText.text = reGeocode.aoiName
                self?.parameters["departure"] = self?.userLoactionText.text
                self?.fromText.text = reGeocode.aoiName
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
            myView.addSubview(label)
        }
        
        
        
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
        self.parameters["detailed"] = textView.text
        if text == "\n" {
            return false
        }
        return true
    }
    //MARK:TextfileDelegate

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        resignResponder()
        self.view.endEditing(true)
        return true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        resignResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
  
        case 0:
            parameters["departure"] = textField.text
        case 1:
            parameters["destination"] = textField.text
        case 2:
            parameters["departureTime"] = textField.text
        case 3:
            parameters["returnTime"] = textField.text
        case 4:
            return
        case 5:
            parameters["planPeople"] = textField.text
        case 6:
            parameters["budget"] = textField.text
        case 7:
            parameters["transportation"] = textField.text
        case 8:
            return
        default:
            return
        }
    }
    

    
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
    @IBAction func cancelBtnTapped(_ sender: Any) {
        self.dismiss(animated: true) { 
            //TODO: 加HUD
        }
    }
    
    @IBAction func postBtnTapped(_ sender: Any) {
        self.detailText.resignFirstResponder()
        print(parameters)
        self.parameters["departure"] = self.userLoactionText.text
        UserManager.shared.postTour(para: parameters)
        self.dismiss(animated: true, completion: nil)
    }
    //MARK: -Textfield弹出事件
    
    @IBAction func selectTrans(_ sender: Any) {
        
        ActionSheetStringPicker.show(withTitle: "选择交通方式", rows: self.transArr, initialSelection: 1, doneBlock: {
            picker, index, value in
            self.transportationText.text = value as! String
            self.parameters["transportation"] = self.transportationText.text
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: sender)
    }
    @IBAction func selectDepature(_ sender: Any) {
        let w = WSDatePickerView.init(dateStyle: .init(0)) { (startDate) in
            print(startDate!)
            let dateformat = DateFormatter()
            dateformat.dateFormat = "YYYY-MM-dd HH:mm"
            let str = dateformat.string(from: startDate!)
            self.deptTimeText.text = str
            self.parameters["departureTime"] = str
        }
        w?.doneButtonColor = UIColor.orange
        w?.show()
    }
    
    @IBAction func selectBack(_ sender: Any) {
        let w = WSDatePickerView.init(dateStyle: .init(0)) { (startDate) in
            print(startDate!)
            let dateformat = DateFormatter()
            dateformat.dateFormat = "YYYY-MM-dd HH:mm"
            let str = dateformat.string(from: startDate!)
            self.backTimeText.text = str
            self.parameters["returnTime"] = str
        }
        w?.doneButtonColor = UIColor.orange
        w?.show()

    }
    
    func transSelected(selectedIndex:NSNumber, element:Any){
        self.selectedIndex = selectedIndex.intValue
        
        self.transportationText.text = transArr[selectedIndex.intValue]
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
