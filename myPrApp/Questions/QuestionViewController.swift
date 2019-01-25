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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("選択されたUserTypeは\(selectedImg)です")

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
        
        let img2 = UIImage(named: "trush")
        
        // Tag番号 1 で UIImageView インスタンスの生成1
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = img
        
        // Tag番号 ２ で UIImageView インスタンスの生成2
        let imageView2 = cell.viewWithTag(2) as! UIImageView
        imageView2.image = img2
        
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
    
    
    
    @IBAction func tapUserTypeOk(_ sender: Any) {
        
        //決定ボタンを押したらUserTypeで選択したものをUserTypeをUserDefaultsに保存する
        UserTypeViewController().saveUserType(str: selectedImg!)
        
        userType = UserTypeViewController().readUserType()
        
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
