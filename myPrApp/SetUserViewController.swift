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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        userType = UserTypeViewController().readSetUser()
        
        print(userType)
        
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
