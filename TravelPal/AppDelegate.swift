//
//  AppDelegate.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/4/24.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RCIMUserInfoDataSource {

    var window: UIWindow?
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
 
        let started = UserDefaults.standard.value(forKey: "started") as? String
        if started == nil {
            UserDefaults.standard.setValue("start", forKey: "started")
            UserDefaults.standard.synchronize()
            self.window?.rootViewController = TPWelcomeViewController()
        } else {
            self.window?.rootViewController = TPTabBarController()
        }
        
        AMapServices.shared().apiKey = "30e945acb2834ca1fb6e8de43ffefa4b"
        //网易云信
        RCIM.shared().initWithAppKey("8w7jv4qb78a3y")
        RCIM.shared().globalMessageAvatarStyle = RCUserAvatarStyle.USER_AVATAR_CYCLE
        RCIM.shared().globalConversationAvatarStyle = RCUserAvatarStyle.USER_AVATAR_CYCLE
 
        UserManager.shared.logInWithLastTimeInfo()
    
        return true
    }
 
 
    func applicationWillTerminate(_ application: UIApplication) {
        
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "TravelPal")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
              
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
              
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - RCIMDataSource
    
    func getUserInfo(withUserId userId: String!, completion: ((RCUserInfo?) -> Void)!) {
        if userId == "13605361772" {
            let user = RCUserInfo.init(userId: userId, name: "思敏", portrait: "http://img1.skqkw.cn:888/2014/12/06/08/iuzjpt23kob-62870.jpg")
            return completion(user)
        }
        else if userId == "17864154582"{
            let user = RCUserInfo.init(userId: userId, name: "李若水", portrait: "http://img1.skqkw.cn:888/2014/12/06/08/21ofdtyslqn-62877.jpg")
            return completion(user)
        }
        return completion(nil)
        
    }

}

