//
//  whastappViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 13/04/23.
//

import UIKit
import SideMenu

class whastappViewController: UIViewController {
    
    var cellHeight : CGFloat = 100
    var stackview : UIStackView!
    var isCollapce = false
    var isExpand = false
    var selectedindex = 0
    var SideContainer = 0
    var ArrContacts:[WSContacts] = []
    var lastSelectedIndex = -1
    
    // IB-Outlets
    
    @IBOutlet var container: UIView!
    @IBOutlet var btnFloting: UIButton!
    @IBOutlet var lbltitle: UILabel!
    @IBOutlet var Galaryview: UIView!
    @IBOutlet var tableview: UITableView!
    @IBOutlet var segment: UISegmentedControl!
    
    // View DidLoad Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        container.alpha = CGFloat(SideContainer)
        
        let obj1 = WSContacts(userImage: "IMG_0404", userName: "Janny", userNumber: "+916953297181", ShowStack: false, lblTime: "14:8")
        let obj2 = WSContacts(userImage: "IMG_0384", userName: "Olivia", userNumber: "+917845787485", ShowStack: false, lblTime: "14:15")
        let obj3 = WSContacts(userImage: "IMG_0408", userName: "Angelique", userNumber: "+916242187485", ShowStack: false, lblTime: "14:20")
        let obj4 = WSContacts(userImage: "IMG_0393", userName: "Emma", userNumber: "+912456749810", ShowStack: false, lblTime: "14:30")
        let obj5 = WSContacts(userImage: "IMG_0386", userName: "Charlotte", userNumber: "+914578963125", ShowStack: false, lblTime: "14:50")
        let obj6 = WSContacts(userImage: "IMG_0402", userName: "Amelia", userNumber: "+916352417485", ShowStack: false, lblTime: "Yesterday")
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
    
    // View Will Appear Function
    
    override func viewWillAppear(_ animated: Bool) {
        self.container.alpha = 0
        NotificationCenter.default.addObserver(self, selector: #selector(dismissSideMenu), name: NSNotification.Name("HideMenu"), object: nil)
    }
    
    // Hide Menu Function
    
    @objc func hideMenu(){
        container.alpha = 0
    }
    
    // Dismiss MeSide Menu Function
    
    @objc func dismissSideMenu() {
        container.alpha = 0
    }
    
    // Segment Control Action
    
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
    
    // Side Menu Action Button
    
    @IBAction func sidemenu(_ sender: UIButton) {
        container.alpha = 0
        
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
    
    // Search Action Button
    
    @IBAction func SearchContact(_ sender: UIButton) {
        let Navigate = self.storyboard?.instantiateViewController(withIdentifier: "selectcontactViewController") as! selectcontactViewController
        Navigate.modalPresentationStyle = .overFullScreen
        Navigate.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(Navigate, animated: true)
    }
    
    // Show Menu Container Action Button
    
    @IBAction func showcontainer(_ sender: UIButton) {
        container.alpha = 1
    }
    
    // Touch Event
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.container.alpha = 0
    }
    
    // Stack Show Action Button
    
    @IBAction func stackShow(_ sender: UIButton) {
        guard self.tableview.cellForRow(at: IndexPath(row: Int(sender.tag), section: 0)) is contactTableViewCell else{
            return
        }
        
        let obj = self.ArrContacts[sender.tag]
        
        self.selectedindex = sender.tag
        tableview.deselectRow(at: IndexPath(row: Int(sender.tag), section: 0), animated: false)
        
        if selectedindex == sender.tag {
            if obj.ShowStack == true{
                obj.ShowStack = false
                self.isCollapce = false
            }else{
                obj.ShowStack = true
                self.isCollapce = true
            }
        }else{
            self.isCollapce = true
        }
        
        //this for cell button collspan btn new code
        for i in 0..<ArrContacts.count {
            ArrContacts[i].ShowStack = (i == sender.tag)
        }
        
        tableview.reloadData()
    }
}

    // Tableview Delegate

extension whastappViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrContacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! contactTableViewCell
        cell.selectionStyle = .none
        let obj = self.ArrContacts[indexPath.row]
        cell.lblname.text = obj.userName
        cell.lblnumber.text = "Phone" + " " + obj.userNumber
        cell.contactimage.image = UIImage(named:obj.userImage)
        cell.lbltime.text = obj.lblTime
        cell.btnshow.isSelected = obj.ShowStack
        cell.btnshow.tag = indexPath.row
        cell.lblname.tag = indexPath.row
        cell.lblnumber.tag = indexPath.row
        cell.contactimage.tag = indexPath.row
        cell.lbltime.tag = indexPath.row
        self.tableview.tag = indexPath.row
        if selectedindex == indexPath.row{
        }else{
            // Nothing
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let obj = ArrContacts[indexPath.row]
        if self.selectedindex == indexPath.row && isCollapce == true{
            obj.ShowStack =  true
            return 120
        }else{
            obj.ShowStack = false
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard self.tableview.cellForRow(at: IndexPath(row: Int(indexPath.row), section: 0)) is contactTableViewCell else{
            return
        }
        
        let obj = self.ArrContacts[indexPath.row]
        
        self.selectedindex = indexPath.row
        tableview.deselectRow(at: IndexPath(row: Int(indexPath.row), section: 0), animated: false)
        
        if selectedindex == indexPath.row {
            if obj.ShowStack == true{
                obj.ShowStack = false
                self.isCollapce = false
            }else{
                obj.ShowStack = true
                self.isCollapce = true
            }
        }else{
            self.isCollapce = true
        }
        
        
        //this for cell button collspan btn new code
        for i in 0..<ArrContacts.count {
            ArrContacts[i].ShowStack = (i == indexPath.row)
        }
        
        tableview.reloadData()
    
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.container.alpha = 0
    }
}

