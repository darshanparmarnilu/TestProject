

//
//  SignUpViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 09/03/23.
//

import UIKit

class SignUpViewController: UIViewController, UITextViewDelegate {

    var arrData = ["bus.png","like.png","nearest.png","plane.png","plant.png","save.png","special.png","train.png","trending.png","win.png"]
    var imgArr = [URL]()
    
    
// MARK:- IBOutlet
    
    @IBOutlet var profileimage: UIImageView!
    @IBOutlet var btncamera: UIButton!
    @IBOutlet var lblsignup: UILabel!
    @IBOutlet var btnsignin: UIButton!
    @IBOutlet var lblor: UILabel!
    @IBOutlet var btncreate: UIButton!
    @IBOutlet var txtaboutme: UITextView!
    @IBOutlet var txtmobile: UITextField!
    @IBOutlet var txtpass: UITextField!
    @IBOutlet var txtemail: UITextField!
    @IBOutlet var txtlast: UITextField!
    @IBOutlet var txtfirst: UITextField!
    @IBOutlet var subview: UIView!
    
    var imageSelecetd = false
    
// MARK:- View Did Load Call one Time When Method is Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   saveImage()
        
        
        txtaboutme.delegate = self
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        profileimage.addGestureRecognizer(tapGesture)
        profileimage.isUserInteractionEnabled = true
        profileimage.layer.masksToBounds = true
        profileimage.layer.cornerRadius = 56
        
        self.view.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        self.subview.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        lblsignup.font = UIFont(name: "Inter-Medium", size: 30)
        lblsignup.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        
        
        txtfirst.layer.masksToBounds = true
        txtfirst.layer.cornerRadius = 20
        txtfirst.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        txtfirst.layer.borderWidth = 0.5
        txtfirst.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtfirst.font = UIFont(name:"Inter-Medium", size: 22)
        
        txtlast.layer.masksToBounds = true
        txtlast.layer.cornerRadius = 20
        txtlast.layer.borderWidth = 0.5
        txtlast.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        txtlast.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtlast.font = UIFont(name:"Inter-Medium", size: 22)
        
        txtemail.layer.masksToBounds = true
        txtemail.layer.cornerRadius = 20
        txtemail.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        txtemail.layer.borderWidth = 0.5
        txtemail.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtemail.font = UIFont(name:"Inter-Medium", size: 22)
        
        txtpass.layer.masksToBounds = true
        txtpass.layer.cornerRadius = 20
        txtpass.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        txtpass.layer.borderWidth = 0.5
        txtpass.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtpass.font = UIFont(name:"Inter-Medium", size: 22)
        
        txtmobile.layer.masksToBounds = true
        txtmobile.layer.cornerRadius = 20
        txtmobile.layer.borderWidth = 0.5
        txtmobile.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        txtmobile.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtmobile.font = UIFont(name:"Inter-Medium", size: 22)
        
        txtaboutme.layer.masksToBounds = true
        txtaboutme.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        txtaboutme.layer.cornerRadius = 20
        txtaboutme.layer.borderWidth = 0.5
        txtaboutme.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtaboutme.font = UIFont(name:"Inter-Medium", size: 22)
        txtaboutme.text = "About Me"
        txtaboutme.textColor = UIColor.lightGray
        
        
        btncreate.layer.masksToBounds = true
        btncreate.layer.cornerRadius = 20
        btncreate.layer.borderColor = UIColor.black.cgColor
        btncreate.layer.borderWidth = 1
        btncreate.backgroundColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        //btncreate.titleLabel?.font =  UIFont(name: "Inter-Medium", size: 22)
        
        
        //btnsignin.titleLabel?.font = UIFont(name: "Inter-Medium", size: 26)
        btnsignin.titleLabel?.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        btnsignin.reloadInputViews()
    }
    
// MARK:- Functions Place Holder For About Me
    
    
    @objc func imageTapped(tapGestureRecognizer:UITapGestureRecognizer){
        openGalary()
        print("Image Taped")
    }
    
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n"){
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        if(textView.text == "About Me"){
            textView.text = ""
            textView.textColor = UIColor.black
            textView.reloadInputViews()
        }
        textView.becomeFirstResponder()
    }
    public func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text == ""){
            textView.text = "About Me"
            textView.textColor = UIColor.lightGray
            textView.reloadInputViews()
        }
        textView.resignFirstResponder()
    }
    
    // MARK:- Button Action
    
   
    @IBAction func camera(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
           imagePicker.sourceType = .photoLibrary
           imagePicker.allowsEditing = false
        imagePicker.delegate = self
           present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btncreateaccount(_ sender:UIButton) {
        if(txtfirst.text == "" || txtlast.text == "" || txtemail.text == "" || txtpass.text == "" || txtmobile.text == "" || txtaboutme.text == ""){
            Alertmsg(strMsgAlert: "Please Enter Valid Detail",strtitle: "Alert")
        }else if(txtfirst.text?.firstnamevalid) == false{
            Alertmsg(strMsgAlert: "Please Enter Valid Name",strtitle: "Alert")
        }else if(txtlast.text?.lastnamevalid) == false{
            Alertmsg(strMsgAlert: "Please Enter Valid Last Name",strtitle:"Alert")
        }else if(txtemail.text?.emailvalid) == false{
            Alertmsg(strMsgAlert: "Please Enter Valid Email",strtitle:"Alert")
        }else if(txtpass.text?.passvalid) == false{
            Alertmsg(strMsgAlert: "Please Enter Valid Password",strtitle:"Alert")
        }else if(txtmobile.text?.phonevalid) == false{
            Alertmsg(strMsgAlert: "Please Enter Valid Mobile No",strtitle: "Alert")
        }else if(txtaboutme.text?.aboutmevalid) == false{
            Alertmsg(strMsgAlert: "Invalid Detial",strtitle: "Alert")
        }else if self.imageSelecetd == false {
            Alertmsg(strMsgAlert: "Please selected user profile image",strtitle: "Alert")
        }
        else{
            let email_result = DatabaseManager.shared.checkemail(email: txtemail.text!)
            if email_result == false{
                
                self.saveImage { success, Message in
                    if success == true {
                        DatabaseManager.shared.insertDetail(strfirstName: self.txtfirst.text!, strlastName: self.txtlast.text!, stremail: self.txtemail.text!, strpass: self.txtpass.text!, strphone: self.txtmobile.text!, straboutme: self.txtaboutme.text!, strImage: Message) { success, msg in
                            if(success == true){
                                print("Database Added Successfull")
                            }else{
                                print("Error")
                            }
                        }
                        self.Email_Alertmsg(strMsgAlert: "Account Create Successful", strtitle: "Done")
                        self.navigationController?.popViewController(animated: true)
                    }else {
                        self.Alertmsg(strMsgAlert: "Please try agin!",strtitle: "Alert")
                    }
                }
            }
            else if email_result == true{
                Alertmsg(strMsgAlert: "Email Allready Exist", strtitle: "Alert")
            }
        }
    }
    @IBAction func btnsignup(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK:- Extention

extension String{
    var passvalid:Bool{
        let passRegEx = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{2,64}$"
        let passPred = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        return passPred.evaluate(with: self)
    }
    var emailvalid :Bool{
        let emailRehEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRehEx)
        return emailTest.evaluate(with: self)
    }
    var firstnamevalid:Bool{
        let firstRehex = "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$"
        let firstTest = NSPredicate(format: "SELF MATCHES %@", firstRehex)
        return firstTest.evaluate(with: self)
    }
    var lastnamevalid:Bool{
        let lastRehex = "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$"
        let lastText = NSPredicate(format: "SELF MATCHES %@", lastRehex)
        return lastText.evaluate(with: self)
    }
    var phonevalid:Bool{
//        let phoneRegex = "^[0-9+]{0,1}+[0-9]{10,13}$"
        let phoneRegex = "[0-9]{10,13}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    var aboutmevalid:Bool{
        //let aboutRehex = "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?)){10,50}$"
        let aboutRehex = "[A-Z,a-z, ,]{10,50}$"
        let aboutText = NSPredicate(format: "SELF MATCHES %@", aboutRehex)
        return aboutText.evaluate(with: self)
    }

}


extension SignUpViewController{
    
    //Alert messsage
    
    func Alertmsg(strMsgAlert:String,strtitle:String){
        let alert = UIAlertController(title: strtitle, message: strMsgAlert, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func Email_Alertmsg(strMsgAlert:String,strtitle:String){
        let alert = UIAlertController(title: strtitle, message: strMsgAlert, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            self.navigationController?.popViewController(animated: true)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
//     func saveImage(completion:@escaping (Bool,String)->()){
//         if  let image = profileimage.image {
//             let imageName = "img" + "\(Date().timeIntervalSince1970)" + ".png"
//                let document = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//                print(document)
//
//                let imageUrl = document.appendingPathComponent(imageName,isDirectory: true)
//
//                print(imageUrl.path)
//
//                if !FileManager.default.fileExists(atPath: imageUrl.path){
//                    do{
//                        try image.pngData()!.write(to: imageUrl)
//                        print("Image Added Successfully")
//                        completion(true, imageUrl.path)
//                    }catch{
//                        print("Image Not Added")
//                        completion(false, "")
//                    }
//                }else {
//                    completion(false, "")
//                }
//         }
//    }
    
    
    func saveImage(completion:@escaping (Bool,String)->()){
             if  let image = profileimage.image {
                 let imageName = "img" + "\(Date().timeIntervalSince1970)" + ".png"
                 let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
                 let fileManager = FileManager.default
                 let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent(imageName)
                 
                 let fullDestPathString = fullDestPath!.path
                    
                    if !FileManager.default.fileExists(atPath: fullDestPath!.path){
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



// Open Galary

extension SignUpViewController:UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
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
            profileimage.image = img
            self.imageSelecetd = true
        }
        dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}




