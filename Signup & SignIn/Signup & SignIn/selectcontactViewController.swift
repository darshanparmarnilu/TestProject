//
//  selectcontactViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 13/04/23.
//

import UIKit

class selectcontactViewController: UIViewController {
    
    
    
    var ArrImage = [UIImage(imageLiteralResourceName: "IMG_0404"),
                    UIImage(imageLiteralResourceName: "IMG_0384"),
                    UIImage(imageLiteralResourceName: "IMG_0408"),
                    UIImage(imageLiteralResourceName: "IMG_0393"),
                    UIImage(imageLiteralResourceName: "IMG_0386"),
                    UIImage(imageLiteralResourceName: "IMG_0382"),
                    UIImage(imageLiteralResourceName: "IMG_0418"),
                    UIImage(imageLiteralResourceName: "IMG_0399"),
                    UIImage(imageLiteralResourceName: "IMG_0414"),
                    UIImage(imageLiteralResourceName: "IMG_0402")]

    var ArrName = ["Janny","Olivia","Wrenley","Emma","Charlotte","Amelia","Angelique","Ava","Sophia"," Isabella"]
    
    
//    var image:[UIImage] = []
    var searching : Bool!

    
   
    @IBOutlet var btnsearch: UIButton!
    
    @IBOutlet var CountUser: UILabel!
    @IBOutlet var container: UIView!
    @IBOutlet var subView: UIView!
    @IBOutlet var backbtn: UIButton!
    @IBOutlet var searchbar: UISearchBar!
    @IBOutlet var searchview: UIView!
    @IBOutlet var tableview: UITableView!
    var arrContact : [ContactData] = []
    var arrContactData : [ContactData] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        let obj = ContactData(strName: "Janny", strNumber: "+916953297181", strImage: "IMG_0404")
        let obj1 = ContactData(strName: "Dsp", strNumber: "+917845787485", strImage: "IMG_0384")
        let obj2 = ContactData(strName: "Dharmesh", strNumber: "+916242187485", strImage: "IMG_0408")
        let obj3 = ContactData(strName: "Vishv", strNumber: "+912456749810", strImage: "IMG_0393")
        let obj4 = ContactData(strName: "Manthan", strNumber: "+914578963125", strImage: "IMG_0386")
        let obj5 = ContactData(strName: "Mayur", strNumber: "+916352417485", strImage: "IMG_0404")
        let obj6 = ContactData(strName: "Bharat", strNumber: "+914152637485", strImage: "IMG_0404")
        let obj7 = ContactData(strName: "Krishna", strNumber: "+919685748596", strImage: "IMG_0404")
        let obj8 = ContactData(strName: "Rinkal", strNumber: "+914185749641", strImage: "IMG_0404")
        let obj9 = ContactData(strName: "Pinakl", strNumber: "+919685748596", strImage: "IMG_0404")
        let obj10 = ContactData(strName: "Jinkal", strNumber: "+919825612563", strImage: "IMG_0404")
        let obj11 = ContactData(strName: "Sam", strNumber: "+919924589963", strImage: "IMG_0404")
        let obj12 = ContactData(strName: "Jon", strNumber: "+919798456312", strImage: "IMG_0404")
        let obj13 = ContactData(strName: "Holder", strNumber: "+919554212369", strImage: "IMG_0404")
        let obj14 = ContactData(strName: "Dhoni", strNumber: "+919685456319", strImage: "IMG_0404")
        let obj15 = ContactData(strName: "Sachin", strNumber: "+918090706012", strImage: "IMG_0404")
        self.arrContact.append(obj)
        self.arrContact.append(obj1)
        self.arrContact.append(obj2)
        self.arrContact.append(obj3)
        self.arrContact.append(obj4)
        self.arrContact.append(obj5)
        self.arrContact.append(obj6)
        self.arrContact.append(obj7)
        self.arrContact.append(obj8)
        self.arrContact.append(obj9)
        self.arrContact.append(obj10)
        self.arrContact.append(obj11)
        self.arrContact.append(obj12)
        self.arrContact.append(obj13)
        self.arrContact.append(obj14)
        self.arrContact.append(obj15)
        
        subView.alpha = 1
        searchview.alpha = 0
        
        self.arrContactData = self.arrContact
        searchbar.delegate = self
        
        subView.isHidden = false
        container.alpha = 0
       
        
        self.CountUser.text = String(self.arrContact.count) + " "+"Contacts"
    }
    
    @IBAction func backVC(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        searchview.alpha = 0
        container.alpha = 0
        searchbar.text = ""
        tableview.reloadData()
    }
    
    @IBAction func search(_ sender: Any) {

        searchview.alpha = 1

    }
    
    @IBAction func showcontainer(_ sender: UIButton) {
        container.alpha = 1
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.container.alpha = 0
    }
    
    
}

extension selectcontactViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrContact.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as! selectcontactTableViewCell
        let obj = self.arrContact[indexPath.row]
        
        cell.lblname.text = obj.strName
        cell.lblnumber.text = obj.strNumber
        cell.contactimage.image = UIImage(named: obj.strImage)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         "Contacts on Mobile"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        let titleLabel = UILabel(frame: CGRect(x: 12, y: 0, width: tableView.bounds.size.width - 30, height: 50))
        headerView.textLabel?.textColor = UIColor(red: 5/256, green: 28/256, blue: 107/256, alpha: 1)
        headerView.textLabel?.font = UIFont(name: "Inter-Medium", size: 22)
        headerView.addSubview(titleLabel)
    }
 
}

extension selectcontactViewController:UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.arrContact = self.arrContactData
        self.tableview.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if searchText.isEmpty == false {
            let strText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
            let filter = arrContactData.filter({($0.strName + $0.strNumber).contains(strText.localizedCapitalized)})
            self.arrContact = filter
            self.tableview.reloadData()
        }else{

            self.arrContact = self.arrContactData
            self.tableview.reloadData()
        }
        self.container.alpha = 0
        self.tableview.reloadData()
    }
}
