//
//  UserTypeViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2018/12/31.
//  Copyright © 2018 Kazuya Nakazato. All rights reserved.
//

import UIKit

//プロトコル追加
class UserTypeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    
    //メンバ変数用意
    var language: String?
    
    var userTypes:[String?] = []
    
    var selectedImage: String?
    
    let userImages = [
        "singleman","singlewoman","married","pet","student",
        "child","usertype"]
    

    // サムネイル画像の名前（Japanese）
    let userJpns = [
        "独身男性","独身女性","既婚","ペット持ち","学生",
        "子ども","自分で設定する"]
    
    // サムネイル画像の名前（English）
    let userEngs = [
        "singleman","singlewoman","married","pet","student",
        "child","usertype"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
      language = LangViewController().readData()

        if language == "Japanese" {
            //
            userTypes = userJpns

        } else if language == "English" {
            //
            userTypes = userEngs
        }

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 要素数を入れる、要素以上の数字を入れると表示でエラーとなる
        print(userImages.count)
        return userImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // "Cell" はストーリーボードで設定したセルのID
        let testCell:UICollectionViewCell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        // Tag番号を使ってImageViewのインスタンス生成
        let imageView = testCell.contentView.viewWithTag(1) as! UIImageView
        
        // 画像配列の番号で指定された要素の名前の画像をUIImageとする
        let cellImage = UIImage(named: userImages[indexPath.row])
        
        // UIImageをUIImageViewのimageとして設定
        imageView.image = cellImage
        // Tag番号を使ってLabelのインスタンス生成
        let label = testCell.contentView.viewWithTag(2) as! UILabel
        label.text = userTypes[indexPath.row]
        print(indexPath.row)
        
        return testCell
    }
    
    // Cell が選択された場合
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedImage = userImages[indexPath.row]
        
        print(selectedImage)
        
        if selectedImage != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegue(withIdentifier: "toQuestionView",sender: nil)
        }
        
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toQuestionView") {
            let qtVC: QuestionViewController = (segue.destination as? QuestionViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            qtVC.selecetdImg = selectedImage
        }
    }
    
    
    // Screenサイズに応じたセルサイズを返す
    // UICollectionViewDelegateFlowLayoutの設定が必要
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 横方向のスペース調整
        let horizontalSpace:CGFloat = 2
        let cellSize:CGFloat = self.view.bounds.width/2 - horizontalSpace
        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: cellSize)
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // section数は１つ
        return 1
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
