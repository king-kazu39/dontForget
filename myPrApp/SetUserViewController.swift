//
//  SetUserViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/01/14.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit

var newUser:String?

class SetUserViewController: UIViewController {

    var selectedImg:String?
    
    @IBOutlet weak var setUserName: UITextField!
    
    @IBOutlet weak var userDem: UIButton!

    @IBOutlet weak var setUserImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        userType = UserTypeViewController().readSetUser()
        
        print(userType)
        
//        setUserImage()
        
        setUserImage.image = UIImage(named: "usertype")
        
    }
    
    
    @IBAction func setNewUser(_ sender: Any) {
        
        newUser = setUserName.text!
        print(newUser)
        
        if newUser == "" {
           alertUser()
            print("入力欄が空です")
        } else if newUser != "" {
            print("ユーザーデータを保存します")
        }
 
    }
    
    //OKが押されたときにTOP画面に遷移するの中に書いた処理を実行するように設定
    func alertUser(){
        
        //アラート画面を表示
        let alert = UIAlertController(title: "ユーザー名が設定されていません", message: "ユーザー名を設定してください。", preferredStyle: .alert)
        
        //OKが押されたときにmyMessageの中に書いた処理を実行するように設定している
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in print("OKが押されました")}))
        
        //アラート画面を表示する
        present(alert,animated: true)
        
    }
    
    
    
    
    
//    func setUserImage(){
//        //UIImageViewのインスタンス作成
//        let imageView = UIImageView()
//
//        //TODO:後で配置を修正する
//        //imageViewの位置とサイズを設定
//        imageView.frame = CGRect(x: self.view.frame.width / 2 - 150, y: self.view.frame.height / 2 - 150, width: 200, height: 200)
//
//        //画像を生成。
//        let image = UIImage(named:"usertype")!
//
//        //生成した画像をimageViewに設定
//        imageView.image = image
//
//        //viewにimageViewをsubViewとして追加
//        self.view.addSubview(imageView)
//    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
