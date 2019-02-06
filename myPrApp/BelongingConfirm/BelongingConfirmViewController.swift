//
//  BelongingConfirmViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/01/15.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit
import Lottie

var cameraImage:UIImage?


class BelongingConfirmViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //
    let animationView = LOTAnimationView()
    
    @IBOutlet weak var backCard: UIView!
    @IBOutlet weak var backCardImageView: UIImageView!
    
    @IBOutlet weak var frontCard: UIView!
    @IBOutlet weak var frontCardImageView: UIImageView!
    
    
    @IBOutlet weak var questionSentences: UITextView!
    
    //画像の情報を入れるための配列を用意する
    var imageList:[String]!
    var cardNumber:Int = 0
    var nextCard:Int = 1
    var imageListCount:Int!
    
    //スワイプして質問を変えるための変数を初期化
    var num = 0
    
    //スワイプ前のカードの中心座標を入れる変数
    var cardCenter:CGPoint!
    
    //画面の幅を入れる変数
    var screenHeight:CGFloat!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //デフォルトの設定
        if set == 0 {
            let defaultQstImg = [
                "key","pc",
                "wallet","doc",
                "camera","plus"]
            imageList = defaultQstImg
            imageListCount = defaultQstImg.count
        //ちゃんと設定をした時の
        } else {
            imageList = questImg as! [String]
            imageListCount = questImg.count
        }
        
        //frontカードの中心の位置情報を取得
        cardCenter = frontCard.center
        print(cardCenter)
        
        //質問内容表示
        if set == 0 {
            labelArray = [
                "Do you have your key？","Do you have your PC？",
                "Do you have your wallet？","Do you have your document?",
                "When you are well-groomed,Take a picture.","add a question"]
            self.questionSentences.text = labelArray[num]
        } else {
            self.questionSentences.text = labelArray[num]
        }
        
        //スクリーンにサイズ取得
        screenHeight = UIScreen.main.bounds.height

        frontCardImageView.image = UIImage(named: imageList[cardNumber])
        backCardImageView.image = UIImage(named: imageList[nextCard])
        
    }
    
    
    @IBAction func swipeGesture(_ sender: UIPanGestureRecognizer) {
        
        print("スワイプされました")
        //スワイプされているView
        let swipeCard = sender.view!
        
        //どれくらいスワイプされたかを変数に入れる
        let point = sender.translation(in: view)
        
        print("pointの中身：\(point)")
        
        //カードをスワイプした分動かす処理
        //縦移動
        
        if point.y >= 0 {
            swipeCard.center = CGPoint(x: swipeCard.center.x, y: swipeCard.center.y + point.y * 0.1)
        } else {
            swipeCard.center = CGPoint(x: swipeCard.center.x, y: swipeCard.center.y)
        }
        

        
        //スワイプの指が離れたときの処理.
        if sender.state == UIGestureRecognizer.State.ended{
            //処理を記入
            //下に大きく振れた時
            if swipeCard.center.y > self.screenHeight/3 {
                UIView.animate(withDuration: 0, animations: {
                    //カードをスワイプした方向に飛ばす
                    swipeCard.center = CGPoint(x: self.cardCenter.y - self.screenHeight, y: self.cardCenter.y)
                    
                    //カードを透明にする
                    swipeCard.alpha = 0
                    
                    //カードを元の位置に戻す
                    swipeCard.center = CGPoint(x: self.cardCenter.x, y: self.cardCenter.y)
                    swipeCard.transform = .identity
                    
                    //frontカードにbackカードの情報を入れる
                    self.frontCardImageView.image = self.backCardImageView.image
                    
                    //frontカードを見えるようにする
                    swipeCard.alpha = 1
                    
                    if self.num < 4 {
                        self.animation()
                    }
                    
                    self.num += 1
                    self.questionSentences.text = labelArray[self.num]
                    
                    if self.questionSentences.text == labelArray[5] {
                        
                        self.alert()
                        // showGroomingCameraへいくためのSegue を呼び出す
                        
                    }
                    
                    //backカードに次の要素の情報を入れる（場合分けが必要）
                    //残りのカードが２枚になるまで
                    if self.cardNumber < self.imageListCount - 2 {
                        self.cardNumber += 1
                        self.nextCard += 1
                        self.backCardImageView.image = UIImage(named: self.imageList[self.nextCard])
                        
                        //残りのカードが２枚の時
                    } else if self.cardNumber == self.imageListCount - 2 {
                        self.cardNumber += 1
                        self.backCard.alpha = 0
                        
                        //残りのカードが１枚の時
                    } else if self.cardNumber == self.imageListCount - 1 {
                        self.frontCard.alpha = 0
                        
                    }
                    
                })
            }
                //右に大きく振れた時
//            else if swipeCard.center.y > self.screenHeight - self.screenHeight/5{
//                UIView.animate(withDuration: 0, animations: {
//                })
//            }
                //小さく振れた時
            else {
                UIView.animate(withDuration: 0.2, animations: {
                    
                    //元の位置に戻す
                    swipeCard.center = CGPoint(x: self.cardCenter.x, y: self.cardCenter.y)
                    swipeCard.transform = .identity
                    
                })
            }
        }
        
    }
    
    
    func animation() {
        animationView.frame.size.width = 300//アニメーションを表示するViewの幅
        animationView.frame.size.height = 300//アニメーションを表示するViewの高さ
        animationView.center = self.view.center//Viewのs中心に配置
        animationView.setAnimation(named: "3101-first-checked")
        animationView.animationSpeed = 1//アニメーションのスピード
        animationView.contentMode = .scaleAspectFit
        animationView.loopAnimation = false//アニメーションを繰り返し行う
        self.view.addSubview(animationView)
        
        print("アニメーション開始")
        
        animationView.play { finished in
            if finished {
                self.animationView.removeFromSuperview()
            }
        }
        
    }
    
    //アラートを呼び出す関数
    func alert () {
        //アラートオブジェクトを作る
        let alert = UIAlertController(title: "身だしなみを整えたら", message: "撮影してください", preferredStyle: .alert)
        
        //OKが押されたときにmyMessageの中に書いた処理を実行するように設定している
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in self.moveCamera()}))
        
        //アラート画面を表示する
        present(alert,animated: true)
    }
    
    func moveCamera(){
        print("カメラ画面に遷移します")
        
        //撮影用の画面を起動する
        
        
        //カメラ機能があるデバイスかどうか確認する
        //カメラかどうか判定するための値を代入
        //SourceTypeという列挙体の中のカメラタイプを指定している
        let camera = UIImagePickerController.SourceType.camera
        
        //型メソッドを使用して、カメラタイプか判別
        //型メソッドとは、、インスタンス化することなしに機能を持っているメソッドのこと
        if UIImagePickerController.isSourceTypeAvailable(camera){
            //カメラ使える
            //カメラで撮影できる画面を表示する
            
            //撮影用画面オブジェクトを作成（インスタンス化）
            let picker = UIImagePickerController()
            
            picker.sourceType = camera
            picker.delegate = self //イベントの指示をする人は自分（この画面）
            //カメラで撮影できる画面を表示する
            present(picker,animated: true) //表示
            
        }
        
        
    }
    
    //撮影ボタンが押されたら発動するメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //撮影された写真を取得（UIImage型で取得）
        //as ：ダウンキャスト変換　具体的にデータ型を決定する変換方法
        //info 撮影時の情報を送ってきてくれる変数 UIImageだったり、ディクショナリー型（Exit）だったりが送られてくる
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        //次画面で撮影した画像を表示するためにグローバル変数に一時的に保存
        cameraImage = image
        
        //アルバムに保存(カメラロール)
        //        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        //撮影用の画面を閉じる
        //completionにsegueで画面遷移する処理を入れた
        dismiss(animated: true, completion:{self.performSegue(withIdentifier: "showGroomingCamera", sender: nil)})
        
    }
    
    

}
