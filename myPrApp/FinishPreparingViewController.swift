//
//  FinishPreparingViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/02/01.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit
import Lottie

class FinishPreparingViewController: UIViewController {

    
    @IBOutlet weak var finishImage: UIImageView!
    @IBOutlet weak var finishLabel: UILabel!
    
    @IBOutlet weak var sentenceLabel: UILabel!
    
    //animationViewをインスタンス化？
    //メンバ変数に置かないとエラー出る
    let animationView = LOTAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lastAnimation()
        
        //Japaneseに設定していたら日本文にする
        if settingLang == "Japanese" {
            sentenceLabel.text = "行ってらっしゃい！！"
            //Englishに設定していたら英文にする
        } else if settingLang == "English" {
            sentenceLabel.text = "Good luck!!"
        }

        
        
        
    }
    
    //TODO：後で省略したい。他のクラスから持ってこれない？？
    func lastAnimation() {
        animationView.frame.size.width = 300//アニメーションを表示するViewの幅
        animationView.frame.size.height = 300//アニメーションを表示するViewの高さ
        animationView.center = self.view.center//Viewのs中心に配置
        animationView.setAnimation(named: "3091-process-complete")
        animationView.animationSpeed = 1//アニメーションのスピード
        animationView.contentMode = .scaleAspectFit
        animationView.loopAnimation = true//アニメーションを繰り返し行う
        self.view.addSubview(animationView)
        
        print("アニメーション開始")
        
        animationView.play { finished in
            if finished {
                self.animationView.removeFromSuperview()
            }
        }
        
    }

    
    @IBAction func tapFinish(_ sender: Any) {
        
        finishImage.image = UIImage(named: "cellphone")
        
        
        //Japaneseに設定していたら日本文にする
        if settingLang == "Japanese" {
            finishLabel.text = "携帯忘れないでね！"
            //Englishに設定していたら英文にする
        } else if settingLang == "English" {
            finishLabel.text = "Don't forget your phone!"
        }
        
        
        
    }
    
    
}
