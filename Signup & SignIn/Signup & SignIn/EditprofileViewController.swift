//
//  EditprofileViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 10/03/23.
//

import UIKit

class EditprofileViewController: UIViewController {
    
    
    // MARK:- IBOutlets
    
    @IBOutlet var btncamera: UIButton!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var subview: UIView!
    @IBOutlet var lblabout: UILabel!
    @IBOutlet var lblmobile: UILabel!
    @IBOutlet var lblpass: UILabel!
    @IBOutlet var lblemail: UILabel!
    @IBOutlet var lbllast: UILabel!
    @IBOutlet var lblfirst: UILabel!
    @IBOutlet var lblprofile: UILabel!
    @IBOutlet var btnback: UIButton!
    
    
    @IBOutlet var txtfirst: UITextField!
    @IBOutlet var txtabout: UITextField!
    @IBOutlet var txtmobile: UITextField!
    //@IBOutlet var txtpass: UITextField!
    @IBOutlet var txtemail: UITextField!
    @IBOutlet var txtlast: UITextField!
    
    @IBOutlet var btnupdate: UIButton!
    @IBOutlet var btnchange: UIButton!
    
    var user_id = ""
    var image_path = ""
    var imageSelected = false
    var userProfileImageName = ""
   
    
    
    // MARK:- View Did Load Call One Time When Method Is Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        profileImage.addGestureRecognizer(tapGesture)
        profileImage.isUserInteractionEnabled = true
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 56
        
        self.subview.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        self.view.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        lblprofile.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblfirst.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lbllast.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblemail.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblmobile.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
       // lblpass.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblabout.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        
        
        txtfirst.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtlast.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtemail.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
       // txtpass.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtmobile.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtabout.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        
        txtemail.isUserInteractionEnabled = false
        txtemail.textColor = .darkGray
        
   
        
        txtfirst.underlinedtext()
        txtlast.underlinedtext()
        txtemail.underlinedtext()
        
        txtmobile.underlinedtext()
        txtabout.underlinedtext()
        
        btnupdate.layer.masksToBounds = true
        btnupdate.layer.cornerRadius = 20
        btnupdate.layer.borderColor = UIColor.black.cgColor
        btnupdate.layer.borderWidth = 1
        btnupdate.backgroundColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        
        btnchange.titleLabel?.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        
        
    }
    @objc func imageTapped(tapGestureRecognizer:UITapGestureRecognizer){
        openGalary()
        print("Image Taped")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.getData()

    }
    
    func getData(){
        getDataFromDefaults {success , id, firstname, lastname, email, password, mobileno,aboutme,userImage  in
            if success == true{
                self.txtfirst.text = firstname
                self.txtlast.text = lastname
                self.txtemail.text = email
                //self.txtpass.text = password
                self.txtmobile.text = mobileno
                self.txtabout.text = aboutme
                self.user_id = id
                //self.image_path = userImage
                let urlString = userImage
//                if let url = URL(string: urlString) {
//                    print(url)
//                    self.profileImage.image = UIImage(contentsOfFile: urlString)
//                } else {
//                    print("Invalid URL")
//                }
                if let url = URL(string: urlString) {
                                    print(url)
                                    
                let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
                                   
                let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent(url.lastPathComponent)
                    self.userProfileImageName = url.lastPathComponent
                let fullDestPathString = fullDestPath!.path
                                    self.profileImage.image = UIImage(contentsOfFile: fullDestPathString)
                } else {
                 print("Invalid URL")
               }
            }
        }
    }
    
    // Mark:- Button Action
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func changepass(_ sender: UIButton) {
//        let present = self.storyboard?.instantiateViewController(withIdentifier:"changepassViewController")as! changepassViewController
//        self.present(present,animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "changepassViewController") as! changepassViewController
            viewController.modalPresentationStyle = .overCurrentContext
            viewController.modalTransitionStyle = .crossDissolve
            viewController.u_Id = self.user_id
            self.present(viewController, animated: true, completion: nil)
            
//        let blurEffect = UIBlurEffect(style: .light)
//       var blurview = UIVisualEffectView(effect: blurEffect)
//        blurview.frame = view.bounds
//       self.view.addSubview(blurview)

    }
    
    
    
    @IBAction func update(_ sender: UIButton) {
        

        if(txtfirst.text == "" || txtlast.text == "" || txtemail.text == "" || txtmobile.text == "" || txtabout.text == ""){
            Alertmsg(strMsgAlert: "Please Enter Valid Detail",strtitle: "Alert")

        }else if(txtfirst.text?.firstnamevalid) == false{
            Alertmsg(strMsgAlert: "Please Enter Valid FirstName",strtitle: "Alert")
        }else if(txtlast.text?.lastnamevalid) == false{
            Alertmsg(strMsgAlert: "Please Enter Valid LastName",strtitle: "Alert")
        }else if(txtemail.text?.emailvalid) == false{
            Alertmsg(strMsgAlert: "Please Enter Valid Email",strtitle: "Alert")
    
        }else if(txtmobile.text?.phonevalid) == false{
            Alertmsg(strMsgAlert: "Please Enter Valid Mobile-No",strtitle: "Alert")
        }else if(txtabout.text?.aboutmevalid) == false{
            Alertmsg(strMsgAlert: "Please Enter Valid Your Detial",strtitle: "Alert")
        }
        else{
            self.saveImage { success, Message in
                if success == true {
                    DatabaseManager.shared.updateData(strUserid: self.user_id, strfirstName: self.txtfirst.text!, strlastName: self.txtlast.text!, strphone: self.txtmobile.text!, straboutme: self.txtabout.text!, strImage:Message , completion: { success, msg in
                        if(success == true){
                            print("Database Updated Successfull")
                        }else{
                            print("Error")
                        }
                    })
                   
                }else {
                    self.Alertmsg(strMsgAlert: "Please try agin!",strtitle: "Alert")
                }
            }
        }
        self.viewWillAppear(true)
        self.Alertmsgback()
        //self.navigationController?.popViewController(animated: true)
    }
}



// MARK:- Extention

extension UITextField{
    func underlinedtext(){
            let border = CALayer()
            let width = CGFloat(1.0)
        border.borderColor = UIColor.black.cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
}

extension EditprofileViewController{
    func Alertmsg(strMsgAlert:String,strtitle:String){
        let alert = UIAlertController(title: strtitle, message: strMsgAlert, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func Alertmsgback(){
        let alert = UIAlertController(title: "Done", message: "Data Successfully Updated", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Save Image
    
    func saveImage(completion:@escaping (Bool,String)->()){
             if  let image = profileImage.image {
                 let imageName = self.userProfileImageName//"img" + "\(Date().timeIntervalSince1970)" + ".png"
                 let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
                 let fileManager = FileManager.default
                 let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent(imageName)
                 
                 let fullDestPathString = fullDestPath!.path
                    if FileManager.default.fileExists(atPath: fullDestPath!.path){
                        do{
                            try image.pngData()!.write(to: fullDestPath!)
                            print("Image Added Successfully")
                            completion(true, fullDestPathString)
                        }catch{
                            print("Image Not Added")
                            completion(false, "")
                        }
                    }else {
                        completion(false, "")
                    }
             }
        }

}


extension EditprofileViewController:UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
    func openGalary(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .savedPhotosAlbum
            present(picker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[.originalImage] as? UIImage{
            profileImage.image = img
            self.imageSelected = true
        }
        dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
