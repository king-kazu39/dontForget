//
//  LangViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2018/12/30.
//  Copyright © 2018 Kazuya Nakazato. All rights reserved.
//

import UIKit
//UserDefaultsのインスタンス化
//別クラスでも使えるようにするためにクラス外でインスタンス化する
let userDefaults = UserDefaults.standard

//言語設定をするために使うメンバ変数用意
var settingLang:String?

class LangViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // UserDefaultsのデフォルト値
        userDefaults.register(defaults: ["DataStore": "default"])
        
        //UIImageViewのインスタンス作成
        let imageView = UIImageView()
        
        //TODO:後で配置を修正する
        //imageViewの位置とサイズを設定
        imageView.frame = CGRect(x: self.view.frame.width / 2 - 150, y: self.view.frame.height / 2 - 150, width: 200, height: 200)
        
        //画像を生成。
        let image = UIImage(named:"Langage.png")!
        
        //生成した画像をimageViewに設定
        imageView.image = image
        
        //viewにimageViewをsubViewとして追加
        self.view.addSubview(imageView)
        
    }
    
    
    @IBAction func tapJpn(_ sender: Any) {
        
        //アクションシートオブジェクトを生成
        let actionSheet = UIAlertController(title: "使用する言語を決めましょう", message: "この言語に設定しますか？", preferredStyle: .actionSheet)
        
        //アクションボタン１を追加
        actionSheet.addAction(UIAlertAction(title: "Change to Japanese", style: .default, handler: {action in self.normalA(language:"Japanese")}))
        
        //キャンセルボタンを追加
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in self.normalA(language:"Cancel")}))
        
        //アクションシートを表示する
        present(actionSheet,animated: true)
        
    }
    

    @IBAction func tapEng(_ sender: Any) {
        
        //アクションシートオブジェクトを生成
        let actionSheet = UIAlertController(title: "使用する言語を決めましょう", message: "この言語に設定しますか？", preferredStyle: .actionSheet)
        
        //アクションボタン１を追加
        actionSheet.addAction(UIAlertAction(title: "Change to English", style: .default, handler: {action in self.normalA(language:"English")}))
        
        //キャンセルボタンを追加
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in self.normalA(language:"Cancel")}))
        
        //アクションシートを表示する
        present(actionSheet,animated: true)
    
    
    }
    
    
    func normalA (language:String) {
        
        settingLang = language
        print("\(settingLang)")
        
        if settingLang == "Japanese" || settingLang == "English" {
         
            //値を保存するためのメソッドを呼び出す
            saveLang(str: settingLang!)
            
            //settingLangにJapaneseかEnglishがあれば次画面に遷移する
            self.performSegue(withIdentifier: "showUserType", sender: nil)
            
        }
        
    }
    
    func saveLang(str: String){
        // Keyを指定して保存
        userDefaults.set(str, forKey: "language")
        // データの同期
        userDefaults.synchronize()
        
    }
    
    func readLang() -> String {
        // Keyを指定して読み込み
        let str: String = userDefaults.object(forKey: "language") as! String
        
        return str
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
