//
//  forupdatepassViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 27/03/23.
//

import UIKit
import Toast_Swift

class forupdatepassViewController: UIViewController {

    @IBOutlet var btnupdate: UIButton!
    @IBOutlet var txtconfirmpass: UITextField!
    @IBOutlet var txtnewpass: UITextField!
    @IBOutlet var subview: UIView!
    @IBOutlet var mainview: UIView!
    
    var emailID = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAanimation()
        dropShadow()
        self.mainview.backgroundColor = .clear
        
        txtnewpass.delegate = self
        txtconfirmpass.delegate = self
        
        txtnewpass.layer.masksToBounds = true
        txtnewpass.layer.cornerRadius = 16
        txtnewpass.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        txtnewpass.layer.borderWidth = 0.5
        txtnewpass.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtnewpass.font = UIFont(name:"Inter-Medium", size: 20)
        txtnewpass.layer.borderWidth = 1
        txtnewpass.layer.borderColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1).cgColor
        
        txtconfirmpass.layer.masksToBounds = true
        txtconfirmpass.layer.cornerRadius = 16
        txtconfirmpass.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        txtconfirmpass.layer.borderWidth = 0.5
        txtconfirmpass.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtconfirmpass.font = UIFont(name:"Inter-Medium", size: 20)
        txtconfirmpass.layer.borderWidth = 1
        txtconfirmpass.layer.borderColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1).cgColor
        
        btnupdate.layer.masksToBounds = true
        btnupdate.layer.cornerRadius = 18
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //self.getData()
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.dismiss(animated: true)
    }
    
    
    @IBAction func update(_ sender: UIButton) {
        
       // print("update")
        let loader = self.loader()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.45){
            self.stopLoad(loader: loader)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){ [self] in
            if(txtnewpass.text == "" || txtconfirmpass.text == ""){
                self.dismiss(animated: true,completion: nil)
                    self.Alertmsg(strMsgAlert: "Please Enter Valid Password ", strtitle: "Alert")
            }else if self.txtnewpass.text?.passvalid == false{
                self.Alertmsg(strMsgAlert: "Please Enter Valid New Password Like [0-9a-zA-Z!@#$%^&*()] ", strtitle: "Alert")
            }else if self.txtconfirmpass.text?.passvalid == false{
                self.Alertmsg(strMsgAlert: "Please Enter Valid Confirm Password Like [0-9a-zA-Z!@#$%^&*()] ", strtitle: "Alert")
            }
           else if (self.txtnewpass.text! == self.txtconfirmpass.text!){
               
                    DatabaseManager.shared.updateforpass(strEmail: self.emailID, strPass:self.txtconfirmpass.text! )
                    self.dismiss(animated: true, completion: nil)
                self.Alertmsg(strMsgAlert: "Password Updated", strtitle: "Done")
                
            }else if(self.txtnewpass.text! != self.txtconfirmpass.text!){
                self.dismiss(animated: true,completion: nil)
                    self.Alertmsg(strMsgAlert: "Password Does Not Update", strtitle: "Alert")
                    
                    print("Password Does Not Match")
                
            }
            
            self.removeAanimation()
            //self.stopLoad(loader: loader)
        }
    }

}


extension forupdatepassViewController {
    func dropShadow() {
        subview.layer.masksToBounds = false
        subview.layer.shadowColor = UIColor.black.cgColor
        subview.layer.shadowOpacity = 0.9
        subview.layer.shadowOffset = .zero
        subview.layer.shadowRadius = 5
        subview.layer.shouldRasterize = true
//        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func addAanimation(){
       
        self.subview.transform = CGAffineTransform(translationX: 0, y: self.subview.frame.height)
        UIView.animate(withDuration: 1,animations:{
            self.subview.transform = .identity
        })

    }
    
    func removeAanimation(){
        self.subview.transform = .identity
        UIView.animate(withDuration: 0.8,animations:{
            self.subview.transform = CGAffineTransform(translationX: 0, y: self.subview.frame.height)
        }){ complete in
            self.view.removeFromSuperview()
        }
    }
    
//    func Pass_Alertmsg(strMsgAlert:String,strtitle:String){
//        let alert = UIAlertController(title: strtitle, message: strMsgAlert, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
//            NSLog("The \"OK\" alert occured.")
//            //self.navigationController?.popViewController(animated: true)
//        }))
//    }
    
    func Alertmsg(strMsgAlert:String,strtitle:String){
        let alert = UIAlertController(title: strtitle, message: strMsgAlert, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
extension forupdatepassViewController{
    func loader()->UIAlertController{
        let alert = UIAlertController(title: "\t"+"\t"+"Updating your data...", message: "\t"+"Please Wait..", preferredStyle: .alert)
        alert.view.tintColor = .red
        let attributedString = NSAttributedString(string: "\t"+"\t"+"Updating your data...", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor(red: 10/256, green: 88/256, blue: 246/256, alpha: 1)
        ])
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
