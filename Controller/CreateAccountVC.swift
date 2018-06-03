//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Ahmed on 9/15/1439 AH.
//  Copyright © 1439 AH Steph_saber. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    //outlet
    @IBOutlet weak var userNameTXT: UITextField!
    @IBOutlet weak var emailTXT: UITextField!
    @IBOutlet weak var passwordTXT: UITextField!
    @IBOutlet weak var pickImg: UIImageView!
    
    //variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5 , 0.5 , 0.5 , 1]"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //Action
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        guard let name = userNameTXT.text , userNameTXT.text != "" else{return}
        guard let email = emailTXT.text , emailTXT.text != "" else{
            return
        }
        guard let pass = passwordTXT.text , passwordTXT.text != "" else{
            return
        }
        
        AuthService.instanc.registerUser(email: email, password: pass) { (success) in
            if success  {
                AuthService.instanc.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthService.instanc.addUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                print("\(UserDataService.instance.avatarColor),\(UserDataService.instance.avatarName),\(UserDataService.instance.name)")
                                print("Success")
                            }
                        })
                    }
                })
            }
        }
        
    }
    @IBAction func imageBGBtn(_ sender: Any) {
        
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
    
    @IBAction func closeCreateAccountBtn(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
