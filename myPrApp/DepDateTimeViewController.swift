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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    
    //TODO：決定ボタンを押した時に「設定完了しました」のアクションシートを表示する。また「TOPに戻る」もボタンを押すと設定TOP画面に遷移する
    
    //決定ボタンが押された時に発動する
    @IBAction func tapDtm(_ sender: Any) {
    
        //アラートオブジェクトを作る
        let alert = UIAlertController(title: "TOPに戻ります", message: "よろしいですか？", preferredStyle: .alert)
        
        //OKが押されたときにmyMessageの中に書いた処理を実行するように設定している
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in self.myMessage()}))
        
        present(alert,animated: true)
        
    
    }
    
    func myMessage(){
        print("OK押されました")
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
