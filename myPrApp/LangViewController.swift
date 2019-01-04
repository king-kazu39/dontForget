//
//  LangViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2018/12/30.
//  Copyright © 2018 Kazuya Nakazato. All rights reserved.
//

import UIKit

class LangViewController: UIViewController {
    
    //メンバ変数を用意
    //次画面に値を渡す時に使う
    var settingLang:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
    
    //アクションボタンを押した時に発動する
    func normalA (language:String) {
            print("\(language)")
        
        //メンバ変数にアクションボタンの値を入れる
        settingLang = language
        
        //JapaneseかEnglishに言語設定をしていたら（ボタンを押したら）次画面に遷移する
        if settingLang == "Japanese" || settingLang == "English" {
         self.performSegue(withIdentifier: "showUserType", sender: nil)
        }
        
    }
    
    //セグエを通って移動するとき発動
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let scVC = segue.destination as! UserTypeViewController
        
        //UserTypeViewControllerに宣言したlabelプロパティにアクションボタンを入れた時に入った値を格納する
        //次画面に渡すための準備
        scVC.label = settingLang
        
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
