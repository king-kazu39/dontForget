//
//  GroomingCameraViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/02/01.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit

class GroomingCameraViewController: UIViewController {

    @IBOutlet weak var groomingPicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        groomingPicture.image = cameraImage
        
    }
    
}
