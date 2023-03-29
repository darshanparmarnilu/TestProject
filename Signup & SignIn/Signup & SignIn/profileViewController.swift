//
//  profileViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 09/03/23.
//

import UIKit

class profileViewController: UIViewController {

    // MARK :- IBOutlet
    
    @IBOutlet var profileimg: UIImageView!
    @IBOutlet var btnlogout: UIButton!
    @IBOutlet var lbledit: UILabel!
    @IBOutlet var subview: UIView!
    @IBOutlet var lblprofile: UILabel!
    @IBOutlet var txtaboutme: UITextField!
    @IBOutlet var txtmobile: UITextField!
   
    @IBOutlet var txtemail: UITextField!
    @IBOutlet var txtlast: UITextField!
    @IBOutlet var txtfirst: UITextField!
    @IBOutlet var lblaboutme: UILabel!
    @IBOutlet var lblmobile: UILabel!
    @IBOutlet var lblpass: UILabel!
    @IBOutlet var lblemail: UILabel!
    @IBOutlet var lbllast: UILabel!
    @IBOutlet var lblfirst: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
// MARK :- User Intraction
        
        profileimg.isUserInteractionEnabled = false
        profileimg.layer.masksToBounds = true
        profileimg.layer.cornerRadius = 56
        
        self.txtfirst.isUserInteractionEnabled = false
        self.txtlast.isUserInteractionEnabled = false
        self.txtemail.isUserInteractionEnabled = false
        
        self.txtmobile.isUserInteractionEnabled = false
        self.txtaboutme.isUserInteractionEnabled = false
        
        self.subview.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        self.view.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        lblprofile.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblfirst.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lbllast.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblemail.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblmobile.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        
        lblaboutme.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lbledit.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        
        txtfirst.underlined()
        txtlast.underlined()
        txtemail.underlined()
        
        txtmobile.underlined()
        txtaboutme.underlined()
        txtfirst.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtlast.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtemail.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        txtmobile.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtaboutme.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        btnlogout.layer.masksToBounds = true
        btnlogout.layer.cornerRadius = 20
        
        self.reloadInputViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.getData()
        
    }

    
    // MARK:- Get user Data from userDefaults
    func getData() {
        
        getDataFromDefaults { success, id, firstname, lastname, email, password, mobileno, aboutme, userImage    in
            if success == true {
                self.txtfirst.text = firstname
                self.txtlast.text = lastname
                self.txtemail.text = email
                // self.txtpass.text = password
                self.txtmobile.text = mobileno
                self.txtaboutme.text = aboutme
               // self.profileimg.image = UIImage(data: userImage)
                let urlString = userImage
//                if let url = URL(string: urlString) {
//                    print(url)
//                    self.profileimg.image = UIImage(contentsOfFile: urlString)
//                } else {
//                    print("Invalid URL")
//                }
                if let url = URL(string: urlString) {
                  print(url)
                                    
                let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
                let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent(url.lastPathComponent)
                let fullDestPathString = fullDestPath!.path
                self.profileimg.image = UIImage(contentsOfFile: fullDestPathString)
                } else {
                    print("Invalid URL")
                     }
                 }else {
                            //No data found
                        }
                    }
                }
            
    // MARK:- Button Action
    @IBAction func navigateback(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func edit(_ sender: Any) {
        let edit = self.storyboard?.instantiateViewController(withIdentifier: "EditprofileViewController") as! EditprofileViewController
        
        self.navigationController?.pushViewController(edit, animated: true)
    }
    
    
    @IBAction func logout(_ sender: UIButton) {
        let user_defaults = UserDefaults.standard
            user_defaults.removeObject(forKey: "username")
            user_defaults.removeObject(forKey: "password")
            user_defaults.set(false, forKey: "rememberMe")
            self.navigationController?.popViewController(animated: true)
    }
}

extension UITextField{
    func underlined(){
            let border = CALayer()
            let width = CGFloat(1.0)
        border.borderColor = UIColor.black.cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
}
