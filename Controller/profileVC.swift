//
//  profileVC.swift
//  Smack
//
//  Created by Ahmed on 9/22/1439 AH.
//  Copyright © 1439 AH Steph_saber. All rights reserved.
//

import UIKit

class profileVC: UIViewController {
    
    //outlets
    @IBOutlet weak var profileImage: CircleImage!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }

    
    //Action
 
    @IBAction func closeModelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logout()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGE , object: nil)
        dismiss(animated: true, completion: nil)
        //Clear All user Data
        
        
    }
    
    //function

    func setupView(){
        
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        profileImage.backgroundColor = UserDataService.instance.returnColor(components: UserDataService.instance.avatarColor)
        let tapCloseModel = UITapGestureRecognizer(target: self, action: #selector(profileVC.closeModelPressed(_:)))
        bgView.addGestureRecognizer(tapCloseModel)
    }
    
    @objc func colseTap(_ recognizer:UITapGestureRecognizer){
        dismiss(animated: true , completion: nil)
    }
}

