//
//  HomePageViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 22/03/23.
//

import UIKit
import Toast_Swift
import SideMenu

class HomePageViewController: UIViewController, UINavigationControllerDelegate, CAAnimationDelegate {
    var isSelected = 0
    @IBOutlet var subView: UIView!
    @IBOutlet var tableview: UITableView!
    
    @IBOutlet var subview: UIView!
    var ArrImg : [HomeCellImage] = []
    
    //  @IBOutlet var tabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        subView.alpha = 0
        
        
        let obj1 = HomeCellImage(arrImages: ["image1","image3","image6","image4","image5","image2"], strUserName: "Rocky", strLocation: "Mumbai",strUserImg: "IMG_0437",strLike: false,strBookmark: false,currentPageNo: 0)
        let obj2 = HomeCellImage(arrImages: ["image101","image102","image103","image104"], strUserName: "Badshah", strLocation: "Delhi",strUserImg: "IMG_0441",strLike: false,strBookmark: false,currentPageNo: 0)
        let obj3 = HomeCellImage(arrImages: ["image105","image106","image107","image108"], strUserName: "PushpaRaaz", strLocation: "Jaipur",strUserImg: "IMG_0442",strLike: false,strBookmark: false,currentPageNo: 0)
        let obj4 = HomeCellImage(arrImages: ["image109","image110","image111","image112","image107","image108"], strUserName: "Amon", strLocation: "Amritsar",strUserImg: "IMG_0443",strLike: false,strBookmark: false,currentPageNo: 0)
        let obj5 = HomeCellImage(arrImages: ["image101","image102","image103","image104","image109","image110"], strUserName: "Sikandar", strLocation: "Banglore",strUserImg: "IMG_0453",strLike: false,strBookmark: false,currentPageNo: 0)
        let obj6 = HomeCellImage(arrImages: ["image1","image3","image6","image4","image5","image2"], strUserName: "Guru", strLocation: "Mumbai",strUserImg: "IMG_0437",strLike: false,strBookmark: false,currentPageNo: 0)
        let obj7 = HomeCellImage(arrImages: ["image101","image102","image103","image104"], strUserName: "Mangesh", strLocation: "Delhi",strUserImg: "IMG_0441",strLike: false,strBookmark: false,currentPageNo: 0)
        let obj8 = HomeCellImage(arrImages: ["image105","image106","image107","image108"], strUserName: "Vikram", strLocation: "Jaipur",strUserImg: "IMG_0442",strLike: false,strBookmark: false,currentPageNo: 0)
        let obj9 = HomeCellImage(arrImages: ["image109","image110","image111","image112","image107","image108"], strUserName: "Rakesh", strLocation: "Amritsar",strUserImg: "IMG_0443",strLike: false,strBookmark: false,currentPageNo: 0)
        let obj10 = HomeCellImage(arrImages: ["image101","image102","image103","image104","image109","image110"], strUserName: "Dev", strLocation: "Banglore",strUserImg: "IMG_0453",strLike: false,strBookmark: false,currentPageNo: 0)
        
        
        self.ArrImg.append(obj1)
        self.ArrImg.append(obj2)
        self.ArrImg.append(obj3)
        self.ArrImg.append(obj4)
        self.ArrImg.append(obj5)
        self.ArrImg.append(obj6)
        self.ArrImg.append(obj7)
        self.ArrImg.append(obj8)
        self.ArrImg.append(obj9)
        self.ArrImg.append(obj10)
    }
    
    
    @IBAction func menu(_ sender: UIButton) {
        
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

    @IBAction func btnsave(_ sender: UIButton) {
        let obj = self.ArrImg[sender.tag]
        if obj.strBookmark == true{
            obj.strBookmark = false
            sender.isSelected = false
            //sender.setImage(UIImage(named: "bookmark"), for: .normal)
        }else{
            obj.strBookmark = true
            sender.isSelected  = true
            //sender.setImage(UIImage(named: "save-instagram"), for: .selected)
        }
    }
    @IBAction func likebtn(_ sender: UIButton) {
        let obj = self.ArrImg[sender.tag]
        if obj.strLike == true {
            obj.strLike = false
            sender.isSelected = false
            //sender.setImage(UIImage(named: "heart"), for: .selected)
        }else {
            obj.strLike = true
            sender.isSelected = true
           // sender.setImage(UIImage(named: "heart (1)"), for: .normal)
        }
        
    }
    @IBAction func DisplayOption(_ sender: UIButton) {
        self.subView.alpha = 1
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.subView.alpha = 0
    }

}

extension HomePageViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ArrImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HometableViewCell
        cell.selectionStyle = .none
        let obj = self.ArrImg[indexPath.row]
        cell.collactionview.delegate = self
        cell.collactionview.dataSource = self
        cell.collactionview.tag = indexPath.row
       // cell.collactionview.reloadData()
        cell.lblLocation.text = obj.strLocation
        cell.lblUserName.text = obj.strUserName
        cell.btnlike.isSelected = obj.strLike
        cell.btnsave.isSelected = obj.strBookmark
        cell.page.currentPage = obj.currentPageNo
        cell.userImg.image = UIImage(named: obj.strUserImg)
        cell.page.numberOfPages = obj.arrImages.count
        cell.btnlike.tag = indexPath.row
        cell.btnsave.tag = indexPath.row
//        if obj.strLike == true {
//            cell.btnlike.setImage(UIImage(named: "heart (1)"), for: .normal)
//        }else {
//            cell.btnlike.setImage(UIImage(named: "heart"), for: .selected)
//        }
//        if obj.strBookmark == true{
//            cell.btnsave.setImage(UIImage(named: "bookmark"), for: .normal)
//        }else{
//            cell.btnsave.setImage(UIImage(named: "save-instagram"), for: .selected)
//        }
        return cell
    }
}
extension UIViewController {
    
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false)
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false)
    }
    
    
}

extension HomePageViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.ArrImg[collectionView.tag].arrImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! homeCollectionViewCell
        let obj = self.ArrImg[collectionView.tag]
        cell.image.image = UIImage(named: obj.arrImages[indexPath.item])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //self.page?.currentPage = indexPath.item
        
        guard let cellTbl = self.tableview.cellForRow(at: IndexPath(row: collectionView.tag, section: 0)) as? HometableViewCell else {
            return
        }
        self.ArrImg[ collectionView.tag].currentPageNo = indexPath.item
        cellTbl.page.currentPage = indexPath.item
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        // self.page.currentPage = Int(roundedIndex)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //page.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        //page.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}
extension HomePageViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        
        return CGSize(width: size.width, height: size.height)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
