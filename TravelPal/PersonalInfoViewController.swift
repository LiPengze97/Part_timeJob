//
//  PersonalInfoViewController.swift
//  ShiXun
//
//  Created by macbook on 2017/6/9.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PersonalInfoViewController: UIViewController,UITableViewDataSource,UIImagePickerControllerDelegate,UITableViewDelegate,UINavigationControllerDelegate {
    
    var tableview : UITableView!
    var headView : UIView!
    var touxiangBtn : UIButton!
    var username : String!
    var image : UIImage?
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.setTitleVerticalPositionAdjustment(0, for: UIBarMetrics.default)
        username = UserManager.shared.username
        self.tableview.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "个人资料"
        //上部个人头像
        headView = UIView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: 194))
        headView.backgroundColor = kRGBColorFromHex(rgbValue: 0xf2f2f2)
        //根据是否登录显示两种界面
        touxiangBtn = UIButton(frame: CGRect(x: SCREEN_WIDTH/2-44, y: 40, width: 88, height: 88))
        headView.addSubview(touxiangBtn)
        touxiangBtn.contentMode = .scaleAspectFill
        touxiangBtn.layer.borderWidth=2
        touxiangBtn.layer.borderColor = kRGBColorFromHex(rgbValue: 0x656565).cgColor
        //设置遮罩
        touxiangBtn.layer.masksToBounds = true
        //设置圆角半径(宽度的一半)，显示成圆形。
        touxiangBtn.layer.cornerRadius = touxiangBtn.frame.width/2
        touxiangBtn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
        tableview = UITableView(frame: CGRect(x: 0, y: 258, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-194), style: UITableViewStyle.plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.showsHorizontalScrollIndicator = false
        tableview.showsVerticalScrollIndicator = false

        tableview.register(PersonalInfoTableViewCell.self, forCellReuseIdentifier: "personalinfocell")
  
        if UserManager.shared.Image != nil {
            touxiangBtn.setImage(UserManager.shared.Image, for: .normal)
        }
        else{
            touxiangBtn.setImage(UIImage(named: "personal_person"), for: .normal)
        }
        
        self.view.addSubview(headView)
        self.view.addSubview(tableview)
        tableview.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return tits.count
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let secondViewController = modifyViewController()
            secondViewController.tit = "昵称"
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case 1:
            let secondViewController = modifyViewController()
            secondViewController.tit = "所在地"
            self.navigationController?.pushViewController(secondViewController, animated: true)
        default:
            UserManager.shared.userLogOut()
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableview.dequeueReusableCell(withIdentifier: "personalinfocell") as? PersonalInfoTableViewCell
        
        if cell == nil{
            cell = UITableViewCell(style:UITableViewCellStyle.default , reuseIdentifier: "personalinfocell") as? PersonalInfoTableViewCell
        }
        switch indexPath.row {
        case 0:
            let titleString = "昵称：                 "+UserManager.shared.username
            cell?.setupUI(titleString: titleString)
        case 1:
            let titleString = "所在地：             "+UserManager.shared.location
            cell?.setupUI(titleString: titleString)
        default:
            let titleString = "退出登录"
            cell?.setupUI(titleString: titleString)
            cell?.titleLabel?.textAlignment = .center
            
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
 
    //关于上传头像
    func tapped(){
        //从相册中选择还是。。。。
        let actionSheet = UIAlertController(title: "上传头像", message: nil, preferredStyle: .actionSheet)
        let cancelBtn = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        
        let takePhotos = UIAlertAction(title: "拍照", style: .destructive, handler: {
            (action: UIAlertAction) -> Void in
            //判断是否能进行拍照，可以的话打开相机
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
                picker.allowsEditing = true
                self.present(picker, animated: true, completion: nil)
                
            }
            else
            {
                print("无法打开照相机,请在真机中使用");
            }
            
        })
        let selectPhotos = UIAlertAction(title: "从相册中选取", style: .default, handler: {
            (action:UIAlertAction)
            -> Void in
            //调用相册功能，打开相册
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
            
        })
        actionSheet.addAction(cancelBtn)
        actionSheet.addAction(takePhotos)
        actionSheet.addAction(selectPhotos)
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    //选择一张照片的代理方法
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let type: String = (info[UIImagePickerControllerMediaType] as! String)
        
        //当选择的类型是图片
        if type == "public.image"
        {
            
            //修正图片的位置
            let image = self.fixOrientation(aImage: (info[UIImagePickerControllerOriginalImage] as! UIImage))
            //先把图片转成NSData
            let data = UIImageJPEGRepresentation(image, 0.5)
            
            //图片保存的路径
            //这里将图片放在沙盒的documents文件夹中
            
            //Home目录
            let homeDirectory = NSHomeDirectory()
            let documentPath = homeDirectory + "/Documents"
            //文件管理器
            let fileManager: FileManager = FileManager.default
            //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
            do {
                try fileManager.createDirectory(atPath: documentPath, withIntermediateDirectories: true, attributes: nil)
            }
            catch _ {
            }
            fileManager.createFile(atPath: documentPath.appending("/image.png"), contents: data, attributes: nil)
            //得到选择后沙盒中图片的完整路径
            let filePath: String = String(format: "%@%@", documentPath, "/image.png")
            print("filePath:" + filePath)
            UserManager.shared.Image = UIImage(data: data!)
            self.touxiangBtn.setImage(UIImage(data: data!), for: .normal)
            self.image = UIImage(data: data!)
            self.headView.reloadInputViews()
            self.touxiangBtn.reloadInputViews()
            picker.dismiss(animated: true, completion: nil)
            
       
        }
    }
    //修正上传的照片的方向
    func fixOrientation(aImage: UIImage) -> UIImage {
        // No-op if the orientation is already correct
        if aImage.imageOrientation == .up {
            return aImage
        }
        // We need to calculate the proper transformation to make the image upright.
        // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
        var transform: CGAffineTransform = CGAffineTransform.identity
        switch aImage.imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: aImage.size.width, y: aImage.size.height)
            transform = transform.rotated(by: CGFloat(M_PI))
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: aImage.size.width, y: 0)
            transform = transform.rotated(by: CGFloat(M_PI_2))
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: aImage.size.height)
            transform = transform.rotated(by: CGFloat(-M_PI_2))
        default:
            break
        }
        
        switch aImage.imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: aImage.size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: aImage.size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        default:
            break
        }
        
        // Now we draw the underlying CGImage into a new context, applying the transform
        // calculated above.
        
        //这里需要注意下CGImageGetBitmapInfo，它的类型是Int32的，CGImageGetBitmapInfo(aImage.CGImage).rawValue，这样写才不会报错
        let ctx: CGContext = CGContext(data: nil, width: Int(aImage.size.width), height: Int(aImage.size.height), bitsPerComponent: aImage.cgImage!.bitsPerComponent, bytesPerRow: 0, space: aImage.cgImage!.colorSpace!, bitmapInfo: aImage.cgImage!.bitmapInfo.rawValue)!
        ctx.concatenate(transform)
        switch aImage.imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            ctx.draw(aImage.cgImage!, in: CGRect(x:0, y:0, width:aImage.size.height, height:aImage.size.width))
        default:
            ctx.draw(aImage.cgImage!, in: CGRect(x:0, y:0, width:aImage.size.width, height:aImage.size.height))
        }
        
        // And now we just create a new UIImage from the drawing context
        let cgimg: CGImage = ctx.makeImage()!
        let img: UIImage = UIImage(cgImage: cgimg)
        return img
    }
    
   
    
}
