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
    func setAvatarName(avatarName : String ){
        //Avatar Image Selected
        self.avatarName = avatarName
    }
    
    
    
    // take pickup image to set profile image
    
    func returnColor(components: String)->UIColor{
        //"[0.835294117647059,0.788235294117647,0.811764705882353, 1]",
        
        let scanner = Scanner(string: components)
        //skipped
        let skipped = CharacterSet(charactersIn: "[], ")
        //stop point
        let comma = CharacterSet(charactersIn: ",")
        //take char that will be ignore in scanner
        scanner.charactersToBeSkipped = skipped
        
        var r , g , b , a : NSString?
        // 1- take char as String
        scanner.scanUpToCharacters(from: comma, into: &r) // used & because i need reference
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        // 2- Unwrapped NSstringvalue (need reference)
        
        guard let rUnwrapped = r else {return defaultColor}
        guard let gUnwrapped = g else {return defaultColor}
        guard let bUnwrapped = b else {return defaultColor}
        guard let aUnwrapped = a else {return defaultColor}
        
        //3- convert value from string to CGFloat but needed to casting to double first
        
        let rFloat = CGFloat(rUnwrapped.doubleValue) //casting doubleValue
        let gFloat = CGFloat(gUnwrapped.doubleValue)
        let bFloat = CGFloat(bUnwrapped.doubleValue)
        let aFloat = CGFloat(aUnwrapped.doubleValue)
        //4- at the end create anew UICOLOR
        
        let newUIcolor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        return newUIcolor
    }
    
    //logout func
    func logout(){
        
        avatarName = ""
        avatarColor = ""
        email = ""
        name = ""
        AuthService.instanc.isLoggedIn = false
        AuthService.instanc.isToken = ""
        AuthService.instanc.userEmail = ""
    }
    
    
}
