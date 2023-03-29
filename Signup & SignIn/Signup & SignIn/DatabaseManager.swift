

//
//  DatabaseManager.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 10/03/23.
//

import Foundation
import FMDB

final class DatabaseManager {
    static let databaseFileName = "UserDetail.db"
    static var database:FMDatabase!
    static let shared: DatabaseManager = {
        let instance = DatabaseManager()
        return instance
    }()
    
    
    func createDatabse()  {
        
        let bundlePath = Bundle.main.path(forResource: "UserDetail", ofType: ".db")
        print(bundlePath ?? "", "\n") //prints the correct path
        let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent("UserDetail.db")
        let fullDestPathString = fullDestPath!.path
        
        if fileManager.fileExists(atPath: fullDestPathString) {
            print("File is available")
            DatabaseManager.database = FMDatabase(path: fullDestPathString)
            openDataBase()
            print(fullDestPathString)
        }
        else{
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: fullDestPathString)
                if fileManager.fileExists(atPath: fullDestPathString) {
                    DatabaseManager.database = FMDatabase(path: fullDestPathString)
                    openDataBase()
                    
                    print("File is copy")
                }else {
                    print("File is not copy")
                }
            }catch{
                print("\n")
                print(error)
            }
        }
    }
    
    
    func openDataBase() {
        if DatabaseManager.database != nil {
            DatabaseManager.database.open()
            //deleteTran()
        }else {
            DatabaseManager.shared.createDatabse()
        }
    }
    
    func closeDataBase() {
        if DatabaseManager.database != nil {
            DatabaseManager.database.close()
        }else {
            
        }
    }
    
    
    // Mark:- Insert Function
    
    func insertDetail(strfirstName:String,strlastName:String,stremail:String,strpass:String,strphone:String,straboutme:String,strImage:String,completion:@escaping (Bool,String)->()) {
        let detail = ["firstname":strfirstName,"lastname":strlastName,"email":stremail,"password":strpass,"mobileno":strphone,"aboutme":straboutme,"image_url":strImage] as [String : Any]
        
        if DatabaseManager.database != nil {
            DatabaseManager.database.executeUpdate("INSERT INTO user_detail (firstname,lastname,email,password,mobileno,aboutme,image_url) VALUES (:firstname,:lastname,:email,:password,:mobileno,:aboutme,:image_url)", withParameterDictionary: detail)
            completion(true,"Add data")
        }else {
            completion(false, "Databse close")
        }
    }
    
    
    //Mark:-Update Function
    
    
    func updateData(strUserid:String,strfirstName:String,strlastName:String,strphone:String,straboutme:String,strImage:String,completion:@escaping (Bool,String)->()) -> Bool {
        let updateQuery = "UPDATE user_detail SET firstname=?, lastname=?,mobileno=?,aboutme=?,image_url=? WHERE id=?"
        self.openDataBase()
        if let database = DatabaseManager.database {
            if database.open() {
                let updateResult = database.executeUpdate(updateQuery, withArgumentsIn: [strfirstName,strlastName,strphone,straboutme,strImage,strUserid])
                if !updateResult {
                    print("Error updating data: \(database.lastErrorMessage())")
                }else{
                    print("Data Updated")
                    self.getAllData(id: strUserid)
                }
                database.close()
                return updateResult
            }
        }
        return false
    }
    
    
    
    //MARK - Login Function
    
    func login(email:String,pass:String)->Bool{
        
        let selectionArgs:[Any] = [email,pass]
        
        let selectQuery = "SELECT * FROM user_detail WHERE email=? AND password=?"
        self.openDataBase()
        if let result = DatabaseManager.database.executeQuery(selectQuery, withArgumentsIn: selectionArgs) {
            
            while result.next() {
                if  let u_email = result.string(forColumn: DatabaseKey.userEmailkey),
                    let u_password = result.string(forColumn: DatabaseKey.userPasswordKey),
                    let u_firstname = result.string(forColumn: DatabaseKey.userFirstNameKey),
                    let u_lastname = result.string(forColumn: DatabaseKey.userLastNameKey),
                    let u_mobileno = result.string(forColumn: DatabaseKey.userMobileNoKey),
                    let u_id = result.string(forColumn: DatabaseKey.userIdKey),
                    let u_aboutme = result.string(forColumn: DatabaseKey.userAboutKey),
                    let u_image = result.string(forColumn: DatabaseKey.userImageKey)
                {
                    
                    if u_email == email && u_password == pass{
                        
                        userDefaultsDataSave(strid: u_id, strfirstname: u_firstname, strlastname: u_lastname, stremail: u_email, strpass: u_password, strmobileNo: u_mobileno, straboutme: u_aboutme,strImage: u_image)
                        
                        return true
                    }
                    else if (u_password != pass){
                        return false
                        
                    }
                }
            }
        } else {
            print("Error executing query: \(DatabaseManager.database.lastErrorMessage())")
        }
        
        return false
    }
    
    func getAllData(id:String)->Bool{
        let selectionArgs:[Any] = [id]
        let selectQuery = "SELECT * FROM user_detail WHERE id=?"
        
        if let get = DatabaseManager.database.executeQuery(selectQuery,withArgumentsIn: selectionArgs){
            while get.next(){
                if  let u_email = get.string(forColumn: DatabaseKey.userEmailkey),
                    let u_password = get.string(forColumn: DatabaseKey.userPasswordKey),
                    let u_firstname = get.string(forColumn: DatabaseKey.userFirstNameKey),
                    let u_lastname = get.string(forColumn: DatabaseKey.userLastNameKey),
                    let u_mobileno = get.string(forColumn: DatabaseKey.userMobileNoKey),
                    let u_id = get.string(forColumn: DatabaseKey.userIdKey),
                    let u_aboutme = get.string(forColumn: DatabaseKey.userAboutKey),
                    let u_image = get.string(forColumn: DatabaseKey.userImageKey)
                {
                    userDefaultsDataSave(strid: u_id, strfirstname: u_firstname, strlastname: u_lastname, stremail: u_email, strpass: u_password, strmobileNo: u_mobileno, straboutme: u_aboutme,strImage: u_image)
                    return true
                }else{
                    return false
                }
            }
        }
        return false
    }
    
    //    func changpass(id:String)->Bool{
    //        let selectionArgs:[Any] = [id]
    //
    //        let selectQuery = "SELECT * FROM user_detail WHERE id=?"
    //
    //        if let change = DatabaseManager.database.executeQuery(selectQuery, withArgumentsIn:selectionArgs){
    //
    //        }
    //          return false
    //    }
    
    func updatepass(strPass:String,strID:String)->Bool{
        let updatepassQuery = "UPDATE user_detail SET password=? WHERE id=?"
        self.openDataBase()
        if let database = DatabaseManager.database {
            if database.open() {
                let updatePassResult = database.executeUpdate(updatepassQuery, withArgumentsIn: [strPass,strID])
                if !updatePassResult {
                    print("Error updating data: \(database.lastErrorMessage())")
                }else{
                    print("Data Updated")
                    
                }
                return updatePassResult
            }
        }
        return false
    }
    
    
    func checkpass(password:String)->Bool{
        let selectionArgs:[Any] = [password]
        let selectQuery = "SELECT * FROM user_detail WHERE password=?"
        self.openDataBase()
        if let result = DatabaseManager.database.executeQuery(selectQuery, withArgumentsIn: selectionArgs) {
            
            while result.next() {
                if let u_password = result.string(forColumn: DatabaseKey.userPasswordKey){
                    
                    if u_password == password{
                        return true
                    }
                    else if (u_password != password){
                        return false

                    }
                }
            }
        } else {
            print("Error executing query: \(DatabaseManager.database.lastErrorMessage())")
        }
        
        return false
    }
    
    
    func checkemail(email:String)->Bool{
        let selectionArgs:[Any] = [email]
        let selectQuery = "SELECT * FROM user_detail WHERE email=?"
        self.openDataBase()
        if let emailresult = DatabaseManager.database.executeQuery(selectQuery, withArgumentsIn: selectionArgs){
            while emailresult.next(){
                if let u_email = emailresult.string(forColumn: DatabaseKey.userEmailkey){
                    if u_email == email{
                        return true
                    }else if(u_email != email){
                        return false
                    }
                }
            }
        }else{
            print("Error executing query: \(DatabaseManager.database.lastErrorMessage())")
        }
        return false
    }
    
    
    func updateforpass(strEmail:String,strPass:String)->Bool{
        let updatepassQuery = "UPDATE user_detail SET password=? WHERE email=?"
        self.openDataBase()
        if let database = DatabaseManager.database {
            if database.open() {
                let updatePassResult = database.executeUpdate(updatepassQuery, withArgumentsIn: [strPass,strEmail])
                if !updatePassResult {
                    print("Error updating data: \(database.lastErrorMessage())")
                }else{
                    //completion(true,"")
                    print("Data Updated")
                    
                }
                return updatePassResult
            }
        }
        return false
    }

    func getimage(image_path:String){
        
    }
}
