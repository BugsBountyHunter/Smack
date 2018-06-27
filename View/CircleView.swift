//
//  CircleView.swift
//  Smack
//
//  Created by Ahmed on 9/22/1439 AH.
//  Copyright © 1439 AH Steph_saber. All rights reserved.
//

import UIKit
@IBDesignable
class CircleView: UIView {
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    func setupView(){
        self.layer.cornerRadius = 10.0
        
    }


}
