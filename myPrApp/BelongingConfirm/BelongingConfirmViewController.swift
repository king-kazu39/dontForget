//
//  BelongingConfirmViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/01/15.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit

class BelongingConfirmViewController: UIViewController {
    
    @IBOutlet weak var backCard: UIView!
    @IBOutlet weak var backCardImageView: UIImageView!
    
    @IBOutlet weak var frontCard: UIView!
    @IBOutlet weak var frontCardImageView: UIImageView!
    
    //画像の情報を入れるための配列を用意する
    var imageList:[String]!
    var cardNumber:Int = 0
    var nextCard:Int = 1
    var imageListCount:Int!
    
    //スワイプ前のカードの中心座標を入れる変数
    var cardCenter:CGPoint!
    
    //画面の幅を入れる変数
    var screenHeight:CGFloat!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageList = questImg as! [String]
        imageListCount = questImg.count
        
        //frontカードの中心の位置情報を取得
        cardCenter = frontCard.center
        print(cardCenter)
        
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
        
        
        //カードをスワイプした分動かす処理
        //縦移動
        swipeCard.center = CGPoint(x: swipeCard.center.x, y: swipeCard.center.y + point.y * 0.1)
        
        //スワイプの指が離れたときの処理.
        if sender.state == UIGestureRecognizer.State.ended{
            //処理を記入
            //左に大きく振れた時
            if swipeCard.center.y > self.screenHeight/5 {
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
    
    
    

}
