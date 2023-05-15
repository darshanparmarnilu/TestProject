//
//  EditprofileViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 10/03/23.
//

import UIKit
import MobileCoreServices
import Toast_Swift


class EditprofileViewController: UIViewController {
    
    
    // MARK:- IBOutlets
    
    @IBOutlet var btnfemale: UIButton!
    @IBOutlet var btnmale: UIButton!
    @IBOutlet var lblcity: UILabel!
    @IBOutlet var lblstate: UILabel!
    @IBOutlet var lblcountry: UILabel!
    @IBOutlet var lblbirthtime: UILabel!
    @IBOutlet var lbldateofbirth: UILabel!
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
    
    @IBOutlet var txtcountry: UITextField!
    @IBOutlet var txtcity: UITextField!
    @IBOutlet var txtstate: UITextField!
    @IBOutlet var txtbirthtime: UITextField!
    @IBOutlet var txtdateofbirth: UITextField!
    @IBOutlet var txtfirst: UITextField!
    @IBOutlet var txtabout: UITextField!
    @IBOutlet var txtmobile: UITextField!
    //@IBOutlet var txtpass: UITextField!
    @IBOutlet var txtemail: UITextField!
    @IBOutlet var txtlast: UITextField!
    
    @IBOutlet var btnupdate: UIButton!
    
    
    var user_id = ""
    var image_path = ""
    var imageSelected = false
    var userProfileImageName = ""
    
    var gender = ""
    
    var maleBtnSelect:Bool = false
    var femalebtnSelect :Bool = false
    
    var ArrCountry:[String] = ["India","United States of America","United Kingdom"]
    
    var ArrStates = ["India":["Gujarat","Rajasthan","Punjab"],
                     "United States of America":["California","Florida","Hawaii"],
                     "United Kingdom":["England","Scotland","Northern Ireland"]]
    
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
    
    var arrSelectedStates : [String] = []
    var arrSelectedCity : [String] = []
    
    // MARK:- View Did Load Call One Time When Method Is Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboard()
        
        //self.tabBarController?.tabBar.isHidden = true
        // self.tabBarController?.tabBar.layer.zPosition = -1
        txtfirst.delegate = self
        txtlast.delegate = self
        txtmobile.delegate = self
        txtdateofbirth.delegate = self
        txtbirthtime.delegate = self
        txtcountry.delegate = self
        txtstate.delegate = self
        txtcity.delegate = self
        picker.delegate = self
        picker.dataSource = self
        txtabout.delegate = self
        
        
        
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
        lbldateofbirth.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblbirthtime.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblcountry.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblstate.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        lblcity.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        
        txtfirst.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtlast.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtemail.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        // txtpass.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtmobile.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtabout.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtdateofbirth.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtbirthtime.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtcountry.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtstate.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        txtcity.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        btnmale.titleLabel?.textColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        txtemail.isUserInteractionEnabled = false
        txtemail.textColor = .darkGray
        
        
        
        txtfirst.underlinedtext()
        txtlast.underlinedtext()
        txtemail.underlinedtext()
        
        txtmobile.underlinedtext()
        txtabout.underlinedtext()
        txtdateofbirth.underlinedtext()
        txtbirthtime.underlinedtext()
        txtcountry.underlinedtext()
        txtstate.underlinedtext()
        txtcity.underlinedtext()
        
        btnupdate.layer.masksToBounds = true
        btnupdate.layer.cornerRadius = 20
        btnupdate.layer.borderColor = UIColor.black.cgColor
        btnupdate.layer.borderWidth = 1
        btnupdate.backgroundColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        if let Date = UserDefaults.standard.value(forKey: "Date") as? String{
            txtdateofbirth.text = Date
        }
    }
    @objc func imageTapped(tapGestureRecognizer:UITapGestureRecognizer){
        actionSheet()
        //openGalary()
        print("Image Taped")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.getData()
    }
    
    // Mark:- Get All Data
    
    func getData(){
        getDataFromDefaults {success , id, firstname, lastname, email, password, mobileno,aboutme,userImage,userDateofBirth,userBirthTime,userCountry,userState,userCity,userGender  in
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
                self.txtdateofbirth.text = userDateofBirth
                self.txtbirthtime.text = userBirthTime
                self.txtcountry.text = userCountry
                self.txtstate.text = userState
                self.txtcity.text = userCity
                self.gender = userGender
                
                self.strSelectedCountry = userCountry
                self.strSelectedStates = userState
                self.strSelectedCity = userCity
                
                if self.strSelectedCountry != ""{
                    if let arst = self.ArrStates[self.strSelectedCountry]{
                        self.arrSelectedStates = arst
                    }
                }
                if self.strSelectedStates != ""{
                    if let arst = self.Arrcities[self.strSelectedStates]{
                        self.arrSelectedCity = arst
                    }
                }
                if self.gender == "Male"{
                    self.btnmale.setImage(UIImage(named: "select"), for: UIControl.State.normal)
                    self.btnfemale.setImage(UIImage(named: "unselect"), for: UIControl.State.normal)
                }else if self.gender == "Female"{
                    self.btnfemale.setImage(UIImage(named: "select"), for: UIControl.State.normal)
                    self.btnmale.setImage(UIImage(named: "unselect"), for: UIControl.State.normal)
                }
                
            }
        }
    }
    
    // Mark:- Button Action
    
    
    @IBAction func btnmale(_ sender: UIButton) {
        gender = "Male"
        
        if(maleBtnSelect == false){
            sender.setImage(UIImage(named: "select"), for: UIControl.State.normal)
            btnfemale.setImage(UIImage(named: "unselect"), for: UIControl.State.normal)
        }
        maleBtnSelect = true
        femalebtnSelect = false
        
    }
    
    @IBAction func btnfemale(_ sender: UIButton) {
        gender = "Female"
        if(femalebtnSelect == false){
            sender.setImage(UIImage(named: "select"), for: UIControl.State.normal)
            btnmale.setImage(UIImage(named: "unselect"), for: UIControl.State.normal)
        }
        maleBtnSelect = false
        femalebtnSelect = true
    }
    
    @IBAction func country(_ sender: UIButton) {
        self.openpicker(tag: 1)
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
    
    @IBAction func update(_ sender: UIButton) {
        
        
        if(txtfirst.text == ""){
            Alertmsg(strMsgAlert: "Please Enter First Name",strtitle: "Alert")
        } else if(txtlast.text == ""){
            Alertmsg(strMsgAlert: "Please Enter Last Name",strtitle: "Alert")
        }else if(txtemail.text == ""){
            Alertmsg(strMsgAlert: "Please Enter Email",strtitle: "Alert")
        }else if(txtmobile.text == ""){
            Alertmsg(strMsgAlert: "Please Enter Mobile No",strtitle: "Alert")
        }else if(txtabout.text == ""){
            Alertmsg(strMsgAlert: "Please Fill About Me Detial",strtitle: "Alert")
        }else if(txtdateofbirth.text == ""){
            Alertmsg(strMsgAlert: "Please Enter Date Of Birth",strtitle: "Alert")
        }else if(txtbirthtime.text == ""){
            Alertmsg(strMsgAlert: "Please Enter Birth Time",strtitle: "Alert")
        }else if(txtcountry.text == ""){
            Alertmsg(strMsgAlert: "Please Enter Country",strtitle: "Alert")
        }else if(txtstate.text == ""){
            Alertmsg(strMsgAlert: "Please Enter State",strtitle: "Alert")
        }else if(txtcity.text == ""){
            Alertmsg(strMsgAlert: "Please Enter City",strtitle: "Alert")
        }else if(gender == ""){
            Alertmsg(strMsgAlert: "Please Enter Gender",strtitle: "Alert")
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
                    DatabaseManager.shared.updateData(strUserid: self.user_id, strfirstName: self.txtfirst.text!, strlastName: self.txtlast.text!, strphone: self.txtmobile.text!, straboutme: self.txtabout.text!, strImage:Message ,strDateofBirth: self.txtdateofbirth.text!,strBirthtime: self.txtbirthtime.text!,strCountry: self.txtcountry.text!,strState: self.txtstate.text!,strCity: self.txtcity.text!,strGender: self.gender, completion: { success, msg in
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
        // self.viewWillAppear(true)
        self.Alertmsgback()
        //self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}



// MARK:- Extention

extension UITextField{
    func underlinedtext(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width*3, height: self.frame.size.height)
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


//extension EditprofileViewController:UINavigationControllerDelegate,UIImagePickerControllerDelegate{
//
//    func openGalary(){
//        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
//            let picker = UIImagePickerController()
//            picker.delegate = self
//            picker.sourceType = .savedPhotosAlbum
//            present(picker, animated: true)
//        }
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let img = info[.originalImage] as? UIImage{
//            profileImage.image = img
//            self.imageSelected = true
//        }
//        dismiss(animated: true)
//    }
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true, completion: nil)
//    }
//}


extension EditprofileViewController:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1{
            self.OpenDatepickker()
        }
        else if textField.tag == 2{
            self.OpenTimepickker()
        }
        else if textField.tag == 3{
            self.openpicker(tag: 1)
        }else if textField.tag == 4{
            self.openpicker(tag: 2)
        }else if textField.tag == 5{
            self.openpicker(tag: 3)
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtfirst{
            let maxLength = 24
            let currentString: NSString = txtfirst.text! as NSString
            let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }else if textField == txtlast{
            let maxLength = 24
            let currentString: NSString = txtlast.text! as NSString
            let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }else if textField == txtmobile{
            let maxLength = 10
            let currentString: NSString = txtmobile.text! as NSString
            let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        return true
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension EditprofileViewController:UIPickerViewDelegate,UIPickerViewDataSource{
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

// Mark:- Open Picker

extension EditprofileViewController{
    // Country Picker
    //    func openpicker(tag:Int){
    //        picker = UIPickerView.init(frame:CGRect(x: 0.0, y: self.view.frame.height - 200, width: self.view.frame.width, height: 300) )
    //        picker.delegate = self
    //        picker.tag = tag
    //        picker.dataSource = self
    //        picker.backgroundColor = UIColor.white
    //        picker.setValue(UIColor.black, forKey: "textColor")
    //
    //        picker.autoresizingMask = .flexibleWidth
    //        picker.contentMode = .center
    //
    //        //self.view.addSubview(picker)
    //        //txtdateofbirth.inputView = picker
    //
    //        txtcountry.inputView = picker
    //        txtstate.inputView = picker
    //        txtcity.inputView = picker
    //
    //        toolBar = UIToolbar.init(frame: CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 250, width: UIScreen.main.bounds.size.width, height: 50))
    //        let flexibleBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    //        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.CancelBtnClick))
    //        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.DonebtnClick))
    //        toolBar.barStyle = .blackTranslucent
    //        toolBar.setItems([cancelBtn,flexibleBtn,flexibleBtn,flexibleBtn,doneBtn], animated: true)
    //        //txtcountry.inputAccessoryView = toolBar
    //        //self.view.addSubview(toolBar)
    //
    //        txtcountry.inputAccessoryView = toolBar
    //        txtstate.inputAccessoryView = toolBar
    //        txtcity.inputAccessoryView = toolBar
    //    }
    //
    func openpicker(tag: Int) {
        picker = UIPickerView(frame: CGRect(x: 0.0, y: self.view.frame.height - 200, width: self.view.frame.width, height: 300))
        picker.delegate = self
        picker.tag = tag
        picker.dataSource = self
        picker.backgroundColor = UIColor.white
        picker.setValue(UIColor.black, forKey: "textColor")
        
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        
        txtcountry.inputView = picker
        txtstate.inputView = picker
        txtcity.inputView = picker
        
        toolBar = UIToolbar(frame: CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 250, width: UIScreen.main.bounds.size.width, height: 50))
        let flexibleBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.CancelBtnClick))
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.DonebtnClick))
        toolBar.barStyle = .blackTranslucent
        toolBar.setItems([cancelBtn, flexibleBtn, flexibleBtn, flexibleBtn, doneBtn], animated: true)
        
        txtcountry.inputAccessoryView = toolBar
        txtstate.inputAccessoryView = toolBar
        txtcity.inputAccessoryView = toolBar
        
        // Update picker selection based on text field values
        if tag == 1, let selectedCountry = txtcountry.text, !selectedCountry.isEmpty {
            if let countryIndex = ArrCountry.firstIndex(of: selectedCountry) {
                picker.selectRow(countryIndex, inComponent: 0, animated: false)
            }
        } else if tag == 2, let selectedState = txtstate.text, !selectedState.isEmpty {
            if let stateIndex = ArrStates.keys.firstIndex(where: { $0 == selectedState }) {
                let row = ArrStates.keys.distance(from: ArrStates.keys.startIndex, to: stateIndex)
                picker.selectRow(row, inComponent: 0, animated: false)
            }
        }
        else if tag == 3, let selectedCountry = txtcountry.text, !selectedCountry.isEmpty,
                let selectedState = txtstate.text, !selectedState.isEmpty {
            let selectedCity = txtcity.text ?? ""
            if let cityIndex = Arrcities[selectedState]?.firstIndex(of: selectedCity) {
                picker.selectRow(cityIndex, inComponent: 0, animated: false)
            }
        }
    }
    
    
        @objc
        func DonebtnClick(){
            if picker.tag == 1{
                let selectedRow = picker.selectedRow(inComponent: 0) // Get the selected row in the picker's first component
                let selectedCountry = ArrCountry[selectedRow] // Assuming ArrCountries is an array of country names
    
                if selectedCountry != txtcountry.text {
                    txtcity.text = ""
                    txtstate.text = ""
                }
    
                txtcountry.text = selectedCountry
                txtcountry.resignFirstResponder()
    
                if selectedCountry == "" {
                    print("Please Select Country")
                } else {
                    if let arrST = ArrStates[selectedCountry] {
                        self.arrSelectedStates = arrST
                    }
                }
            }else if picker.tag == 2 {
                guard let selectedCountry = txtcountry.text else {
                    print("Please select a country first")
                    return
                }
    
                let selectedState = ArrStates[selectedCountry]?[picker.selectedRow(inComponent: 0)] ?? ""
    
                if selectedState != txtstate.text {
                    txtcity.text = ""
                }
    
                txtstate.text = selectedState
                txtstate.resignFirstResponder()
    
                if selectedState.isEmpty {
                    print("Please Select State")
                } else {
                    if let arrCT = Arrcities[selectedState] {
                        self.arrSelectedCity = arrCT
                    }
                }
            }else if  picker.tag == 3 {
                guard let selectedCountry = txtcountry.text, !selectedCountry.isEmpty else {
                    print("Please select a country first")
                    return
                }
    
                guard let selectedState = txtstate.text, !selectedState.isEmpty else {
                    print("Please select a state first")
                    return
                }
    
                let selectedCity = Arrcities[selectedState]?[picker.selectedRow(inComponent: 0)] ?? ""
    
                txtcity.text = selectedCity
                txtcity.resignFirstResponder()
    
                if selectedCity.isEmpty {
                    print("Please select a city")
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
            self.picker.removeFromSuperview()
            self.toolBar.removeFromSuperview()
        }
    
    }
    


// Mark:- Date Picker

extension EditprofileViewController{
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
        let dateformrtter = DateFormatter()
        dateformrtter.dateStyle = .medium
        
        
        
        let toolbar = UIToolbar(frame:  CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        let cancelbtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelBtnclick))
        let donebtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneBtnclick))
        let flexibleBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let resetbtn = UIBarButtonItem(title: "Reset", style: .done, target: self, action: #selector(self.resetbtn))
        toolbar.setItems([cancelbtn,flexibleBtn,resetbtn,flexibleBtn,donebtn], animated: true)
        txtdateofbirth.inputAccessoryView = toolbar
        if let index = UserDefaults.standard.value(forKey: "SelectedDate") as? Date{
            datePicker.date = index
        }
        
    }
    @objc
    func cancelBtnclick(){
        txtdateofbirth.resignFirstResponder()
    }
    
    @objc
    func doneBtnclick(){
        if let datePicker = txtdateofbirth.inputView as? UIDatePicker{
            let dateformetter = DateFormatter()
            dateformetter.dateStyle = .medium
            print(datePicker.date)
            txtdateofbirth.text = dateformetter.string(from: datePicker.date)
            txtdateofbirth.resignFirstResponder()
            let selecteddate = datePicker.date
            UserDefaults.standard.set(selecteddate, forKey: "SelectedDate")
            //            UserDefaults.standard.set(txtdateofbirth.text, forKey: "Date")
            
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

extension EditprofileViewController{
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
        if let index = UserDefaults.standard.value(forKey: "Time") as? Date{
            datePicker.date = index
        }
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
            let selected = datePicker.date
            UserDefaults.standard.set(datePicker.date, forKey: "Time")
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

extension EditprofileViewController{
    func gallaryOpen(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let picker = UIImagePickerController()
            picker.allowsEditing = true
            picker.delegate  = self
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true,completion: nil)
        }
    }
    func camareaOpen(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            let picker = UIImagePickerController()
            picker.allowsEditing = true
            picker.sourceType = .camera
            picker.mediaTypes = [kUTTypeImage as String]
            picker.present(picker, animated: true,completion: nil)
        }
    }
    func actionSheet(){
        let alert = UIAlertController(title: "Choose Image From", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Gallary", style: .default,handler: {(handler) in
            self.gallaryOpen()
        }))
        alert.addAction(UIAlertAction(title: "Camera", style: .default,handler: {(handler) in
            self.camareaOpen()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default,handler: {(handler) in
            self.dismiss(animated: true)
        }))
        self.present(alert, animated: true,completion: nil)
    }
}

extension EditprofileViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let img = info[.originalImage] as? UIImage{
            profileImage.image = img
            self.imageSelected = true
        }
        dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true,completion: nil )
    }
}



//extension EditprofileViewController{
//    func setupTextView() {
//        if txtabout.text != ""{
//            txtabout.text = "About Me"
//            txtabout.textColor = UIColor.lightGray
//            txtabout.textAlignment = .center
//            txtabout.delegate = self
//           // txtaboutme.becomeFirstResponder()
//        }else{
//            // Data Show
//        }
//
//    }
//
//    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if text == "\n" {
//            textView.textAlignment = .center
//            textView.resignFirstResponder()
//            return false
//        }
//        return true
//    }
//
//    public func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.text == "About Me" {
//            textView.text = ""
//            textView.textColor = UIColor.black
//            textView.textAlignment = .center
//        }
//    }
//
//    public func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text.isEmpty {
//            textView.text = "About Me"
//            textView.textColor = UIColor.lightGray
//            textView.textAlignment = .center
//        }
//    }
//}
