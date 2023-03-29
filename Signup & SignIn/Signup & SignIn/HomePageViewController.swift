//
//  HomePageViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 22/03/23.
//

import UIKit

class HomePageViewController: UIViewController {
    var isSelected = 0

    @IBOutlet var tableview: UITableView!
    @IBOutlet var tabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        tableview.register(UINib(nibName: "HomeCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.view.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        self.tableview.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
        tabbar.layer.masksToBounds = true
        tabbar.layer.cornerRadius = 25
        tabbar.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        
       
        
   
    }

}
//extension HomePageViewController:UITableViewDelegate,UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCellTableViewCell
//        return cell
//    }
//
//}

extension HomePageViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HometableViewCell
        return cell
    }
    
    
}
