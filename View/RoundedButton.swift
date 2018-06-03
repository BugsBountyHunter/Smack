//
//  RoundedButton.swift
//  Smack
//
//  Created by Ahmed on 9/17/1439 AH.
//  Copyright © 1439 AH Steph_saber. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable var cornerRadius:CGFloat = 3.0 {
        didSet{
           self.layer.cornerRadius = 3.0
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView(){
        
        self.layer.cornerRadius = cornerRadius
    }

    


  

}
