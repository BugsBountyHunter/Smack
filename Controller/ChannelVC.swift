//
//  ChannelVC.swift
//  Smack
//
//  Created by Ahmed on 9/15/1439 AH.
//  Copyright © 1439 AH Steph_saber. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    //outlet
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var loginBtn: UIButton!
    //segue
    @IBAction func unWind(segue:UIStoryboardSegue){
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidchange(_:)), name: NOTIF_USER_DATA_CHANGE, object: nil)
    }
    
    @objc func userDataDidchange(_ notif:Notification){
        if AuthService.instanc.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.backgroundColor =  UserDataService.instance.returnColor(components: UserDataService.instance.avatarColor)
        }else{
            loginBtn.setTitle("login", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
            userImage.backgroundColor = UIColor.gray
        }
            
        
    }

    @IBAction func toLoginBtnPressed(_ sender: Any) {
        if AuthService.instanc.isLoggedIn {
            let profile = profileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true , completion: nil)
        }else{
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
        
    }
}
