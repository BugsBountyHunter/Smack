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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5 , 0.5 , 0.5 , 1]"
    
    //var background color
    var bgColor: UIColor?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            pickImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColor == nil {
                pickImg.backgroundColor = UIColor.lightGray
                
            }
        }
    }
    //Action
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
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
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGE , object: nil)
                            }
                        })
                    }
                })
            }
        }
        
    }
    @IBAction func imageBGBtn(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
        
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
        
        let r = CGFloat(arc4random_uniform(255))/255
        let g = CGFloat(arc4random_uniform(255))/255
        let b = CGFloat(arc4random_uniform(255))/255
        
        self.bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        //
        avatarColor = "[\(r),\(g),\(b), 1]"
        UIView.animate(withDuration:0.2){
            self.pickImg.backgroundColor = self.bgColor
        }
        
    }
    
    func setupView(){
        spinner.isHidden =  true
        userNameTXT.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor:smackPurplePlaceholder])
        emailTXT.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor:smackPurplePlaceholder])
        passwordTXT.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor:smackPurplePlaceholder])
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTop))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func handleTop(){
        view.endEditing(true)
    }
    
    
    
    
    
    @IBAction func closeCreateAccountBtn(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
