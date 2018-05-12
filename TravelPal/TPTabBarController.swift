//
//  TPTabBarController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/6/7.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class TPTabBarController: UITabBarController, OverlayControllerDelegate{
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
        let names = ["bticon_location_off","bticon_find_off","","推荐","bticon_person_off"]
        let selectNames = ["bticon_location_on","bticon_find_on","","推荐","bticon_person_on"
        ]
        //let imgNames = ["伙伴","地图","","推荐",""]
        let itemNames = ["伙伴","旅游","","猜您喜欢","个人中心"]
        let vc1 = TravelPalViewController()
        let vc2 = ViewController()
        let vc3 = empty()
        let vc4 = RecommendTableViewController()
        let vc5 = PersonalViewController()
        let vcs = [vc1,vc2,vc3,vc4,vc5]
        let arr = NSMutableArray()
        for i in 0..<names.count{
            let ctl = vcs[i]
            ctl.navigationItem.title = itemNames[i]
            let navi:UINavigationController = UINavigationController.init(rootViewController: ctl)
            navi.tabBarItem.title = itemNames[i]
            navi.navigationBar.barTintColor = UIColor.init(red: 35/255.0, green: 173/255.0, blue: 130/255.0, alpha: 1)
            navi.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
            navi.navigationBar.tintColor = UIColor.white
            let img = UIImage.init(named: names[i])
            navi.tabBarItem.image = img
            navi.tabBarItem.selectedImage = UIImage.init(named: selectNames[i])
            arr.add(navi)
 
        }
        self.viewControllers = arr as? [UIViewController]
    }
    
 
}
