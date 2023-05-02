//
//  GalaryViewController.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 17/04/23.
//

import UIKit

class GalaryViewController: UIViewController {
    
    var ArrImg = [UIImage(imageLiteralResourceName: "image1"),
                  UIImage(imageLiteralResourceName: "image2"),
                  UIImage(imageLiteralResourceName: "image3"),
                  UIImage(imageLiteralResourceName: "image4"),
                  UIImage(imageLiteralResourceName: "image5")]
    var ArrCategory = ["All Image","Recents","Download","Favourite","Camera"]
    
    
    var arrGallery : [GalleryData] = []

    @IBOutlet var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
        
        let obj = GalleryData(strTitile: "All Image", images: ["image1","image2","image3","image4","image5"])
        let obj1 = GalleryData(strTitile: "Recents", images: ["image1","image2","image3","image4","image5"])
        let obj2 = GalleryData(strTitile: "Download", images: ["image1","image2","image3","image4","image5"])
        let obj3 = GalleryData(strTitile: "Favourite", images: ["image1","image2","image3","image4","image5"])
        let obj4 = GalleryData(strTitile: "Camera", images: ["image1","image2","image3","image4","image5"])
        
        self.arrGallery.append(obj)
        self.arrGallery.append(obj1)
        self.arrGallery.append(obj2)
        self.arrGallery.append(obj3)
        self.arrGallery.append(obj4)

    }

}

extension GalaryViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GalaryCollectionViewCell
        
        let obj = self.arrGallery[indexPath.row]
        cell.image.image = UIImage(named: obj.arrImages.randomElement() ?? "image1")
        cell.lblimgname.text = obj.strTitile
        cell.lblimgcount.text =  "\(obj.arrImages.count)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let Navigate = self.storyboard?.instantiateViewController(withIdentifier: "RecentViewController") as! RecentViewController
        Navigate.ArrImg = self.arrGallery[indexPath.row].arrImages
        
        self.present(Navigate, animated: true)
       //self.navigationController?.pushViewController(Navigate, animated: true)
    }
}

extension GalaryViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let size = (collectionView.frame.size.width-10)/2
            return CGSize(width: size, height: size)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 15
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
}
