//
//  Question_Button_Custom.swift
//  myPrApp
//
//  Created by 仲里和也 on 2019/01/17.
//  Copyright © 2019 Kazuya Nakazato. All rights reserved.
//

import UIKit

//UIButtonをカスタムするクラスとしてQuestion_Button_Custom.swiftを作る
@IBDesignable

class Question_Button_Custom: UIButton {
    
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
    
}


