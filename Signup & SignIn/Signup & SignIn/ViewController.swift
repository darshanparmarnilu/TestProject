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
    var rememberMeFlag = false
    
    // MARK :- IBOutlet
    
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
        
        txtemail.delegate = self
        txtpass.delegate = self
        
        self.hideKeyboard()
        
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
        
        btncheck.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        self.reloadInputViews()
    }
    
    // View Will Appear Method
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        txtemail.text = ""
        txtpass.text = ""
    }
    
    
    // MARK :- Forgot Password Action Button
    
    @IBAction func forgotpass(_ sender: UIButton) {
        verifyEmail()
    }
    
    // RememberMe Action Button
    
    @IBAction func checkbtn(_ sender: UIButton) {
        btncheck.isSelected = !btncheck.isSelected
        
    }
    
    // Login Action Button
    
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
                
                let myTabbar = self.storyboard?.instantiateViewController(withIdentifier: "myTabbar") as! UITabBarController
                
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let appDelegate = windowScene.delegate as? SceneDelegate {
                    appDelegate.window?.rootViewController = myTabbar
                }
                if self.btncheck.isSelected == true {
                    let user_Defaults = UserDefaults.standard
                    user_Defaults.set(btncheck.isSelected, forKey: "rememberMe")
                }else {
                    let user_Defaults = UserDefaults.standard
                    user_Defaults.set(btncheck.isSelected, forKey: "rememberMe")
                }
            }else if result == false{
                self.Alert(strmessage: "Incorrect Password...")
                txtpass.text = ""
                
            }
        }
    }
    
    // Sign Up Action Button
    
    @IBAction func signup(_ sender: UIButton) {
        let detail:SignUpViewController = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

// MARK:- String Extention (TextField Validation)

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
    
    // Alert Control For Veriyft Email
    
    func verifyEmail(){
        let alerBox = UIAlertController(title: "Verify Your Email", message: "", preferredStyle: .alert)
        let update = UIAlertAction(title: "Verify", style: .default) { [self] (action) in
            
            
            if self.txtemail!.text == ""
            {
                self.Alert(strmessage: "Please Enter Email")
            }else if(txtemail.text?.isValidEmail) == false {
                Alert(strmessage: "Invalid Email Formate, Try Again...")
            }else{
                let loader = self.loader()
                self.email = txtemail.text!
                let result = DatabaseManager.shared.checkemail(email: txtemail.text!)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.45){
                    self.stopLoad(loader: loader)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                    
                    if result == true{
                        let animate = self.storyboard?.instantiateViewController(withIdentifier: "forupdatepassViewController") as! forupdatepassViewController
                        self.present(animate, animated: true)
                        animate.emailID = self.email
                    }else{
                        self.Alert(strmessage: "Email Not Exist")
                    }
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
        }
        self.present(alerBox, animated: true, completion: nil)
    }
    
    // Loader For Forgot Password (Fetching Email)
    
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
    
    // Alert Control Alert Message
    
    func Alert(strmessage:String){
        let alert = UIAlertController(title: "Alert", message: strmessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Send Progile For HomePage
    
    func sendprofile(){
        let user_Defaults = UserDefaults.standard
        if user_Defaults.bool(forKey: "rememberMe") {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myTabbar = self.storyboard?.instantiateViewController(withIdentifier: "myTabbar") as! TabbarViewController
            navigationController?.pushViewController(myTabbar, animated: true)
        }
    }
}

// TextField Delegete For Character Range

extension ViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        if textField == txtpass{
            let maxLength = 24
            let currentString: NSString = txtpass.text! as NSString
            let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }else{
            return true
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

