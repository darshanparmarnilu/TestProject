//
//  MenuBarViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 11/04/23.
//

import UIKit
import MessageUI

class MenuBarViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var user_id = ""
    
    @IBOutlet var lblMobileNo: UILabel!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var logout: UIButton!
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        edit.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(edit, animated: false)
    }
    @IBAction func ChangePass(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "changepassViewController") as! changepassViewController
        controller.delegate = self
        controller.modalPresentationStyle = .overFullScreen
        controller.hidesBottomBarWhenPushed = true
        controller.u_Id = self.user_id
        self.present(controller, animated: true)
    }
    @IBAction func share(_ sender: UIButton) {
        if let name = URL(string: "https://itunes.apple.com/us/app/myapp/idxxxxxxxx?ls=1&mt=8"), !name.absoluteString.isEmpty {
            let objectsToShare = [name]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
        } else {
            // show alert for not available
        }
    }
    @IBAction func ContactUs(_ sender: UIButton) {
        contactUs()
    }
    
    func contactUs() {
        let email = "darshanparmar.nilu@gmail.com" // insert your email here
        let subject = "your subject goes here"
        let bodyText = "your body text goes here"
        // https://developer.apple.com/documentation/messageui/mfmailcomposeviewcontroller
        if MFMailComposeViewController.canSendMail() {
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
            mailComposerVC.setToRecipients([email])
            mailComposerVC.setSubject(subject)
            mailComposerVC.setMessageBody(bodyText, isHTML: false)
            self.present(mailComposerVC, animated: true, completion: nil)
        } else {
            print("Device not configured to send emails, trying with share ...")
            let coded = "mailto:\(email)?subject=\(subject)&body=\(bodyText)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            if let emailURL = URL(string: coded!) {
                if #available(iOS 10.0, *) {
                    if UIApplication.shared.canOpenURL(emailURL) {
                        UIApplication.shared.open(emailURL, options: [:], completionHandler: { (result) in
                            if !result {
                                print("Unable to send email.")
                            }
                        })
                    }
                }
                else {
                    UIApplication.shared.openURL(emailURL as URL)
                }
            }
        }
    }
    
    @IBAction func logout(_ sender: UIButton) {
        
        let user_defaults = UserDefaults.standard
        user_defaults.removeObject(forKey: "username")
        user_defaults.removeObject(forKey: "password")
        user_defaults.set(false, forKey: "rememberMe")
        let navigate = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigate.modalPresentationStyle = .overFullScreen
        navigate.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(navigate, animated: true)
    }
    
    func getData(){
        getDataFromDefaults {success , id, firstname, lastname, email, password, mobileno,aboutme,userImage,userDateofBirth,userBirthTime,userCountry,userState,userCity,userGender  in
            if success == true{
                self.user_id = id
                self.lblUserName.text = firstname
                self.lblMobileNo.text = mobileno
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

extension MenuBarViewController:Push{
    func pushVC() {
        DispatchQueue.main.async {
            self.tabBarController?.tabBar .isHidden = true
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
