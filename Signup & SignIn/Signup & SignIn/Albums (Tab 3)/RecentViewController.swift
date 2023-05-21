//
//  RecentViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 17/04/23.
//

import UIKit


class RecentViewController: UIViewController {
    
    var isScrolling = false
    
    var ArrImg : [String] = []
    var AlbamName = ""
    var ImgCount = 0
    var currentIndex = 0
    
    // IB-Outlets
    
    @IBOutlet weak var lblAlbam: UILabel!
    @IBOutlet var collactionview: UICollectionView!
    @IBOutlet var container: UIView!
    @IBOutlet var lblcount: UILabel!
    @IBOutlet var btnnext: UIButton!
    @IBOutlet var btnprev: UIButton!
    
    // View Did Load Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collactionview.delegate = self
        collactionview.dataSource = self
        self.ImgCount = ArrImg.count
        self.lblAlbam.text = AlbamName
        lblcount.text = "\(currentIndex+1)" + "/" + "\(ArrImg.count)"
        container.alpha = 0
    }
    
    // View Will Appear Function
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.container.alpha = 0
        collactionview.reloadData()
    }
    
    // Touch Event
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.container.alpha = 0
    }
    
    // Show Menu Container Action Button
    
    @IBAction func showContainer(_ sender: UIButton) {
        container.alpha = 1
    }
    
    // Back Action Button
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    // Image Back Action Button
    
    @IBAction func previewimage(_ sender: UIButton) {
        self.container.alpha = 0
        
        let fastForwardCount = 1
        let newIndex = max(currentIndex - fastForwardCount, 0)
        if newIndex < currentIndex {
            currentIndex = newIndex
            let indexPath = IndexPath(item: currentIndex, section: 0)
            collactionview.scrollToItem(at: indexPath, at: .left, animated: true)
            lblcount.text = "\(currentIndex + 1)/\(ImgCount)"
            btnnext.isEnabled = currentIndex < ImgCount - 1
            btnprev.isEnabled = currentIndex > 0
        }
    }
    
    // Image Next Action Button
    
    @IBAction func nextimage(_ sender: UIButton) {
        self.container.alpha = 0
        
        let fastForwardCount = 1
        let newIndex = min(currentIndex + fastForwardCount, ImgCount - 1)
        if newIndex > currentIndex {
            currentIndex = newIndex
            let indexPath = IndexPath(item: currentIndex, section: 0)
            collactionview.scrollToItem(at: indexPath, at: .left, animated: true)
            lblcount.text = "\(currentIndex + 1)/\(ImgCount)"
            btnnext.isEnabled = currentIndex < ImgCount - 1
            btnprev.isEnabled = currentIndex > 0
        }
    }
}

// Collaction View Delegate

extension RecentViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ArrImg.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AlbamCollectionViewCell
        cell.imageView.image = UIImage(named: ArrImg[indexPath.item] )
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.container.alpha = 0
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.container.alpha = 0
    }
}

// Collaction View Delegate FlowLayout

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
