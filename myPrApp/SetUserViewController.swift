//
//  SetUserViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/01/14.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit

class SetUserViewController: UIViewController {

    var selectedImg:String?
    
    @IBOutlet weak var setUserName: UITextField!
    
    @IBOutlet weak var userDem: UIButton!

    @IBOutlet weak var setUserImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        userType = UserTypeViewController().readSetUser()
        
        print(userType)
        
//        setUserImage()
        
        setUserImage.image = UIImage(named: "usertype")
        
    }
    
    
    
    
    
    
    
    
//    func setUserImage(){
//        //UIImageViewのインスタンス作成
//        let imageView = UIImageView()
//
//        //TODO:後で配置を修正する
//        //imageViewの位置とサイズを設定
//        imageView.frame = CGRect(x: self.view.frame.width / 2 - 150, y: self.view.frame.height / 2 - 150, width: 200, height: 200)
//
//        //画像を生成。
//        let image = UIImage(named:"usertype")!
//
//        //生成した画像をimageViewに設定
//        imageView.image = image
//
//        //viewにimageViewをsubViewとして追加
//        self.view.addSubview(imageView)
//    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
