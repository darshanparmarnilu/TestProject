//
//  ViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 07/03/23.
//

import UIKit
import SQLite3
import Toast_Swift
class ViewController: UIViewController {
    
    // MARK :- Variables
    
    var db: OpaquePointer?
    var checkbtn:Bool! = false
    var txtEmail:UITextField!
    var email = ""
    
    // Welcome Darshan
    
    // MARK :- IBOutlet
    //@IBOutlet var lbldonot: UILabel!
    //@IBOutlet var lblremember: UILabel!
    @IBOutlet var lblsignin: UILabel!
    @IBOutlet var btnsignup: UIButton!
    @IBOutlet var btnlogin: UIButton!
    @IBOutlet var btncheck: UIButton!
    @IBOutlet var btnforword: UIButton!
    @IBOutlet var txtpass: UITextField!
    @IBOutlet var txtemail: UITextField!
    
    // MARK :- viewlife cycle Methods viewDidload a method jyare view load thay tyare 1 var call thase
    override func viewDidLoad() {
        super.viewDidLoad()
        //This is a Dharmesh comments
        
        txtemail.delegate = self
        txtpass.delegate = self
        
        sendprofile()

        self.view.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        lblsignin.font = UIFont(name: "Inter-Medium", size: 30)
        lblsignin.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        
        
        txtemail.layer.masksToBounds = true
        txtemail.layer.cornerRadius = 20
        txtemail.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        txtemail.layer.borderWidth = 0.5
        txtemail.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        
        txtpass.layer.masksToBounds = true
        txtpass.layer.cornerRadius = 20
        txtpass.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        txtpass.layer.borderWidth = 0.5
        txtpass.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        btnlogin.layer.masksToBounds = true
        btnlogin.layer.cornerRadius = 20
        btnlogin.layer.borderColor = UIColor.black.cgColor
        btnlogin.layer.borderWidth = 1
        btnlogin.backgroundColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        
        //btnlogin.titleLabel?.font =  UIFont(name: "Inter-Medium", size: 22)
        
        
       // btnforword.titleLabel?.font = UIFont(name: "Inter-Medium", size: 17)
       // btnforword.titleLabel?.textColor = UIColor(red: 0/256, green: 26/256, blue: 255/256, alpha: 1)
        
        //btnsignup.titleLabel?.font = UIFont(name: "Inter-Medium", size: 19)
        //btnsignup.titleLabel?.textColor = UIColor(red: 0/256, green: 26/256, blue: 255/256, alpha: 1)
        
        //lblremember.textColor = UIColor(red: 0.5/256, green: 0.5/256, blue: 0.5/256, alpha: 0.5)
        
       // lbldonot.textColor = UIColor(red: 0.5/256, green: 0.5/256, blue: 0.5/256, alpha: 0.5)
        //lbldonot.font = UIFont(name: "Inter-Medium", size: 19)
        
        btncheck.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
       
        self.reloadInputViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        txtemail.text = ""
        txtpass.text = ""
    }
    
    
    // MARK :- Button Action

    @IBAction func forgotpass(_ sender: UIButton) {
        verifyEmail()
           }
    
    @IBAction func checkbtn(_ sender: UIButton) {
        
        btncheck.isSelected = !btncheck.isSelected

        let user_Defaults = UserDefaults.standard
        user_Defaults.set(btncheck.isSelected, forKey: "rememberMe")
        
//        if (checkbtn == false){
//            if let image = UIImage(named:"checking.png"){
//                btncheck.setBackgroundImage(image, for: .normal)
//            }
//            checkbtn = true
//        }else{
//            if let image = UIImage(named: "unchecking.png"){
//                btncheck.setBackgroundImage(image, for: .normal)
//            }
//            checkbtn = false
//        }
        
    }
    
    @IBAction func login(_ sender: UIButton) {
        let result = DatabaseManager.shared.checkemail(email: txtemail.text!)
         if(txtemail.text == ""){
            Alert(strmessage: "Please Enter Email")
         }else if(txtpass.text == ""){
             Alert(strmessage: "Please Enter Password")
         }
        else if(txtemail.text?.isValidEmail) == false {
            self.txtemail.text = ""
            self.txtpass.text = ""
            Alert(strmessage: "Invalid Email, Try Again...")
        }
        else if result == false{
            
            Alert(strmessage: "User Not Found")
            txtpass.text = ""
            txtemail.text = ""
        }
        else if(txtpass.text?.isPasswordValid) == false{
            Alert(strmessage: "Invalid Password...Try Again")
        }
        else{
          let result = DatabaseManager.shared.login(email:txtemail.text!,pass:txtpass.text!)
            if result{
//                            let nextVC = self.storyboard?.instantiateViewController(identifier: "profileViewController") as! profileViewController
//                            self.navigationController?.pushViewController(nextVC, animated: true)
                
//                let myTabbar = self.storyboard?.instantiateViewController(withIdentifier: "myTabbar") as! UITabBarController
//
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//                appDelegate.window?.rootViewController = myTabbar\
                let myTabbar = self.storyboard?.instantiateViewController(withIdentifier: "myTabbar") as! UITabBarController

                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                    let appDelegate = windowScene.delegate as? SceneDelegate {
                    appDelegate.window?.rootViewController = myTabbar
                }
                
                
            }else if result == false{
                self.Alert(strmessage: "Incorrect Password...")
                txtpass.text = ""
                
            }
        }
    }

    @IBAction func signup(_ sender: UIButton) {
        
        let detail:SignUpViewController = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        
        self.navigationController?.pushViewController(detail, animated: true)
    }

}

// MARK:- Extention

extension String{
    var isPasswordValid:Bool{
        let passRegEx = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{6,8}$"
        let passPred = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        return passPred.evaluate(with: self)
    }
    var isValidEmail :Bool{
        let emailRehEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRehEx)
        return emailTest.evaluate(with: self)
    }
}

extension ViewController{
 
    func Alert(strmessage:String){
        let alert = UIAlertController(title: "Alert", message: strmessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // if Remember Me Button Is Selected Then Automatically Send On Profile Image
    
    func sendprofile(){
        let user_Defaults = UserDefaults.standard

            if user_Defaults.bool(forKey: "rememberMe") {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let homeVC = storyboard.instantiateViewController(withIdentifier: "profileViewController") as! profileViewController
//                navigationController?.pushViewController(profileVC, animated: false)
                
                let myTabbar = self.storyboard?.instantiateViewController(withIdentifier: "myTabbar") as! TabbarViewController
                navigationController?.pushViewController(myTabbar, animated: true)
//                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//                    let appDelegate = windowScene.delegate as? SceneDelegate {
//                    appDelegate.window?.rootViewController = myTabbar
//                }
            }
    }
    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}

extension ViewController{
    
    
    func verifyEmail(){
        let alerBox = UIAlertController(title: "Verify Your Email", message: "", preferredStyle: .alert)
        let update = UIAlertAction(title: "Verify", style: .default) { [self] (action) in
            
            
            if self.txtemail!.text == ""
            {
                self.Alert(strmessage: "Please Enter Email")
            }else if(txtemail.text?.isValidEmail) == false {
                Alert(strmessage: "Invalid Email Formate, Try Again...")
            }
            //else if (testStr: (txtemail?.text!)! ) ==  false
//            else if (isValidEmail:txtemail.text!) ==  false{
//                self.createAlert(strAlert: "Please Enter Valid email")
//            }
            else
            {
                let loader = self.loader()
                self.email = txtemail.text!
                let result = DatabaseManager.shared.checkemail(email: txtemail.text!)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.45){
                    self.stopLoad(loader: loader)
                }
               
                DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                   
                    if result == true{
                        let animate = self.storyboard?.instantiateViewController(withIdentifier: "forupdatepassViewController") as! forupdatepassViewController
                        //self.present(animate, animated: true, completion: nil)
                        self.present(animate, animated: true)
//                        self.view.addSubview(animate.view)
                       animate.emailID = self.email
//                        animate.didMove(toParent: self)
//                        self.addChild(animate)
                    }else{
                        self.Alert(strmessage: "Email Not Exist")
                    }
                    
                  //  self.stopLoad(loader: loader)
                }
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Edit option cancel by user")
        }
        
        alerBox.addAction(update)
        alerBox.addAction(cancel)
        alerBox.addTextField { (textfield) in
            self.txtemail = textfield
           
            self.txtemail?.placeholder = "Enter email"
            //self.txtemail?.setBottomBorder(color: "#3EFE46")
        }
        self.present(alerBox, animated: true, completion: nil)
    }
    
    
}


extension ViewController{
    func loader()->UIAlertController{
        let alert = UIAlertController(title:"\t"+"\t"+"Fetching your email...", message: "\t"+"Please Wait...", preferredStyle: .alert)
        alert.view.tintColor = UIColor.red
        let attributedString = NSAttributedString(string: "\t"+"\t"+"Fetching your email...", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor(red: 10/256, green: 88/256, blue: 246/256, alpha: 1)
        ])
        alert.setValue(attributedString, forKey: "attributedTitle")
        
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 25, y: 15, width: 50, height: 50))
        indicator.color = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        indicator.hidesWhenStopped = true
        indicator.style = UIActivityIndicatorView.Style.large
        indicator.startAnimating()
        alert.view.addSubview(indicator)
        present(alert, animated: true, completion: nil)
        return alert
        
    }
    
    func stopLoad(loader:UIAlertController) {
        DispatchQueue.main.async {
            loader.dismiss(animated: true, completion: nil)
        }
    }
}

extension ViewController:UITextFieldDelegate{
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if txtpass.text!.count >= 8{
//        return false
//        }else if txtemail.text!.count >= 16{
//            return false
//        }
//        return true
//    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
//                           replacementString string: String) -> Bool
//    {
//        if textField == txtpass{
//            let maxLength = 8
//            let currentString: NSString = txtpass.text! as NSString
//            let newString: NSString =
//            currentString.replacingCharacters(in: range, with: string) as NSString
//            return newString.length <= maxLength
//        }else{
//            return true
//        }
//    }
    
    
    
}

