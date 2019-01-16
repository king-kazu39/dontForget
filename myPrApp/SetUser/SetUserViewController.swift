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
        
        setUserImage.image = UIImage(named: "usertype")
        
    }
    
    
    @IBAction func setNewUser(_ sender: Any) {
        
        newUser = setUserName.text
        print(newUser)
        
        if newUser == "" {
           alertUser()
            print("入力欄が空です")
        } else if newUser != "" {
            print("ユーザーデータを保存します")
            
            confirmUserType()
            
        }
 
    }
    
    //ユーザータイプ名がだった時に出すアラート（バリデーション）
    func alertUser(){
        
        //アラート画面を表示
        let alert = UIAlertController(title: "ユーザー名が設定されていません", message: "ユーザー名を設定してください。", preferredStyle: .alert)
        
        //OKが押されたときにmyMessageの中に書いた処理を実行するように設定している
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in print("OKが押されました")}))
        
        //アラート画面を表示する
        present(alert,animated: true)
        
    }
    
    //OKボタンが押された時に発動する
    func confirmUserType() {
        
        //アラートオブジェクトを作る
        let alert = UIAlertController(title: "ユーザー名を設定します", message: "よろしいですか？", preferredStyle: .alert)
        
        //キャンセルが押されたときにCancelを出力して現画面に留まるように設定している
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: {(action: UIAlertAction!) -> Void in print("Cancel")}))
        
        //OKが押されたときにmyMessageの中に書いた処理を実行するように設定している
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in self.returnUser()}))
        
        
        //アラート画面を表示する
        present(alert,animated: true)
        
    }
    
    
    func returnUser(){
        
        //TODO:新規ユーザタイプをDBに登録するコードを後で追加する
        
        // ViewControllerへ戻るために Segue を呼び出す
        performSegue(withIdentifier: "returnUserType",sender: nil)
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
