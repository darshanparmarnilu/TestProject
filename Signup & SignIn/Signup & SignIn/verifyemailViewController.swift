//
//  verifyemailViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 24/03/23.
//

import UIKit

class verifyemailViewController: UIViewController {
    
    
    var user_ID=""
    
    
   // @IBOutlet var activity: UIActivityIndicatorView!
    @IBOutlet var btnverify: UIButton!
    @IBOutlet var txtemail: UITextField!
    @IBOutlet var subview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .clear
        
        subview.layer.masksToBounds = true
        subview.layer.cornerRadius = 25
        
        btnverify.layer.masksToBounds = true
        btnverify.layer.cornerRadius = 16
       // btnverify.titleLabel?.textColor = UIColor.white
        btnverify.tintColor = .white
        
        txtemail.layer.masksToBounds = true
        txtemail.layer.cornerRadius = 15
        txtemail.layer.borderColor = UIColor.black.cgColor
        txtemail.layer.borderWidth = 0.5
      //  txtemail.backgroundColor =
        
//        activity.color = .red
//        activity.style = .large


    }

    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func verify(_ sender: UIButton) {
        
        
        let result = DatabaseManager.shared.checkemail(email: txtemail.text!)
        if result == true {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "forgotpassViewController") as! forgotpassViewController
                viewController.modalPresentationStyle = .overCurrentContext
            //viewController.u_ID = self.user_ID
                viewController.modalTransitionStyle = .crossDissolve
                self.present(viewController, animated: true, completion: nil)
        }else{
            print("Data Not Found")
        }
        //self.dismiss(animated: true)
        
//        activity.startAnimating()
//        
//        Timer.scheduledTimer(withTimeInterval: 7, repeats: false) { [weak self] _ in
//            self?.activity.stopAnimating()
//        
//        }
    }
}
