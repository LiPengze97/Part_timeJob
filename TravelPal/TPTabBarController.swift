//
//  TPTabBarController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/6/7.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class TPTabBarController: UITabBarController,OverlayControllerDelegate{
    var btn:UIButton?
    var stb:UIStoryboard?

    private var overlayController : OverlayController!
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        setTabbar()
        self.stb = UIStoryboard.init(name: "Main", bundle: nil)
        self.tabBar.tintColor = UIColor.init(red: 13.0/255, green: 168.0/255, blue: 134.0/255, alpha: 1)
        btn = UIButton.init(frame: CGRect.init(x: SCREEN_WIDTH/5*2+12, y: 0, width: 49, height: 49))
        btn?.setImage(UIImage.init(named: "add"), for: .normal)
        btn?.addTarget(self, action: #selector(TPTabBarController.tanchu), for: .touchUpInside)
        self.tabBar.addSubview(btn!)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tanchu(){
        let array = [
            "远途旅伴", "近程游玩","取消"
        ]
        let size = CGSize(width: 80, height: 100)
        let sheetView = sheetFast(itemSize: size, hasClose: true, items: array, prefixName: "")
        sheetView.height += 45;
        
        overlayController = OverlayController(aView: sheetView, overlayStyle: .BlackTranslucent)
        overlayController.presentationStyle = .Bottom
        overlayController.isAllowDrag = true
        overlayController.isUsingElastic = true
        overlayController.delegate = self;
        overlayController.present(animated: true)
    }
    
    func sheetFast(itemSize: CGSize, hasClose: Bool, items array: Array<String>, prefixName: String) -> TPFabuView {
        var items: [BannerItem] = []
        for (_, name) in array.enumerated() {
            let item = BannerItem()
            item.title = name
            if let img = UIImage(named: prefixName.appending(name)) { item.image = img }
            items.append(item)
        }
        let sheet = TPFabuView()
        sheet.width = UIScreen.width
        sheet.items = items
        sheet.close.isHidden = hasClose
        sheet.bannerTouchClosure = {(anyObj: Any, index: Int) -> Void in
            let sheetView = anyObj as! TPFabuView
            print(index)
            if index == 0 {
                let dest = self.stb?.instantiateViewController(withIdentifier: "yuantu")
                self.present(dest!, animated: true, completion: nil)
                self.overlayController.dismiss(animated: true)
            }else if index == 1{
                let dest = self.stb?.instantiateViewController(withIdentifier: "jincheng")
                self.present(dest!, animated: true, completion: nil)
                self.overlayController.dismiss(animated: true)
            }else{
                self.overlayController.dismiss(animated: true)
            }
            if let text = sheetView.bannerViews[index].label.text { print(text) }
            
        }
        return sheet
    }

    func setTabbar(){
        let names = ["旅伴","出行","","消息","个人中心"]
        let imgNames = ["伙伴","地图","","消息","个人中心"]
        let vc1 = TravelPalViewController()
        let vc2 = ViewController()
        let vc3 = empty()
        let vc4 = IMListViewController()
        let vc5 = PersonalViewController()
        let vcs = [vc1,vc2,vc3,vc4,vc5]
        let arr:NSMutableArray = NSMutableArray.init()
        for i in 0..<names.count{
            let ctl = vcs[i]
            let navi:UINavigationController = UINavigationController.init(rootViewController: ctl)
            if i == 4 {
//                navi.navigationBar.frame = CGRect(x: 0, y: 20, width: SCREEN_WIDTH, height: 44)
//                navi.navigationBar.setTitleVerticalPositionAdjustment(-40, for: UIBarMetrics.default)
            }
            ctl.navigationItem.title = names[i]
            navi.tabBarItem.title = names[i]
            
            arr.add(navi)
            
            let img = UIImage.init(named: imgNames[i])
            navi.tabBarItem.image = img
        }
        self.viewControllers = arr as! [UIViewController]
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
