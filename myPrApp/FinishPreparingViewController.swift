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

    //animationViewをインスタンス化？
    //メンバ変数に置かないとエラー出る
    let animationView = LOTAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lastAnimation()
        
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

    
}
