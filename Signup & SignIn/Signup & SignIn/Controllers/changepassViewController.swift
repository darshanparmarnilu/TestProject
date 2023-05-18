//
//  changepassViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 20/03/23.
//

import UIKit
import Toast_Swift

// Protocol

protocol Push{
    func pushVC()
}

class changepassViewController: UIViewController {
    //Mark:- IBOutlets
    
    var u_Id = ""
    
    @IBOutlet var mainview: UIView!
    @IBOutlet var subview: UIView!
    @IBOutlet var lblconfirm: UILabel!
    @IBOutlet var lblnew: UILabel!
    @IBOutlet var lblold: UILabel!
    @IBOutlet var txtoldpass: UITextField!
    @IBOutlet var txtconfirmpass: UITextField!
    @IBOutlet var txtnewpass: UITextField!
    @IBOutlet var btnupdate: UIButton!
    @IBOutlet var cancelbtn: UIButton!
    
    var delegate:Push!          // Call The Protocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboard()
        subview.layer.masksToBounds = true
        subview.layer.cornerRadius = 25
        
        txtoldpass.underline()
        txtnewpass.underline()
        txtconfirmpass.underline()
        
        txtoldpass.font = UIFont.systemFont(ofSize: 22)
        txtnewpass.font = UIFont.systemFont(ofSize: 22)
        txtconfirmpass.font = UIFont.systemFont(ofSize: 22)
        
        lblold.textColor = .darkGray
        lblnew.textColor = .darkGray
        lblconfirm.textColor = .darkGray
        
        btnupdate.layer.masksToBounds = true
        btnupdate.layer.cornerRadius = 16
        
        txtoldpass.delegate = self
        txtnewpass.delegate = self
        txtconfirmpass.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func update(_ sender: UIButton) {
        let result = DatabaseManager.shared.checkpass(password: self.txtoldpass.text!)
        if(self.txtoldpass.text == "" || self.txtnewpass.text == "" || self.txtconfirmpass.text == ""){
            self.Alertmsg(strMsgAlert: "Please Enter Valid Detial", strtitle:"Alert" )
        }else if result == false{
            self.Alertmsg(strMsgAlert: "Old Password Not Found", strtitle: "Alert")
        }else if(self.txtnewpass.text?.passvalid)==false{
            self.Alertmsg(strMsgAlert: "Please Enter Valid New Password Like [0-9a-zA-Z!@#$%^&*()]", strtitle: "Alert")
        }else if(self.txtconfirmpass.text?.passvalid) == false{
            self.Alertmsg(strMsgAlert: "Invalid Confirm Password Like [0-9a-zA-Z!@#$%^&*()]", strtitle: "Alert")
        }else {
            let result = DatabaseManager.shared.checkpass(password: self.txtoldpass.text!)
            if result == true{
                if(self.txtnewpass.text == self.txtconfirmpass.text) {
                    print("Password Updated")
                    DatabaseManager.shared.updatepass(strPass: self.txtconfirmpass.text!, strID:self.u_Id)
                    viewAlert(withTitle: "Done", message: "Password Updated")
                }else{
                    self.Alertmsg(strMsgAlert: "Password Miss Match, Try Again....", strtitle: "Alert")
                }
            }else if result == false{
                self.Alertmsg(strMsgAlert: "Not Found Data", strtitle: "Alert")
            }
        }
    }
    
    // Alert Control Function
    
    func Alertmsg(strMsgAlert:String,strtitle:String){
        let alert = UIAlertController(title: strtitle, message: strMsgAlert, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func viewAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            self.dismiss(animated: false)
            let user_defaults = UserDefaults.standard
            user_defaults.removeObject(forKey: "username")
            user_defaults.removeObject(forKey: "password")
            user_defaults.set(false, forKey: "rememberMe")
            
            let viewControllerToPush = ViewController() // Replace with your desired view controller
            self.delegate?.pushVC()
            viewControllerToPush.modalPresentationStyle = .overFullScreen
            viewControllerToPush.hidesBottomBarWhenPushed = true
            NSLog("The \"OK\" alert occurred.")
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
extension UITextField{
    func underline(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
extension changepassViewController{
    func loader()->UIAlertController{
        let alert = UIAlertController(title: "\t"+"\t"+"Updating your Password...", message: "\t"+"Please Wait..", preferredStyle: .alert)
        alert.view.tintColor = .red
        let attributedString = NSAttributedString(string: "\t"+"\t"+"Updating Password...", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor(red: 10/256, green: 88/256, blue: 246/256, alpha: 1)])
        alert.setValue(attributedString, forKey: "attributedTitle")
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 25, y: 15, width: 50, height: 50))
        indicator.color = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        //        indicator.backgroundColor = .darkGray
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
extension changepassViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtoldpass{
            let maxLength = 8
            let currentString: NSString = txtoldpass.text! as NSString
            let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }else if textField == txtnewpass{
            let maxLength = 8
            let currentString: NSString = txtnewpass.text! as NSString
            let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }else if textField == txtconfirmpass{
            let maxLength = 8
            let currentString: NSString = txtconfirmpass.text! as NSString
            let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
