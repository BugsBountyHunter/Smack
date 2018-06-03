//
//  AuthService.swift
//  Smack
//
//  Created by Ahmed on 9/17/1439 AH.
//  Copyright © 1439 AH Steph_saber. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService{
    
    static let instanc = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get{
            return defaults.bool(forKey: IS_LOGGED_KEY)
        }
        set{
            defaults.set(newValue, forKey: IS_LOGGED_KEY)
        }
    }
    var isToken : String {
        get{
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set{
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    var userEmail : String {
        get{
            return defaults.value(forKey: USER_EMAIL) as! String
            
        }
        set{
            
            defaults.set(newValue, forKey: USER_EMAIL)
            
        }
    }
    
    
    ///Registration Account
    
    func registerUser(email:String ,password: String,completion : @escaping completionHandler){
        
        let lowercaseEmail = email.lowercased()
        
        
        let body = ["email":lowercaseEmail , "password":password]
        
        Alamofire.request(REGISTER_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers:
            HEADER).responseString { (response) in
        
            if response.result.error == nil {
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    // Create login account
    
    func loginUser(email: String , password : String , completion : @escaping completionHandler){
        
        
        let lowercaseEmail = email.lowercased()
        let body = ["email":lowercaseEmail , "password":password]
        Alamofire.request(LOGIN_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON {
            (response) in
            
            if response.result.error == nil {
                guard let data = response.data else {return}
                let json = JSON(data)
                self.userEmail = json["user"].stringValue
                self.isToken = json["token"].stringValue
                self.isLoggedIn = true
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
            
        }
        
    }
    
    // Greate Add user methode
    func addUser(name: String , email: String , avatarName: String , avatarColor: String , completion:@escaping completionHandler){
        //email
        let lowercaseEmail = email.lowercased()
        //header
        let header = ["content-type":"application/json; charset=utf-8",
                      "Authorization":"Bearer \(AuthService.instanc.isToken)"]
        //Body
        let body = [
            "email":lowercaseEmail,
            "name": name,
            "avatarName":avatarName,
            "avatarColor": avatarColor]
        //Alamofire
        
        Alamofire.request(ADD_USER, method:.post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil {
                
                guard let data = response.data else{return}
                let json = JSON(data)
                
                let id = json["_id"].stringValue
                let name = json["name"].stringValue
                let email = json["email"].stringValue
                let avatarName = json["avatarName"].stringValue
                let avatarColor = json["avatarColor"].stringValue
                
                UserDataService.instance.setUserData(id: id, email: email, name: name, avatarName: avatarName, avatarColor: avatarColor)
                
                
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any )
            }
        }
        
        
        
        
        
        
        
        
    }
    
}
