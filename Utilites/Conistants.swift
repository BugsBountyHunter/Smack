//
//  Conistants.swift
//  Smack
//
//  Created by Ahmed on 9/15/1439 AH.
//  Copyright © 1439 AH Steph_saber. All rights reserved.
//

import Foundation


//Key
let IS_LOGGED_KEY = "logged in"
let TOKEN_KEY = "token"
let USER_EMAIL = "user name"

//completion hanndler == colsur

typealias completionHandler = (_ Success: Bool) -> ()


//Header for login an Redister

let HEADER = ["content-type":"application/json; charset=utf-8"]



//URl
let BASE_URL = "https://lasttestchat.herokuapp.com/v1/"
let REGISTER_URL = "\(BASE_URL)account/register"
let LOGIN_URL = ("\(BASE_URL)account/login")
let ADD_USER = ("\(BASE_URL)user/add")

//Segue
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unWind"
