//
//  MenuBarViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 11/04/23.
//

import UIKit


class MenuBarViewController: UIViewController {
    
    
    var user_id = ""
    
    @IBOutlet var lblMobileNo: UILabel!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var logout: UIButton!
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //leadingConstraint.constant = -293
        
        self.view.backgroundColor = .clear
        logout.layer.masksToBounds = true
        logout.layer.cornerRadius = 20
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 45
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
    @IBAction func EditProfile(_ sender: UIButton) {
        let edit = self.storyboard?.instantiateViewController(withIdentifier: "EditprofileViewController") as! EditprofileViewController
        edit.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(edit, animated: true)
    }
    
    @IBAction func ChangePass(_ sender: UIButton) {

//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let viewController = storyboard.instantiateViewController(withIdentifier: "changepassViewController") as! changepassViewController
//                viewController.modalPresentationStyle = .overCurrentContext
//                viewController.modalTransitionStyle = .crossDissolve
//                viewController.u_Id = self.user_id
//                self.present(viewController, animated: true, completion: nil)
//        }
//        self.dismiss(animated: true)
//        self.delegateChangePass?.changePassword?()
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "changepassViewController") as! changepassViewController
        controller.modalPresentationStyle = .overFullScreen
        controller.u_Id = self.user_id
        self.present(controller, animated: true)
        
    }
    
    @IBAction func share(_ sender: UIButton) {
        let shareText = "Check out this cool app!"
          let shareURL = URL(string: "https://www.example.com")!

          let activityViewController = UIActivityViewController(activityItems: [shareText, shareURL], applicationActivities: nil)

          // Present the share sheet
          self.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func ContactUs(_ sender: UIButton) {
        
    }
    
    @IBAction func logout(_ sender: UIButton) {
        let user_defaults = UserDefaults.standard
        user_defaults.removeObject(forKey: "username")
        user_defaults.removeObject(forKey: "password")
        user_defaults.set(false, forKey: "rememberMe")
        //            self.navigationController?.popViewController(animated: true)
        let navigate = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.navigationController?.pushViewController(navigate, animated: true)
        
    }
    
    func getData(){
        getDataFromDefaults {success , id, firstname, lastname, email, password, mobileno,aboutme,userImage,userDateofBirth,userBirthTime,userCountry,userState,userCity,userGender  in
            if success == true{
               
                self.user_id = id
                self.lblUserName.text = firstname
                self.lblMobileNo.text = mobileno
                
                // For Progile Image
                
                let urlString = userImage
                if let url = URL(string: urlString) {
                  print(url)
                                    
                let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
                let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent(url.lastPathComponent)
                let fullDestPathString = fullDestPath!.path
                self.image.image = UIImage(contentsOfFile: fullDestPathString)
                } else {
                    print("Invalid URL")
                     }
            }
        }
    }
}
