

//
//  SignUpViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 09/03/23.
//

import UIKit
import Toast_Swift

class SignUpViewController: UIViewController, UITextViewDelegate {

    var arrData = ["bus.png","like.png","nearest.png","plane.png","plant.png","save.png","special.png","train.png","trending.png","win.png"]
    var imgArr = [URL]()
    
    var ArrCountry:[String] = ["India","United States of America","United Kingdom"]
    
    var ArrStates = ["India":["Gujarat","Rajasthan","Punjab"],
                     "United States of America":["California","Florida","Hawaii"],
                     "United Kingdom":["England"," Scotland","Northern Ireland"]]
    
    var Arrcities = ["Gujarat":["Ahemdabad","Surat","Baroda","Gandhinagar","Modasa"],
                     "Rajasthan":["Jaipur","Udaipur","Jodhpur","Jaisalmer","Bikaner"],
                     "Punjab":["Amritsar","Jalandar","Lundhiyana","Patiala","Bathinda"],
                     
                     "California":["San Diego","San Jose","Fresno","Oakland","Irvine"],
                     "Florida":["Miame","Orlando","Tampa","Florida City","Destin"],
                     "Hawaii":["Honolulu","Hilo","Hawi","Lahaina","Kailua"],
                     
                     "England":["Manchester","City of London","Manchester","Liverpool"],
                     "Scotland":["Edinburgh","Glasgow","Inverness","Aberdeen","Dunfermline"],
                     "Northern Ireland":["Belfast","Derry","Newry","Armagh","Newtownabbey"]]
    
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    
    
    var strSelectedCountry = ""
    var strSelectedStates = ""
    var strSelectedCity = ""
    
    var maleBtnSelect = false
    var femalebtnSelect = false
    
    var gender = ""
    
    var arrSelectedStates : [String] = []
    var arrSelectedCity : [String] = []
// MARK:- IBOutlet
    
    @IBOutlet var btncity: UIButton!
    @IBOutlet var btnstate: UIButton!
    @IBOutlet var btncountry: UIButton!
    @IBOutlet var btnfemale: UIButton!
    @IBOutlet var btnmale: UIButton!
    @IBOutlet var txtcity: UITextField!
    @IBOutlet var txtstate: UITextField!
    @IBOutlet var txtcountry: UITextField!
    @IBOutlet var txtbirthtime: UITextField!
    @IBOutlet var txtdateofbirth: UITextField!
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
        
        if let arrST = self.ArrStates[self.strSelectedCountry] {
            self.arrSelectedStates = arrST
        }
        
        if let arrCt = self.Arrcities[self.strSelectedStates] {
            self.arrSelectedCity = arrCt
        }
        
        
        
        
        
     //   saveImage()
        txtdateofbirth.delegate = self
        txtbirthtime.delegate = self
        txtcountry.delegate = self
        txtstate.delegate = self
        txtcity.delegate = self
        
        txtaboutme.delegate = self
        picker.delegate = self
        picker.dataSource = self
        txtcountry.isUserInteractionEnabled = true
        txtcity.isUserInteractionEnabled = true
        txtstate.isUserInteractionEnabled = true
        
        
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
        
        txtdateofbirth.layer.masksToBounds = true
        txtdateofbirth.layer.cornerRadius = 20
        txtdateofbirth.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        txtdateofbirth.layer.borderWidth = 0.5
        txtdateofbirth.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtdateofbirth.font = UIFont(name:"Inter-Medium", size: 22)
        
        txtbirthtime.layer.masksToBounds = true
        txtbirthtime.layer.cornerRadius = 20
        txtbirthtime.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        txtbirthtime.layer.borderWidth = 0.5
        txtbirthtime.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtbirthtime.font = UIFont(name:"Inter-Medium", size: 22)
        
        txtcountry.layer.masksToBounds = true
        txtcountry.layer.cornerRadius = 20
        txtcountry.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        txtcountry.layer.borderWidth = 0.5
        txtcountry.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtcountry.font = UIFont(name:"Inter-Medium", size: 22)
        
        txtstate.layer.masksToBounds = true
        txtstate.layer.cornerRadius = 20
        txtstate.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        txtstate.layer.borderWidth = 0.5
        txtstate.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtstate.font = UIFont(name:"Inter-Medium", size: 22)
        
        txtcity.layer.masksToBounds = true
        txtcity.layer.cornerRadius = 20
        txtcity.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        txtcity.layer.borderWidth = 0.5
        txtcity.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtcity.font = UIFont(name:"Inter-Medium", size: 22)
        
        
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
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.picker.removeFromSuperview()
        self.toolBar.removeFromSuperview()
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
        if(txtfirst.text == "" || txtlast.text == "" || txtemail.text == "" || txtpass.text == "" || txtmobile.text == "" || txtaboutme.text == "" || txtdateofbirth.text == "" || txtbirthtime.text == "" || txtcountry.text == "" || txtstate.text == "" || txtcity.text == "" || gender == ""){
            Alertmsg(strMsgAlert: "Please Enter Valid Detail",strtitle: "Alert")
        }else if(txtfirst.text?.firstnamevalid) == false{
            Alertmsg(strMsgAlert: "Please Enter Valid Name",strtitle: "Alert")
        }else if(txtlast.text?.lastnamevalid) == false{
            Alertmsg(strMsgAlert: "Please Enter Valid Last Name",strtitle:"Alert")
        }else if(txtemail.text?.emailvalid) == false{
            Alertmsg(strMsgAlert: "Please Enter Valid Email",strtitle:"Alert")
        }else if(txtpass.text?.passvalid) == false{
            Alertmsg(strMsgAlert: "Please Enter Valid Password Like [0-9a-zA-Z!@#$%^&*()]",strtitle:"Alert")
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
                        DatabaseManager.shared.insertDetail(strfirstName: self.txtfirst.text!, strlastName: self.txtlast.text!, stremail: self.txtemail.text!, strpass: self.txtpass.text!, strphone: self.txtmobile.text!, straboutme: self.txtaboutme.text! , strImage: Message, strDateofBirth:self.txtdateofbirth.text!,strBirthtime:self.txtbirthtime.text!,strCountry: self.txtcountry.text!,strState: self.txtstate.text!,strCity: self.txtcity.text!,strGender: self.gender) { success, msg in
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
    
    @IBAction func country(_ sender: UIButton) {
        openpicker(tag: 1)
    }
    
    @IBAction func state(_ sender: UIButton) {
        if txtcountry.text == ""{
            self.Alertmsg(strMsgAlert: "Please Select First Country", strtitle: "Alert")
        }else{
            openpicker(tag: 2)
        }
    }
    
    @IBAction func city(_ sender: UIButton) {
        if txtcountry.text == "" && txtstate.text == ""{
            self.Alertmsg(strMsgAlert: "Please Select First Country And State", strtitle: "Alert")
        }else if txtstate.text == ""{
            Alertmsg(strMsgAlert: "Please Select State", strtitle: "Alert")
        }else{
            self.openpicker(tag: 3)
        }
    }
    
    @IBAction func Male(_ sender: UIButton) {
         gender = "Male"
        if(maleBtnSelect == false){
            sender.setImage(UIImage(named: "select"), for: UIControl.State.normal)
            btnfemale.setImage(UIImage(named: "unselect"), for: UIControl.State.normal)
        }
        maleBtnSelect = true
        femalebtnSelect = false
    }
    
    @IBAction func female(_ sender: UIButton) {
       gender = "Female"
        if(femalebtnSelect == false){
            sender.setImage(UIImage(named: "select"), for: UIControl.State.normal)
            btnmale.setImage(UIImage(named: "unselect"), for: UIControl.State.normal)
        }
        maleBtnSelect = false
        femalebtnSelect = true
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
    
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
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

// Open Date And Time Picker


extension SignUpViewController:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 6{
            self.OpenDatepickker()
        }
        else if textField.tag == 7{
            self.OpenTimepickker()
        }
        else if textField.tag == 8{
            self.openpicker(tag: 1)
        }else if textField.tag == 9{
//            if arrSelectedStates == []{
            if txtcountry.text == ""{
                self.Alertmsg(strMsgAlert: "Please Select First Country", strtitle: "Alert")
            }else{
                self.openpicker(tag: 2)
            }
        }else if textField.tag == 10{
//            if arrSelectedCity == []{
            
            if txtcountry.text == "" && txtstate.text == ""{
                self.Alertmsg(strMsgAlert: "Please Select First Country And State", strtitle: "Alert")
//            }else if strSelectedCountry == ""{
            }else if txtstate.text == ""{
                Alertmsg(strMsgAlert: "Please Select State", strtitle: "Alert")
            }else{
                self.openpicker(tag: 3)
                
            }
            
        }
        
    }
}

// Mark:- Date Picker

extension SignUpViewController{
    func OpenDatepickker(){
        let datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(self.datePickerHandler(datePicker:)), for: .valueChanged)
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: 0, to: Date())
        datePicker.setValue(UIColor.red, forKeyPath: "textColor")
        datePicker.setValue(true, forKeyPath: "highlightsToday")
        txtdateofbirth.inputView = datePicker
        
        let choosenDate = datePicker.date

        let dateformrtter = DateFormatter()
        
        dateformrtter.dateStyle = .medium
        
          
        let toolbar = UIToolbar(frame:  CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        let cancelbtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelBtnClick))
        let donebtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneBtnClick))
        let flexibleBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let resetbtn = UIBarButtonItem(title: "Reset", style: .done, target: self, action: #selector(self.resetbtn))
        toolbar.setItems([cancelbtn,flexibleBtn,resetbtn,flexibleBtn,donebtn], animated: true)
        txtdateofbirth.inputAccessoryView = toolbar
    }
    @objc
    func cancelBtnClick(){
        txtdateofbirth.resignFirstResponder()
    }
    
    @objc
    func doneBtnClick(){
        if let datePicker = txtdateofbirth.inputView as? UIDatePicker{
            let dateformetter = DateFormatter()
            dateformetter.dateStyle = .medium
            print(datePicker.date)
            txtdateofbirth.text = dateformetter.string(from: datePicker.date)
            txtdateofbirth.resignFirstResponder()
        }
    }
    
    @objc func resetbtn(){
        txtdateofbirth.text = ""
    }
    
    @objc
    func datePickerHandler(datePicker:UIDatePicker){
        print(datePicker.date)
    }
}


// Time Picker

extension SignUpViewController{
    func OpenTimepickker(){
        let datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(self.DatePickerHandler(datePicker:)), for: .valueChanged)
        datePicker.datePickerMode = .time
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.setValue(UIColor.red, forKeyPath: "textColor")
        datePicker.setValue(true, forKeyPath: "highlightsToday")
        txtbirthtime.inputView = datePicker
        
        let dateformrtter = DateFormatter()
        dateformrtter.dateStyle = .medium
          
        let toolbar = UIToolbar(frame:  CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelbtnClick))
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.donebtnClick))
        let flexibleBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let resetBtn = UIBarButtonItem(title: "Reset", style: .done, target: self, action: #selector(self.resetBtn))
        toolbar.setItems([cancelBtn,flexibleBtn,resetBtn,flexibleBtn,doneBtn], animated: true)
        txtbirthtime.inputAccessoryView = toolbar
    }
    
    @objc
    func cancelbtnClick(){
        txtbirthtime.resignFirstResponder()
    }
    
    @objc
    func donebtnClick(){
        if let datePicker = txtbirthtime.inputView as? UIDatePicker{
            let formatter = DateFormatter()
                formatter.timeStyle = .short
            txtbirthtime.text = formatter.string(from: datePicker.date)
            txtbirthtime.resignFirstResponder()
        }
    }
    @objc func resetBtn(){
        txtbirthtime.text = ""
    }
    
    @objc
    func DatePickerHandler(datePicker:UIDatePicker){
        print(datePicker.date)
    }
   
}

// Mark PickerView Delegets

extension SignUpViewController:UIPickerViewDelegate,UIPickerViewDataSource{

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return ArrCountry.count
        }else if pickerView.tag == 2 {
            return arrSelectedStates.count
        }else if pickerView.tag == 3 {
            return arrSelectedCity.count
        }else
        {
            return 0
        }

    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            self.ArrCountry.count
        } else if pickerView.tag == 2 {
            self.arrSelectedStates.count
        }else if  pickerView.tag == 3 {
            self.arrSelectedCity.count
        }else {
            return nil
        }
        return nil
    }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if pickerView.tag == 1 {
                self.strSelectedCountry = self.ArrCountry[row]
            } else if pickerView.tag == 2 {
                self.strSelectedStates = self.arrSelectedStates[row]
            }else if  pickerView.tag == 3 {
                self.strSelectedCity = self.arrSelectedCity[row]
            }else {
                
            }
            
        }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if pickerView.tag == 1 {
            return NSAttributedString(string: ArrCountry[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        } else if pickerView.tag == 2 {
            return NSAttributedString(string: arrSelectedStates[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        }else if  pickerView.tag == 3 {
            return NSAttributedString(string: arrSelectedCity[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        }else {
            
        }
        return nil
    }
}


extension SignUpViewController{
    // Country Picker
    func openpicker(tag:Int){
        picker = UIPickerView.init(frame:CGRect(x: 0.0, y: self.view.frame.height - 200, width: self.view.frame.width, height: 300) )
        picker.delegate = self
        picker.tag = tag
        picker.dataSource = self
        picker.backgroundColor = UIColor.white
        picker.setValue(UIColor.black, forKey: "textColor")
        
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        //self.view.addSubview(picker)
        txtcountry.inputView = picker
        txtstate.inputView = picker
        txtcity.inputView = picker
        
        toolBar = UIToolbar.init(frame: CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 250, width: UIScreen.main.bounds.size.width, height: 50))
        let flexibleBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.CancelBtnClick))
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.DonebtnClick))
        toolBar.barStyle = .blackTranslucent
        toolBar.setItems([cancelBtn,flexibleBtn,flexibleBtn,flexibleBtn,doneBtn], animated: true)
        //txtcountry.inputAccessoryView = toolBar
        
       //self.view.addSubview(toolBar)
        txtcountry.inputAccessoryView = toolBar
        txtstate.inputAccessoryView = toolBar
        txtcity.inputAccessoryView = toolBar
        
    }
    
    @objc
    func DonebtnClick(){
        if picker.tag == 1{
            
            let country = self.strSelectedCountry
            
            if country != txtcountry.text{
                txtcity.text = ""
                txtstate.text = ""
            }
            txtcountry.text = country
            txtcountry.resignFirstResponder()
            if self.strSelectedCountry == ""{
                print("Please Select Country")
            }else{
                if let arrST = self.ArrStates[self.strSelectedCountry]  {
                    self.arrSelectedStates = arrST
                }
            }
        }else if  picker.tag == 2{
            
            let state = self.strSelectedStates
            
            if state != txtstate.text{
                txtcity.text = ""
//                txtstate.text = ""
            }
            txtstate.text = state
            txtstate.resignFirstResponder()
            
                if self.strSelectedStates == ""{
                    print("Please Select States")
                }else{
                    if let arrCT = self.Arrcities[self.strSelectedStates]  {
                        self.arrSelectedCity = arrCT
                    }
                }
            
            }else if  picker.tag == 3 {
                txtcity.text = self.strSelectedCity
                txtcity.resignFirstResponder()
                if self.strSelectedCity == ""{
                    print("Please Select City")
                }
            }
            self.picker.removeFromSuperview()
            self.toolBar.removeFromSuperview()
        }
        
        @objc
        func CancelBtnClick(){
            if picker.tag == 1{
                self.txtcountry.resignFirstResponder()
            }else  if picker.tag == 2{
                self.txtstate.resignFirstResponder()
            }else if picker.tag == 3{
                self.txtcity.resignFirstResponder()
            }
            self.resignFirstResponder()
            self.picker.removeFromSuperview()
            self.toolBar.removeFromSuperview()
        }
        
    }

