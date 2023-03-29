//
//  changepassViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 20/03/23.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        view.sendSubviewToBack(blurEffectView)
        
        mainview.backgroundColor = .clear
        
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
        
    }
    override func viewWillAppear(_ animated: Bool) {
       
    }
    @IBAction func cancel(_ sender: UIButton) {
        
        self.dismiss(animated: true)

    }
    
    @IBAction func update(_ sender: UIButton) {
        
        if(txtoldpass.text == "" || txtnewpass.text == "" || txtconfirmpass.text == ""){
            Alertmsg(strMsgAlert: "Please Enter Valid Detial", strtitle:"Alert" )
        }else if(txtnewpass.text?.passvalid)==false{
            Alertmsg(strMsgAlert: "Please Enter Valid New Password", strtitle: "Alert")
        }else if(txtconfirmpass.text?.passvalid) == false{
            Alertmsg(strMsgAlert: "Invalid Confirm Password", strtitle: "Alert")
        }else {
            let result = DatabaseManager.shared.checkpass(password: txtoldpass.text!)
              if result == true{
                  if(txtnewpass.text == txtconfirmpass.text) {
                      print("Password Updated")
                      DatabaseManager.shared.updatepass(strPass: txtconfirmpass.text!, strID:u_Id)
                     
                      self.dismiss(animated: true)
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




