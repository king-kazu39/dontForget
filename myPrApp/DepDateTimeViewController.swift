//
//  DepDateTimeViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/01/09.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit

class DepDateTimeViewController: UIViewController {

    @IBOutlet weak var depTime: UIDatePicker!
    
    
    let lang = LangViewController().readLang()
    let user = UserTypeViewController().readUserType()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(lang)
        print(user)
        
        
    }
    
    //TODO:出発時刻を設定して決定ボタンを押したらDBに登録する
    @IBAction func changeDate(_ sender: UIDatePicker) {
        
        print(sender)
        
        let df = DateFormatter() //書式を指定する定数
        df.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        
        //この書式を使って、日付型から文字列型に変換
        var strDate:String = df.string(from: sender.date)
        
        print(strDate)
        
        
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
        
        //アラート画面を
        let alert = UIAlertController(title: "設定が完了しました", message: "TOPに戻ります。よろしいですか？", preferredStyle: .alert)
        
        //OKが押されたときにmyMessageの中に書いた処理を実行するように設定している
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in self.myMoveTOP()}))
        
        //アラート画面を表示する
        present(alert,animated: true)
        
    }
    
    func myMoveTOP(){
        print("TOPに戻ります")
        
        if lang != nil && user != nil {
            //settingLangにJapaneseかEnglishがあれば次画面に遷移する
            self.performSegue(withIdentifier: "showTop", sender: nil)
        }
        
        
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
