//
//  LangViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2018/12/30.
//  Copyright © 2018 Kazuya Nakazato. All rights reserved.
//

import UIKit

class LangViewController: UIViewController {
    
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
    
    
    //TODO:①遷移時に値の受け渡しする(Japanese)
    //TODO:②アクションシートの「Change to Japanese」ボタンで画面遷移できるようにする
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
    
    //TODO:①遷移時に値の受け渡しする(English)
    //TODO:②アクションシートの「Change to English」ボタンで画面遷移できるようにする

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
            print("\(language)")
        
        settingLang = language
        
        if settingLang == "Japanese" || settingLang == "English" {
         self.performSegue(withIdentifier: "showUserType", sender: nil)
        }
        
    }
    
    //セグエを通って移動するとき発動
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let scVC = segue.destination as! UserTypeViewController
        
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
