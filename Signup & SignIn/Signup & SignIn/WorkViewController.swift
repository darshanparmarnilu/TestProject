//
//  WorkViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 12/04/23.
//

import UIKit
import SideMenu

class WorkViewController: UIViewController {
    
    var SliderMaxvalue = 100
    
    var checkStar:Bool! = false

    @IBOutlet var subView: UIView!
   // var arrWork = ["Running","Push-Ups","Strecthing","Playing","Push-Ups","Strecthing","Playing"]
   
    //var arrColor = [UIColor.green,UIColor.red,UIColor.green,UIColor.purple,UIColor.red,UIColor.green,UIColor.purple]
    @IBOutlet var tableview: UITableView!
    
    var ArrWorkOut:[WorkOut] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subView.alpha = 0
        
        
        let obj1 = WorkOut(arrColors: UIColor.red, WorkType: "Running", Switch: false, Slider: 10)
        let obj2 = WorkOut(arrColors: UIColor.orange, WorkType: "Push-Ups", Switch: false, Slider: 20)
        let obj3 = WorkOut(arrColors: UIColor.yellow, WorkType: "Strecthing", Switch: false, Slider: 30)
        let obj4 = WorkOut(arrColors: UIColor.green, WorkType: "Playing", Switch: false, Slider: 40)
        let obj5 = WorkOut(arrColors: UIColor.blue, WorkType: "Gamming", Switch: false, Slider: 50)
        let obj6 = WorkOut(arrColors: UIColor.purple, WorkType: "Singing", Switch: false, Slider: 60)
        let obj7 = WorkOut(arrColors: UIColor.brown, WorkType: "Swiming", Switch: false, Slider: 10)
        let obj8 = WorkOut(arrColors: UIColor.black, WorkType: "Catching", Switch: false, Slider: 20)
        let obj9 = WorkOut(arrColors: UIColor.gray, WorkType: "Eating", Switch: false, Slider: 30)
        let obj10 = WorkOut(arrColors: UIColor.cyan, WorkType: "Dancing", Switch: false, Slider: 40)
        let obj11 = WorkOut(arrColors: UIColor.magenta, WorkType: "Putting", Switch: false, Slider: 50)
        
        self.ArrWorkOut.append(obj1)
        self.ArrWorkOut.append(obj2)
        self.ArrWorkOut.append(obj3)
        self.ArrWorkOut.append(obj4)
        self.ArrWorkOut.append(obj5)
        self.ArrWorkOut.append(obj6)
        self.ArrWorkOut.append(obj7)
        self.ArrWorkOut.append(obj8)
        self.ArrWorkOut.append(obj9)
        self.ArrWorkOut.append(obj10)
        self.ArrWorkOut.append(obj11)
        
        tableview.delegate = self
        tableview.dataSource = self
        self.tableview.reloadData()
        
        
    }
   
    
    @IBAction func menushow(_ sender: UIButton) {
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
    
    @IBAction func slider(_ sender: UISlider) {
        
        guard let cell = self.tableview.cellForRow(at: IndexPath(row: Int(sender.tag), section: 0)) as? WorkTableViewCell else {
            return
        }
        cell.lbl0.text = "\(sender.value.rounded())"
      //  cell.progressbar.progress = cell.slider.value.rounded()
        cell.progressbar.progress = sender.value / 100
        cell.ratio.text = "\(sender.value.rounded()) /\(SliderMaxvalue)"
        cell.subview.alpha = CGFloat(sender.value / 100)
        let obj = self.ArrWorkOut[sender.tag]
        obj.Slider = Int(sender.value.rounded())
        
    }
    @IBAction func actSwitch(_ sender: UISwitch) {
        guard let cell = self.tableview.cellForRow(at: IndexPath(row: Int(sender.tag), section: 0)) as? WorkTableViewCell else {
            return
        }
        let obj = self.ArrWorkOut[sender.tag]
        if obj.Switch == true{
            obj.Switch = false
           // obj.Slider = false
            obj.Slider = Int(cell.slider.value)
            cell.slider.isEnabled = false
            sender.isOn = false
        }else{
            obj.Switch = true
            sender.isOn = true
            cell.slider.isEnabled = true
            obj.Slider = Int(cell.slider.value)
            //obj.Slider = true
        }
    }
    @IBAction func optionbutton(_ sender: UIButton) {
        subView.alpha = 1
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesEnded(touches, with: event)
            self.subView.alpha = 0
        }
    @IBAction func Rating(_ sender: UIButton) {
        let obj = self.ArrWorkOut[sender.tag]
        if sender.tag == 1{
            sender.isSelected = !sender.isSelected
        }else if sender.tag == 2{
            sender.isSelected = !sender.isSelected
        }else if sender.tag == 3{
            sender.isSelected = !sender.isSelected
        }
    }
}

extension WorkViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrWorkOut.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = self.tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WorkTableViewCell
        cell.selectionStyle = .none
        let obj = self.ArrWorkOut[indexPath.row]
        cell.subview.backgroundColor = obj.arrColors
        cell.lblwork.text = obj.WorkType
        cell.btnSwitch.isOn = obj.Switch
       // print("row value " + "\(indexPath.row)")
       // print("switch :- " + "\(obj.Switch)")
        cell.slider.value = Float(Int(obj.Slider))
        cell.btnSwitch.tag = indexPath.row
        cell.slider.tag = indexPath.row
        //cell.progressbar.tag = indexPath.row
        //cell.subview.tag = indexPath.row
        cell.lbl0.tag = indexPath.row
        cell.lbl100.tag = indexPath.row
        cell.ratio.tag = indexPath.row
//        cell.progressbar.progress = Float(Int(obj.Slider!))
//        cell.subview.alpha = CGFloat(Int(obj.Slider!) / 100)
        cell.progressbar.progress = Float(cell.slider.value / 100)
        cell.subview.alpha = CGFloat(cell.slider.value / 100)
        cell.lbl0.text = "\(cell.slider.value)"
        cell.ratio.text = "\(cell.slider.value) /\(SliderMaxvalue)"
        
        if cell.btnSwitch.isOn == false{
            cell.slider.isEnabled = false
        }else{
            cell.slider.isEnabled = true
        }
        return cell
    }
}
