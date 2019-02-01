//
//  GroomingCameraViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/02/01.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit
import Lottie

class GroomingCameraViewController: UIViewController {
    
    //animationViewをインスタンス化？
    //メンバ変数に置かないとエラー出る
    let animationView = LOTAnimationView()

    @IBOutlet weak var groomingPicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        groomingPicture.image = cameraImage
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        alertPicture()
    }
    
    //アラートを呼び出す関数
    func alertPicture() {
        //アラートオブジェクトを作る
        let alert = UIAlertController(title: "身だしなみは大丈夫ですね。", message: "寝癖はありませんか", preferredStyle: .alert)
        
        //OKが押されたときにmyMessageの中に書いた処理を実行するように設定している
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in self.Go()}))
        
        //アラート画面を表示する
        present(alert,animated: true)
    }
    
    func Go() {
        print("出かける準備ができました")
        
        reAnimation()
    }
    
    //TODO：後で省略したい。他のクラスから持ってこれない？？
    func reAnimation() {
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
    
    
    @IBAction func tapMoveLast(_ sender: Any) {
        self.performSegue(withIdentifier: "showLastPage", sender: nil)
    }
    
    
    
}
