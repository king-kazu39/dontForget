//
//  PrepareButtonViewController.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/01/15.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit

@IBDesignable

class PrepareButtonViewController: UIButton {

    @IBInspectable var textColor: UIColor?
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet {
            
            layer.cornerRadius = cornerRadius
            
        }
        
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        
        didSet {
            
            layer.borderWidth = borderWidth
            
        }
        
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        
        didSet {
            
            layer.borderColor = borderColor.cgColor
            
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
