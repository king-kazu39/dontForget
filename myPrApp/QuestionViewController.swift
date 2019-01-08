//
//  QuestionViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/01/07.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit

//プロトコル追加
class QuestionViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var questTable: UITableView!
    
    var selecetdImg: String?
    
    var questImg:[String?] = []
    var labelArray:[String?] = []
    
    // section毎の画像配列
    let singleManImg: [String?] = [
        "key","pc",
        "wallet","doc",
        "camera","plus"]
    
    let singleWomanImg: [String?] = [
        "key","pc",
        "wallet","cosme",
        "camera","plus"]
    
    let petImg: [String?] = [
        "key","pc",
        "pet","window",
        "camera","plus"]
    
    let marriedImg: [String?] = [
        "key","pc",
        "food","married",
        "camera","plus"]
    
    let studentImg: [String?] = [
        "key","pc",
        "wallet","book",
        "camera","plus"]
    
    let childImg: [String?] = [
        "key","lunchbox",
        "cap","book",
        "camera","plus"]
    
    let userTypeImg: [String?] = ["camera","plus"]
    
    
    //section毎の質問配列
    let singleManLabel: [String?] = [
        "鍵持った？","PC持った？",
        "財布持った？","会議で使う資料持った？",
        "身だしなみを整えよう","確認項目を追加する"]
    
    let singleWomanLabel: [String?] = [
        "鍵持った？","PC持った？",
        "財布持った？","化粧ポーチ持った？",
        "身だしなみを整えよう","確認項目を追加する"]
    
    let petLabel: [String?] = [
        "鍵持った？","PC持った？",
        "ペットに餌やった？","戸締りした？",
        "身だしなみを整えよう","確認項目を追加する"]
    
    let marriedLabel: [String?] = [
        "鍵持った？","PC持った？",
        "ご飯食べた？","ハニーに行ってきますした？",
        "身だしなみを整えよう","確認項目を追加する"]
    
    let studentLabel: [String?] = [
        "鍵持った？","PC持った？",
        "財布持った？","教科書持った？",
        "身だしなみを整えよう","確認項目を追加する"]
    
    let childLabel: [String?] = [
        "鍵持った？","帽子持った？",
        "弁当持った？","教科書持った？",
        "身だしなみを整えよう","確認項目を追加する"]
    
    let userTypeLabel: [String?] = ["身だしなみを整えよう","確認項目を追加する"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
    }
    
    //Table Viewのセルの数を指定
    func tableView(_ table: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        if selecetdImg == "singleman" {
            questImg = singleManImg
            labelArray = singleManLabel
        } else if selecetdImg == "singlewoman"{
            questImg = singleWomanImg
            labelArray = singleWomanLabel
        } else if selecetdImg == "pet" {
            questImg = petImg
            labelArray = petLabel
        } else if selecetdImg == "married" {
            questImg = marriedImg
            labelArray = marriedLabel
        } else if selecetdImg == "student" {
            questImg = studentImg
            labelArray = studentLabel
        } else if selecetdImg == "child" {
            questImg = childImg
            labelArray = childLabel
        } else if selecetdImg == "usertype" {
            questImg = userTypeImg
            labelArray = userTypeLabel
        }
            
            print(questImg.count)
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
        let label = cell.viewWithTag(3) as! UILabel
        label.text = String(describing: labelArray[indexPath.row] as! String)
        
        return cell
    }
    
    // Cell の高さを220にする
    func tableView(_ table: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220.0
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
