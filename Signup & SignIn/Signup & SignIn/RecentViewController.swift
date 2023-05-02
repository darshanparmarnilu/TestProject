//
//  RecentViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 17/04/23.
//

import UIKit


class RecentViewController: UIViewController {

    var ArrImg : [String] = []
    
    @IBOutlet var collactionview: UICollectionView!
    @IBOutlet var container: UIView!
    var ImgCount = 0
    var currentIndex = 0
    @IBOutlet var lblcount: UILabel!
    @IBOutlet var btnnext: UIButton!
    @IBOutlet var btnprev: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        collactionview.delegate = self
        collactionview.dataSource = self
        self.ImgCount = ArrImg.count
        
        lblcount.text = "\(currentIndex+1)" + "/" + "\(ArrImg.count)"
        
       // imageview.contentMode = .scaleAspectFit
       // imageview.image = UIImage(named:  ArrImg[0])
        container.alpha = 0
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collactionview.reloadData()
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.container.alpha = 0
    }

    @IBAction func showContainer(_ sender: UIButton) {
        container.alpha = 1
    }
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true)
       // self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func previewimage(_ sender: UIButton) {
//        if currentIndex == 0 {
//                return
//            btnprev.isEnabled = false
//            }
//        btnnext.isEnabled = true
//            currentIndex = (currentIndex - 1) % ArrImg.count
//            imageview.image =  UIImage(named:  ArrImg[currentIndex])//ArrImg[currentIndex]
//
//        if currentIndex < 0 {
//        currentIndex = ArrImg.count - 1 // wrap around to the last image
//            }
//            updateImageView()
        
        if currentIndex > 0 {
                   
                   currentIndex -= 1
                   let visibleItems = collactionview.indexPathsForVisibleItems
                   let currentItem = visibleItems[0]
                   let previousItem = IndexPath(item: currentItem.item - 1, section: currentItem.section)

                   collactionview.scrollToItem(at: previousItem, at: .right, animated: true)
                   collactionview.reloadData()
               }
    }
    
    @IBAction func nextimage(_ sender: UIButton) {
        
//        if currentIndex == ArrImg.count - 1 {
//            btnnext.isEnabled = false
//                return
//            }
//        btnprev.isEnabled = true
//            currentIndex = (currentIndex + 1) % ArrImg.count
//            imageview.image = UIImage(named:  ArrImg[currentIndex])
//
//        if currentIndex >= ArrImg.count {
//                currentIndex = 0 // wrap around to the first image
//            }
//            updateImageView()
        
        if currentIndex < ImgCount - 1 {
            currentIndex += 1
            let visibleItems = collactionview.indexPathsForVisibleItems
            let currentItem = visibleItems[0]
            let nextItem = IndexPath(item: currentItem.item + 1, section: currentItem.section)
            
            collactionview.scrollToItem(at: nextItem, at: .left, animated: true)
            collactionview.reloadData()
        }
    }
    
//    func updateImageLabel() {
//        lblcount.text = "\(currentIndex+1)" + "/" + "\(ArrImg.count)"
//    }
//    func updateImageView() {
//            imageview.image = UIImage(named:  ArrImg[currentIndex])
//            updateImageLabel()
//    }
    
    
}

extension RecentViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ArrImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AlbamCollectionViewCell
               cell.imageView.image = UIImage(named: ArrImg[indexPath.row] )

        lblcount.text = "\(currentIndex+1)" + "/" + "\(ArrImg.count)"
               btnnext.isEnabled = currentIndex < ImgCount - 1
               btnprev.isEnabled = currentIndex > 0
               return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           let visibleRect = CGRect(origin: collactionview.contentOffset, size: collactionview.bounds.size)
           let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
           guard let indexPath = collactionview.indexPathForItem(at: visiblePoint) else { return }
           currentIndex = indexPath.row
           lblcount.text = "\(currentIndex+1)" + "/" + "\(ArrImg.count)"
           btnnext.isEnabled = currentIndex < ImgCount - 1
           btnprev.isEnabled = currentIndex > 0

       }
    
}
extension RecentViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
}
