//
//  profileViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 09/03/23.
//

import UIKit
import Toast_Swift
import SideMenu

class profileViewController: UIViewController {
    
    // MARK :- IBOutlet
    
    @IBOutlet var txtdateofbirth: UITextField!
    @IBOutlet var txtgender: UITextField!
    @IBOutlet var txtcity: UITextField!
    @IBOutlet var txtstate: UITextField!
    @IBOutlet var txtcountry: UITextField!
    @IBOutlet var txtbirthtime: UITextField!
    @IBOutlet var lblgender: UILabel!
    @IBOutlet var lblcity: UILabel!
    @IBOutlet var lblstate: UILabel!
    @IBOutlet var lblcountry: UILabel!
    @IBOutlet var lblbirthtime: UILabel!
    @IBOutlet var lbldateofbirth: UILabel!
    @IBOutlet var profileimg: UIImageView!
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
    
    // View Did Load Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK :- User Intraction
        
        profileimg.isUserInteractionEnabled = false
        profileimg.layer.masksToBounds = true
        profileimg.layer.cornerRadius = 40
        profileimg.layer.borderWidth = 2
        profileimg.layer.borderColor = UIColor(red: 5/255, green: 28/255, blue: 107/255, alpha: 1).cgColor
        
        self.txtfirst.isUserInteractionEnabled = false
        self.txtlast.isUserInteractionEnabled = false
        self.txtemail.isUserInteractionEnabled = false
        self.txtmobile.isUserInteractionEnabled = false
        self.txtaboutme.isUserInteractionEnabled = false
        self.txtdateofbirth.isUserInteractionEnabled = false
        self.txtbirthtime.isUserInteractionEnabled = false
        self.txtcountry.isUserInteractionEnabled = false
        self.txtstate.isUserInteractionEnabled = false
        self.txtcity.isUserInteractionEnabled = false
        self.txtgender.isUserInteractionEnabled = false
        
        self.subview.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        self.view.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        lblprofile.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblfirst.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lbllast.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblemail.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblmobile.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        
        lblaboutme.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        //lbledit.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lbldateofbirth.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblbirthtime.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblcountry.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblstate.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblcity.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblgender.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        
    // UnderLine Function For TextField
        
        txtfirst.underlined()
        txtlast.underlined()
        txtemail.underlined()
        txtmobile.underlined()
        txtaboutme.underlined()
        txtdateofbirth.underlined()
        txtbirthtime.underlined()
        txtcountry.underlined()
        txtstate.underlined()
        txtcity.underlined()
        txtgender.underlined()
        
        txtfirst.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtlast.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtemail.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        txtmobile.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtaboutme.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtdateofbirth.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtbirthtime.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtcountry.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtstate.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtcity.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtgender.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        self.reloadInputViews()
    }
    
    // View Will Appear Function
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.getData()
    }
    
    // Open Menu Action Button
    
    @IBAction func Menu(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuNavigationController") as! SideMenuNavigationController
        if UIDevice.current.userInterfaceIdiom == .pad{
            vc.settings.menuWidth = self.view.frame.width - 200
        }else{
            vc.settings.menuWidth = self.view.frame.width - 80
        }
        vc.settings.presentationStyle = .viewSlideOut
        vc.settings.statusBarEndAlpha = 0
        vc.leftSide = true
        present(vc, animated: true, completion: nil)
    }
    
    // MARK:- Get user Data from userDefaults
    
    func getData() {
        getDataFromDefaults { success, id, firstname, lastname, email, password, mobileno, aboutme, userImage,userDateofBirth,userBirthTime,userCountry,userState,userCity,userGender     in
            if success == true {
                self.txtfirst.text = firstname
                self.txtlast.text = lastname
                self.txtemail.text = email
                self.txtmobile.text = mobileno
                self.txtaboutme.text = aboutme
                let urlString = userImage
                if let url = URL(string: urlString) {
                    print(url)
                    let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
                    let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent(url.lastPathComponent)
                    let fullDestPathString = fullDestPath!.path
                    self.profileimg.image = UIImage(contentsOfFile: fullDestPathString)
                } else {
                    print("Invalid URL")
                }
                self.txtdateofbirth.text = userDateofBirth
                self.txtbirthtime.text = userBirthTime
                self.txtcountry.text = userCountry
                self.txtstate.text = userState
                self.txtcity.text = userCity
                self.txtgender.text = userGender
            }else {
                //No data found
            }
        }
    }
}

// Text Filed Extention (UnderLine Funcrion)

extension UITextField{
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height-width, width:  self.frame.size.width*3, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
