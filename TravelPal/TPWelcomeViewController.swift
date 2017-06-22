//
//  TPWelcomeViewController.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/6/22.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class TPWelcomeViewController: UIViewController,UIScrollViewDelegate {

    //闭包属性 用于跳转页面
    var startClosure: (() ->Void)?
    //创建scorllView
    let scrollView = UIScrollView()
    //创建pageController
    let pageControl = UIPageControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSize.init(width: SCREEN_WIDTH*4, height: SCREEN_HEIGHT)
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        
        pageControl.center = CGPoint.init(x: SCREEN_WIDTH/2, y: SCREEN_HEIGHT - 50)
        pageControl.pageIndicatorTintColor = UIColor.init(red: 35/255.0, green: 173/255.0, blue: 130/255.0, alpha: 1)
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.numberOfPages = 4
        pageControl.addTarget(self, action: #selector(TPWelcomeViewController.scrollViewDidEndDecelerating), for: .valueChanged)
        //添加背景图片
        for i in 0..<3 {
            let image = UIImage(named: "\(i+1)")
            let imageView = UIImageView.init(frame: self.view.frame)
            imageView.image = image
            var frame = imageView.frame
            frame.origin.x = CGFloat(i)*SCREEN_WIDTH
            imageView.frame = frame
            if i == 3{
                let btn = UIButton.init(frame: CGRect.init(x: self.view.frame.width/2 - 60, y: self.view.frame.height/2 + 100, width: 120, height: 40))
                btn.layer.cornerRadius = 10
                btn.backgroundColor = UIColor.green
                btn.setTitle("进人", for: .normal)
                btn.setTitleColor(UIColor.white, for: .normal)
                btn.setTitleColor(UIColor.red, for: .highlighted)
                btn.addTarget(self, action: #selector(TPWelcomeViewController.startAction), for: .touchUpInside)
                imageView.addSubview(btn)
                imageView.isUserInteractionEnabled = true
            }
            scrollView.addSubview(imageView)
        }
        
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)
        // Do any additional setup after loading the view.
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //index
        let index = scrollView.contentOffset.x/SCREEN_WIDTH
        //current
        pageControl.currentPage = Int(index)
        self.view.addSubview(pageControl)
    }
    
    func startAction(sender:UIButton){
        startClosure!()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
