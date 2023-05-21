//
//  forupdatepassViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 27/03/23.
//

import UIKit
import Toast_Swift

class forupdatepassViewController: UIViewController {
    
    //IB-OutLets
    
    @IBOutlet var btnupdate: UIButton!
    @IBOutlet var txtconfirmpass: UITextField!
    @IBOutlet var txtnewpass: UITextField!
    @IBOutlet var subview: UIView!
    @IBOutlet var mainview: UIView!
    
    var emailID = ""
    
    // View DidLoad Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboard()
        
        addAanimation()
        dropShadow()
        self.mainview.backgroundColor = .clear
        
        txtnewpass.delegate = self
        txtconfirmpass.delegate = self
        
        txtconfirmpass.underline()
        txtnewpass.underline()
        
        btnupdate.layer.masksToBounds = true
        btnupdate.layer.cornerRadius = 18
        
    }
    
    // View Will Apper Method
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    // TouchEnded Event Dismis View
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.dismiss(animated: true)
    }
    
    // Update Password Action Button
    
    @IBAction func update(_ sender: UIButton) {
        let loader = self.loader()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.45){
            self.stopLoad(loader: loader)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){ [self] in
            if(txtnewpass.text == "" || txtconfirmpass.text == ""){
                viewAlert(withTitle: "Alert ", message: "Please Enter Valid Password ")
            }else if self.txtnewpass.text?.passvalid == false{
                viewAlert(withTitle:"Alert" , message: "Please Enter Valid New Password Like [0-9a-zA-Z!@#$%^&*()] ")
            }else if self.txtconfirmpass.text?.passvalid == false{
                viewAlert(withTitle:"Alert" , message: "Please Enter Valid Confirm Password Like [0-9a-zA-Z!@#$%^&*()] ")
            }
            else if (self.txtnewpass.text! == self.txtconfirmpass.text!){
                DatabaseManager.shared.updateforpass(strEmail: self.emailID, strPass:self.txtconfirmpass.text! )
                showAlert(withTitle: "Done", message: "Password Updated")
            }else if(self.txtnewpass.text! != self.txtconfirmpass.text!){
                viewAlert(withTitle: "Alert", message:"Password Does Not Match" )
                print("Password Does Not Match")
            }
        }
    }
    
    // Shadow Funtion
    
    func dropShadow() {
        subview.layer.masksToBounds = false
        subview.layer.shadowColor = UIColor.black.cgColor
        subview.layer.shadowOpacity = 0.9
        subview.layer.shadowOffset = .zero
        subview.layer.shadowRadius = 5
        subview.layer.shouldRasterize = true
    }
    
    // Add Animation Function

    func addAanimation(){
        self.subview.transform = CGAffineTransform(translationX: 0, y: self.subview.frame.height)
        UIView.animate(withDuration: 1,animations:{
            self.subview.transform = .identity
        })
    }
    
    // Remove Animation Function
    
    func removeAanimation(){
        self.subview.transform = .identity
        UIView.animate(withDuration: 0.8,animations:{
            self.subview.transform = CGAffineTransform(translationX: 0, y: self.subview.frame.height)
        }){ complete in
            self.view.removeFromSuperview()
        }
    }
    
    // Loader Function
    
    func loader()->UIAlertController{
        let alert = UIAlertController(title: "\t"+"\t"+"Updating your data...", message: "\t"+"Please Wait..", preferredStyle: .alert)
        alert.view.tintColor = .red
        let attributedString = NSAttributedString(string: "\t"+"\t"+"Updating your data...", attributes: [
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
    
    // Stop Loader Function
    
    func stopLoad(loader:UIAlertController) {
        DispatchQueue.main.async {
            loader.dismiss(animated: true, completion: nil)
        }
    }
    
    // Alert Function Without Dismiss
    
    func viewAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            //self.dismiss(animated: true)
            NSLog("The \"OK\" alert occurred.")
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // Alert Function With Dismiss
    
    func showAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            self.dismiss(animated: true)
            NSLog("The \"OK\" alert occurred.")
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

    // UITextField Delegate

extension forupdatepassViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtnewpass{
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
}

    // UIView Controller Function

extension UIViewController{
    func hideKeyboard(){
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
