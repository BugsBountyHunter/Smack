//
//  UserDataService.swift
//  Smack
//
//  Created by Ahmed on 9/19/1439 AH.
//  Copyright © 1439 AH Steph_saber. All rights reserved.
//

import Foundation
class UserDataService{
    
    
    //that was place can save data respose from api
    
     static let instance = UserDataService()
    
    public private(set) var  id = ""
    public private(set) var  email = ""
    public private(set) var  avatarName = ""
    public private(set) var  avatarColor = ""
    public private(set) var  name = ""
    
    func setUserData(id : String , email : String , name :String , avatarName : String , avatarColor : String ){
        
        self.id = id
        self.email = email
        self.name = name
        self.avatarName = avatarName
        self.avatarColor = avatarColor
        
    }
    func setAvatarColor(avatarColor : String ){
        self.avatarColor = avatarColor
    }
    
    
}
