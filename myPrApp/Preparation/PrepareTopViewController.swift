//
//  PrepareTopViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/01/04.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit

class PrepareTopViewController: UIViewController {

    //言語設定で表示を変えるために名前をつけた
    //TODO：言語設定で表示を変える
    @IBOutlet weak var textPreSent: UITextView!
    @IBOutlet weak var textPreDepWord: UITextView!
    @IBOutlet weak var labelPreUserType: UILabel!
    
    //設定した値で表示を変えるために名前をつけた
    //TODO：設定した値で表示を変える
    @IBOutlet weak var imgUserType: UIImageView!
    @IBOutlet weak var PreDepTime: UITextView!
    
    let PreTopJpn:String = "出かける準備をしましょう！"
    let PreTopEng:String = "Let's prepare for going out！"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        settingLang = LangViewController().readLang()
        
        
        
        print(settingLang)
        print(UserTypeViewController().readUserType())
        print(DepDateTimeViewController().readDepData())
        
        
    }
    
    
    @IBAction func tapGo(_ sender: Any) {
        
        //ボタンを押したら次画面に遷移する
        self.performSegue(withIdentifier: "showConfirmBelonging", sender: nil)
        
    }
    
    
    func langPreparation(){
        if settingLang == "Japanese" {
            
        }
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
