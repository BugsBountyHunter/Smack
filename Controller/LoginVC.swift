//
//  LoginVC.swift
//  Smack
//
//  Created by Ahmed on 9/15/1439 AH.
//  Copyright © 1439 AH Steph_saber. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closeLoginVCPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func toCreateAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
}
