//
//  PrepareTopViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/01/04.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit

class PrepareTopViewController: UIViewController {

    
    @IBOutlet weak var pepareLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pepareLabel.text = LangViewController().readData()
        
        
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
