//
//  DepDateTimeViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/01/09.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit

var setDepDate:String?

class DepDateTimeViewController: UIViewController {

    @IBOutlet weak var depTime: UIDatePicker!
    
    @IBOutlet weak var sentenceLabel: UITextView!
    
    let jpnSentence = "出発時間を設定しましょう！"
    let engSentence = "Let's set the departure time!"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("@出発時間設定:\(settingLang)")
        print("@出発時間設定:\(userType)")
        
        //Japaneseに設定していたら日本文にする
        if settingLang == "Japanese" {
            sentenceLabel.text = jpnSentence
            //Englishに設定していたら英文にする
        } else if settingLang == "English" {
            sentenceLabel.text = engSentence
        }
        
        
    }
    
    //TODO:出発時刻を設定して決定ボタンを押したらDBに登録する
    @IBAction func changeDate(_ sender: UIDatePicker) {
        
        print(sender)
        
        let df = DateFormatter() //書式を指定する定数
        df.dateFormat = "HH:mm"
        
        //この書式を使って、日付型から文字列型に変換
        var strDate:String = df.string(from: sender.date)
        
        setDepDate = strDate
        
        print("setDepDateの中身：\(setDepDate)")
        print("datePickerで設定した値：\(sender.date)")

    }
    
    
    //OKボタンが押された時に発動する
    @IBAction func tapDtm(_ sender: Any) {
    
        //アラートオブジェクトを作る
        let alert = UIAlertController(title: "出発時間を設定します", message: "よろしいですか？", preferredStyle: .alert)
        
        //キャンセルが押されたときにCancelを出力して現画面に留まるように設定している
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: {(action: UIAlertAction!) -> Void in print("Cancel")}))
    
        //OKが押されたときにmyMessageの中に書いた処理を実行するように設定している
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in self.myMessage()}))
        
        
        //アラート画面を表示する
        present(alert,animated: true)
        
    
    }
    
    //OKが押されたときにTOP画面に遷移するの中に書いた処理を実行するように設定
    func myMessage(){
        print("OK押されました")
        
        //アラート画面を表示
        let alert = UIAlertController(title: "設定が完了しました", message: "TOPに戻ります。よろしいですか？", preferredStyle: .alert)
        
        //OKが押されたときにmyMessageの中に書いた処理を実行するように設定している
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in self.myMoveTop()}))
        
        //アラート画面を表示する
        present(alert,animated: true)
        
        
    }
    
    func myMoveTop(){
        print("TOPに戻ります")
        
        if settingLang != nil && userType != nil {
            //settingLangにJapaneseかEnglishがあれば次画面に遷移する
            self.performSegue(withIdentifier: "showTop", sender: nil)
            saveDepData(str: setDepDate!)
        }
        
    }
    
    
    func saveDepData (str: String){
        // Keyを指定して保存
        userDefaults.set(str, forKey: "DepData")
        // データの同期
        userDefaults.synchronize()
        
        // AppDelegate使えるようにする
        let delegate = UIApplication.shared.delegate as? AppDelegate
        // TODO: AppDelegateに追加したsetNotificationを呼び出す
        delegate?.setNotification(at: depTime.date)
    }
    
    func readDepData() -> String {
        // Keyを指定して読み込み
        let str: String = userDefaults.object(forKey: "DepData") as! String
        
        return str
    }
    
    
}
