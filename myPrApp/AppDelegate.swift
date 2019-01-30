//
//  AppDelegate.swift
//  myPrApp
//
//  Created by 仲里和也 on 2018/12/30.
//  Copyright © 2018 Kazuya Nakazato. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let center = UNUserNotificationCenter.current()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //アプリのアラート通知を許可するかどうかを書くところ
        application.registerUserNotificationSettings(UIUserNotificationSettings(types: [UIUserNotificationType.sound,UIUserNotificationType.alert,UIUserNotificationType.badge], categories: nil))
        
        //delegateを設定
        center.delegate = self as? UNUserNotificationCenterDelegate
        
        sleep(2) //launchimageの表示時間を２秒に変更
        return true
    }

    //アプリがバックグラウンドに移行した時に呼ばれる関数。
    func applicationWillResignActive(_ application: UIApplication) {
        
        //通知を送る日時の設定
        var dateComponents = DateComponents()
        
        //TODO:設定した時間に通知できるようにしたい
        //dateComponents.hour = setDepDate
        dateComponents.hour = 10 //10時に通知が来るように設定
        print(dateComponents)
        
        //trueで設定した時間がくるたびに通知。falseは１回のみ
        let calenderTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats:true)
        
        //通知の内容について
        let content = UNMutableNotificationContent()
        //TODO：英語対応の条件分岐を後で用意
        content.title = "" //通知タイトル
        content.subtitle = "出発通知" //通知サブタイトル
        content.body = "出発時間になりました。出発の準備をしましょう！" //通知内容詳細
        
        //画像について
        if let path = Bundle.main.path(forResource:"Don't Forget!",ofType:"png"){
            content.attachments = [try! UNNotificationAttachment(identifier: "ID", url: URL(fileURLWithPath: path), options: nil)]
        }
        
        let calenderRequest = UNNotificationRequest(identifier: "alert", content: content, trigger: calenderTrigger)
        
        center.add(calenderRequest, withCompletionHandler: nil)
        
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "myPrApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
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
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

