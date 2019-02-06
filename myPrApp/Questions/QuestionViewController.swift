//
//  QuestionViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/01/07.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit


var questImg:[String?] = []
var userType:String?

//プロトコル追加
class QuestionViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var selectedImg: String?
    
    @IBOutlet weak var questTable: UITableView!
    @IBOutlet weak var sentenceLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("選択されたUserTypeは\(selectedImg)です")
        
        //Japaneseに設定していたら日本文にする
        if settingLang == "Japanese" {
            sentenceLabel.text = "出発前の確認項目です。"
        //Englishに設定していたら英文にする
        } else if settingLang == "English" {
            sentenceLabel.text = "These are confirmation items before departure."
        }

    }
    
    //Table Viewのセルの数を指定
    func tableView(_ table: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        print("@質問設定：\(settingLang)")
        
        //言語設定がJapaneseになっていたら呼び出す
        if settingLang == "Japanese" {
            subQuestionViewController().selectJpn(selectedImg: selectedImg!)
        
        //言語設定がEnglishになっていたら呼び出す
        } else if settingLang == "English" {
            subQuestionViewController().selectEng(selectedImg: selectedImg!)
            
        }
        
            
//            print(subQuestionViewController().questImg.count)
            return questImg.count

    }
    
    //各セルの要素を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell",for: indexPath)
        
        let img = UIImage(named: questImg[indexPath.row]!)
        
//        let img2 = UIImage(named: "trush")
        
        //TODO:ボタンに変更する
        // Tag番号 1 で UIImageView インスタンスの生成1
        let imageView = cell.viewWithTag(1) as! UIButton
        imageView.setImage(img, for: .normal)
        
        
//        // Tag番号 ２ で UIImageView インスタンスの生成2
//        let imageView2 = cell.viewWithTag(2) as! UIImageView
//        imageView2.image = img2
        
        // Tag番号 ３ で UILabel インスタンスの生成
        let textView = cell.viewWithTag(3) as! UITextView
        textView.text = String(describing: labelArray[indexPath.row] as! String)
        
        return cell
    }
    
    // Cell の高さを220にする
    func tableView(_ table: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
    //TODO:削除処理を後で追加
    @IBAction func deleteQuestion(_ sender: UIButton) {
        
        //アラートオブジェクトを作る
        let alert = UIAlertController(title: "削除します", message: "よろしいですか？", preferredStyle: .alert)
        
        //キャンセルが押されたときにCancelを出力して現画面に留まるように設定している
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: {(action: UIAlertAction!) -> Void in print("Cancel")}))
        
        //OKが押されたときにmyMessageの中に書いた処理を実行するように設定している
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in self.deleteQstData()}))
        
        
        //アラート画面を表示する
        present(alert,animated: true)
        
    }
    
    func deleteQstData(){
        print("質問を削除しました")
    }
    
    @IBAction func tapUserTypeOk(_ sender: Any) {
        
        //決定ボタンを押したらUserTypeで選択したものをUserTypeをUserDefaultsに保存する
        UserTypeViewController().saveUserType(str: selectedImg!)
        
        userType = UserTypeViewController().readUserType()
        
    }
    
    
    @IBAction func tapQuestItem(_ sender: UIButton) {
        performSegue(withIdentifier: "showItemCamera",sender: nil)
    }
    
    

}
