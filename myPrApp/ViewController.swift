//
//  ViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2018/12/30.
//  Copyright © 2018 Kazuya Nakazato. All rights reserved.
//

import UIKit

var set:Int?

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func tapPrep(_ sender: Any) {
        set = 0
    }
    

    @IBAction func tapSet(_ sender: Any) {
        set = 1
    }
    
}

