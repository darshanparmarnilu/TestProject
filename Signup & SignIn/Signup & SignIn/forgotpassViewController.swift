//
//  forgotpassViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 24/03/23.
//

import UIKit

class forgotpassViewController: UIViewController {
    
    var u_ID = ""
    
    //@IBOutlet var activity: UIActivityIndicatorView!
    @IBOutlet var subview: UIView!
    
    @IBOutlet var brnupdate: UIButton!
    @IBOutlet var txtconfirmpass: UITextField!
    @IBOutlet var txtnewpass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .clear
        
        subview.layer.masksToBounds = true
        subview.layer.cornerRadius = 25
        
        brnupdate.layer.masksToBounds = true
        brnupdate.layer.cornerRadius = 16
        brnupdate.tintColor = .white
        
        txtnewpass.layer.masksToBounds = true
        txtnewpass.layer.cornerRadius = 15
        txtnewpass.layer.borderColor = UIColor.black.cgColor
        txtnewpass.layer.borderWidth = 0.5
        
        txtconfirmpass.layer.masksToBounds = true
        txtconfirmpass.layer.cornerRadius = 15
        txtconfirmpass.layer.borderColor = UIColor.black.cgColor
        txtconfirmpass.layer.borderWidth = 0.5
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.getData()
    }

    @IBAction func updatepass(_ sender: UIButton) {
        if(txtnewpass.text! == txtconfirmpass.text!){
            DatabaseManager.shared.updateforpass(strID: self.u_ID, strPass: self.txtconfirmpass.text!, completion:{ success, msg in
                if success == true{
                    print("Password Updated")
                }
                else{
                    print("Password Does Not Updated")
                }
                self.dismiss(animated: true)
            })
        }else{
            print("Password Does Not Same")
        }
    }

}

extension forgotpassViewController{
    func getData(){
                    getDataFromDefaults { success, id, firstname, lastname, email, password, mobileno, aboutme,imgUrl   in
                        
                                if success == true {
                                    self.u_ID = id
                                }else {
                                    //No data found
                                }
                   }
              }
}
