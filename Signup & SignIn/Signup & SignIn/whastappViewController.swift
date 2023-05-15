//
//  whastappViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 13/04/23.
//

import UIKit
import SideMenu

class whastappViewController: UIViewController {
    
    @IBOutlet var container: UIView!
    @IBOutlet var btnFloting: UIButton!
    @IBOutlet var lbltitle: UILabel!
    @IBOutlet var Galaryview: UIView!
    var cellHeight : CGFloat = 100
    var stackview : UIStackView!
    
    var isCollapce = false
    var isExpand = false
    var selectedindex = 0
    
    var ArrContacts:[WSContacts] = []
    var lastSelectedIndex = -1
    
    //var ArrName = ["Janny","Olivia","Angelique","Emma","Charlotte","Amelia","Wrenley","Ava","Sophia"," Isabella"]
    // var ArrNumber = ["+916953297181","+917845787485","+916242187485","+912456749810","+914578963125","+916352417485","+914152637485","+919685748596","+914185749641","+919685748596"]
    
    // var ArrImage = [UIImage(imageLiteralResourceName: "IMG_0404"),
    //                    UIImage(imageLiteralResourceName: "IMG_0384"),
    //                    UIImage(imageLiteralResourceName: "IMG_0408"),
    //                    UIImage(imageLiteralResourceName: "IMG_0393"),
    //                    UIImage(imageLiteralResourceName: "IMG_0386"),
    //                    UIImage(imageLiteralResourceName: "IMG_0382"),
    //                    UIImage(imageLiteralResourceName: "IMG_0418"),
    //                    UIImage(imageLiteralResourceName: "IMG_0399"),
    //                    UIImage(imageLiteralResourceName: "IMG_0414"),
    //                    UIImage(imageLiteralResourceName: "IMG_0402")]
    
    @IBOutlet var tableview: UITableView!
    @IBOutlet var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let obj1 = WSContacts(userImage: "IMG_0404", userName: "Janny", userNumber: "+916953297181", ShowStack: false, lblTime: "14:8")
        let obj2 = WSContacts(userImage: "IMG_0384", userName: "Olivia", userNumber: "+917845787485", ShowStack: false, lblTime: "14:15")
        let obj3 = WSContacts(userImage: "IMG_0408", userName: "Angelique", userNumber: "+916242187485", ShowStack: false, lblTime: "14:20")
        let obj4 = WSContacts(userImage: "IMG_0393", userName: "Emma", userNumber: "+912456749810", ShowStack: false, lblTime: "14:30")
        let obj5 = WSContacts(userImage: "IMG_0386", userName: "Charlotte", userNumber: "+914578963125", ShowStack: false, lblTime: "14:50")
        let obj6 = WSContacts(userImage: "IMG_0382", userName: "Amelia", userNumber: "+916352417485", ShowStack: false, lblTime: "Yesterday")
        let obj7 = WSContacts(userImage: "IMG_0418", userName: "Wrenley", userNumber: "+914152637485", ShowStack: false, lblTime: "Yesterday")
        let obj8 = WSContacts(userImage: "IMG_0399", userName: "Ava", userNumber: "+919685748596", ShowStack: false, lblTime: "Yesterday")
        let obj9 = WSContacts(userImage: "IMG_0414", userName: "Sophia", userNumber: "+914185749641", ShowStack: false, lblTime: "Yesterday")
        let obj10 = WSContacts(userImage: "IMG_0402", userName: "Isabellav", userNumber: "+919685748596", ShowStack: false, lblTime: "Yesterday")
        
        
        self.ArrContacts.append(obj1)
        self.ArrContacts.append(obj2)
        self.ArrContacts.append(obj3)
        self.ArrContacts.append(obj4)
        self.ArrContacts.append(obj5)
        self.ArrContacts.append(obj6)
        self.ArrContacts.append(obj7)
        self.ArrContacts.append(obj8)
        self.ArrContacts.append(obj9)
        self.ArrContacts.append(obj10)
       
        
        container.alpha = 0
        
        self.Galaryview.alpha = 0
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Inter-Medium", size: 18) as Any
        ]
        segment.setTitleTextAttributes(selectedAttributes, for: .selected)
        
        let deselectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1),
            .font: UIFont(name: "Inter-Medium", size: 18) as Any
        ]
        segment.setTitleTextAttributes(deselectedAttributes, for: .normal)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.container.alpha = 0
    }
    
    @IBAction func segment(_ sender: UISegmentedControl) {
        
        if segment.selectedSegmentIndex == 1{
            UIView.animate(withDuration: 0.5, animations: {
                self.container.alpha = 0
                self.Galaryview.alpha = 1
                self.lbltitle.text = "Gallery"
                
            })
        }else{
            UIView.animate(withDuration: 0.5, animations: {
                self.container.alpha = 0
                self.Galaryview.alpha = 0
                self.lbltitle.text = "Whatsapp"
            })
        }
    }
    
    @IBAction func sidemenu(_ sender: UIButton) {
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
    
    @IBAction func SearchContact(_ sender: UIButton) {
        let Navigate = self.storyboard?.instantiateViewController(withIdentifier: "selectcontactViewController") as! selectcontactViewController
        Navigate.modalPresentationStyle = .overFullScreen
        Navigate.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(Navigate, animated: true)
    }
    
    @IBAction func showcontainer(_ sender: UIButton) {
        container.alpha = 1
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.container.alpha = 0
    }
    @IBAction func stackShow(_ sender: UIButton) {
        //
        //
        //                guard self.tableview.cellForRow(at: IndexPath(row: sender.tag, section: 0)) is contactTableViewCell else {
        //                                        return
        //                                    }
        //
        //                let obj = self.ArrContacts[sender.tag]
        //                self.selectedindex = sender.tag
        //                if selectedindex == sender.tag {
        //
        //
        //                        if obj.ShowStack == true {
        //                            obj.ShowStack = false
        //                            sender.isSelected = false
        //                            self.isCollapce = false
        //                            //sender.setImage(UIImage(named: "heart"), for: .selected)
        //                        }else {
        //                            obj.ShowStack = true
        //                            sender.isSelected = true
        //                            self.isCollapce = true
        //                            // sender.setImage(UIImage(named: "heart (1)"), for: .normal)
        //                        }
        //
        //                    if self.lastSelectedIndex != -1 {
        //                        guard let lastSelectedCell = self.tableview.cellForRow(at: IndexPath(row: self.lastSelectedIndex, section: 0)) as? contactTableViewCell else  {
        //                            return
        //                        }
        //                        lastSelectedCell.btnshow.isSelected = false
        //                        let lastObj = self.ArrContacts[self.lastSelectedIndex]
        //                        lastObj.ShowStack = false
        //                        self.lastSelectedIndex = sender.tag
        //                    }else {
        //                        self.lastSelectedIndex = sender.tag
        //                    }
        //
        //                    }else{
        //                        self.isCollapce = false
        //                        sender.isSelected = false
        //                    }
        //
        //                    tableview.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
        //
        //                    }
        
        
        guard let cell = tableview.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as? contactTableViewCell else {
            return
        }
        
        let obj = ArrContacts[sender.tag]
        selectedindex = sender.tag
        
        if obj.ShowStack {
            obj.ShowStack = false
            sender.isSelected = false
            isCollapce = false
            lastSelectedIndex = -1
        } else {
            for contact in ArrContacts {
                contact.ShowStack = false
            }
            
            obj.ShowStack = true
            sender.isSelected = true
            isCollapce = true
            
            if lastSelectedIndex != -1, let lastSelectedCell = tableview.cellForRow(at: IndexPath(row: lastSelectedIndex, section: 0)) as? contactTableViewCell {
                lastSelectedCell.btnshow.isSelected = false
                let lastObj = ArrContacts[lastSelectedIndex]
                lastObj.ShowStack = false
            }
            
            lastSelectedIndex = sender.tag
        }
        
        tableview.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
        
    }

extension whastappViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return ArrName.count// & ArrNumber.count & ArrImage.count
        return ArrContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! contactTableViewCell
        cell.selectionStyle = .none
        let obj = self.ArrContacts[indexPath.row]
        //self.isCollapce = true
        //        cell.lblname.text = ArrName[indexPath.row]
        //        cell.lblnumber.text = ArrNumber[indexPath.row]
        //        cell.contactimage.image = ArrImage[indexPath.row]
        cell.lblname.text = obj.userName
        cell.lblnumber.text = "Phone" + " " + obj.userNumber
        cell.contactimage.image = UIImage(named:obj.userImage)
        cell.lbltime.text = obj.lblTime
        //        cell.btnshow.isSelected = obj.ShowStack
        //cell.btnshow.setImage(UIImage(named: "show"), for: .normal)
        cell.btnshow.isSelected = obj.ShowStack
        cell.btnshow.tag = indexPath.row
        cell.lblname.tag = indexPath.row
        cell.lblnumber.tag = indexPath.row
        cell.contactimage.tag = indexPath.row
        cell.lbltime.tag = indexPath.row
        self.tableview.tag = indexPath.row
        if selectedindex == indexPath.row{
            //cell.btnshow.isSelected = false
           // self.isCollapce = true
            
            //  cell.btnshow.setImage(UIImage(named: "ReverseTraingle"), for: .normal)
           
        }else{
            //cell.btnshow.isSelected = true
          //  self.isCollapce = false
            //   cell.btnshow.setImage(UIImage(named: "StraightTraingle"), for: .normal)
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if self.selectedindex == indexPath.row && isCollapce == true{
            return 120
            
        }else{
            return 80
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath) as! contactTableViewCell
//        tableview.deselectRow(at: indexPath, animated: true)
//        self.container.alpha = 0
//        let obj = self.ArrContacts[indexPath.row]
//        self.selectedindex = indexPath.row
//        if selectedindex == indexPath.row {
//            guard self.tableview.cellForRow(at: IndexPath(row: tableview.tag, section: 0)) is contactTableViewCell else {
//                                    return
//                                }
//
//                if obj.ShowStack == true {
//                    obj.ShowStack = false
//                    cell.btnshow.isSelected = false
//                    self.isCollapce = false
//                    //sender.setImage(UIImage(named: "heart"), for: .selected)
//                }else {
//                    obj.ShowStack = true
//                    cell.btnshow.isSelected = true
//                    self.isCollapce = true
//                    // sender.setImage(UIImage(named: "heart (1)"), for: .normal)
//                }
//
//            if self.lastSelectedIndex != -1 {
//                guard let lastSelectedCell = self.tableview.cellForRow(at: IndexPath(row: self.lastSelectedIndex, section: 0)) as? contactTableViewCell else  {
//                    return
//                }
//                lastSelectedCell.btnshow.isSelected = false
//                let lastObj = self.ArrContacts[self.lastSelectedIndex]
//                lastObj.ShowStack = false
//                self.lastSelectedIndex = indexPath.row
//            }else {
//                self.lastSelectedIndex = indexPath.row
//            }
//
//            }else{
//                self.isCollapce = false
//                cell.btnshow.isSelected = false
//            }
//
//            tableview.reloadRows(at: [indexPath], with: .automatic)
//        }
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        self.container.alpha = 0
//    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? contactTableViewCell else {
            return
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        container.alpha = 0
        
        let obj = ArrContacts[indexPath.row]
        selectedindex = indexPath.row
        
        if obj.ShowStack {
            obj.ShowStack = false
            cell.btnshow.isSelected = false
            isCollapce = false
            lastSelectedIndex = -1
        } else {
            for contact in ArrContacts {
                contact.ShowStack = false
            }
            
            obj.ShowStack = true
            cell.btnshow.isSelected = true
            isCollapce = true
            lastSelectedIndex = indexPath.row
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
        func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            self.container.alpha = 0
        }

    }

