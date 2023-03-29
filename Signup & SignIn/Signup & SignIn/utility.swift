//
//  utility.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 16/03/23.
//

import Foundation
import UIKit

struct DatabaseKey {
    static let userTblName = "user_detail"
    
    static let userIdKey = "id"
    static let userFirstNameKey = "firstname"
    static let userLastNameKey = "lastname"
    static let userEmailkey = "email"
    static let userPasswordKey = "password"
    static let userMobileNoKey = "mobileno"
    static let userAboutKey = "aboutme"
    static let userImageKey = "image_url"
   
}

struct userDataKey {
    
    static let userIdKey = "id"
    static let userFirstNameKey = "firstname"
    static let userLastNameKey = "lastname"
    static let userEmailkey = "email"
    static let userPasswordKey = "password"
    static let userMobileNoKey = "mobileno"
    static let userAboutKey = "aboutme"
    static let userImageKey = "image_url"
   
}


// MARK:- User Defaults Data Save

func userDefaultsDataSave (strid:String,strfirstname:String,strlastname:String, stremail:String , strpass:String, strmobileNo:String,straboutme:String,strImage:String) {

    let userDefaults = UserDefaults.standard
    
    userDefaults.set(strid, forKey: userDataKey.userIdKey)
    userDefaults.set(strfirstname, forKey: userDataKey.userFirstNameKey)
    userDefaults.set(strlastname, forKey: userDataKey.userLastNameKey)
    userDefaults.set(stremail, forKey: userDataKey.userEmailkey)
    userDefaults.set(strpass, forKey: userDataKey.userPasswordKey)
    userDefaults.set(strmobileNo, forKey: userDataKey.userMobileNoKey)
    userDefaults.set(straboutme, forKey: userDataKey.userAboutKey)
    userDefaults.set(strImage, forKey: userDataKey.userImageKey)

    userDefaults.synchronize()
}

// MARK:- Remove Data From User Defaults

func removeDataFromuserDefaults() {
    let userDefaults = UserDefaults.standard
    userDefaults.removeObject(forKey:userDataKey.userIdKey )
    userDefaults.removeObject(forKey:userDataKey.userFirstNameKey )
    userDefaults.removeObject(forKey:userDataKey.userLastNameKey )
    userDefaults.removeObject(forKey:userDataKey.userEmailkey )
    userDefaults.removeObject(forKey:userDataKey.userPasswordKey )
    userDefaults.removeObject(forKey:userDataKey.userMobileNoKey )
    userDefaults.removeObject(forKey:userDataKey.userAboutKey )
    userDefaults.removeObject(forKey:userDataKey.userImageKey )
 
 
    userDefaults.synchronize()
    
  
}

//MARK :- get data form userdefaults

func getDataFromDefaults(completion:@escaping (Bool,String,String,String,String,String,String,String,String)->()) {
    
    let userDefaults = UserDefaults.standard
    guard let id = userDefaults.value(forKey: userDataKey.userIdKey) as? String else {
        completion(false, "","","","","","","","")
        return
    }
    guard let firstname = userDefaults.value(forKey: userDataKey.userFirstNameKey) as? String else {
        completion(false, "","","","","","","","")
        return
    }
    guard let lastname = userDefaults.value(forKey: userDataKey.userLastNameKey) as? String else {
        completion(false, "","","","","","","","")
        return
    }
    guard let email = userDefaults.value(forKey: userDataKey.userEmailkey) as? String else {
        completion(false, "","","","","","","","")
        return
    }
    guard let password = userDefaults.value(forKey: userDataKey.userPasswordKey) as? String else {
        completion(false, "","","","","","","","")
        return
    }
    guard let mobileNo = userDefaults.value(forKey: userDataKey.userMobileNoKey) as? String else {
        completion(false, "","","","","","","","")
        return
    }
    guard let aboutMe = userDefaults.value(forKey: userDataKey.userAboutKey) as? String else {
        completion(false, "","","","","","","","")
        return
    }
    guard let userImage = userDefaults.value(forKey: userDataKey.userImageKey) as? String else {
        completion(false, "","","","","","","","")
        return
    }
    completion(true, id, firstname, lastname, email, password, mobileNo, aboutMe,userImage)

}
