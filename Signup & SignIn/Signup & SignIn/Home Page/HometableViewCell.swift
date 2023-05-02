//
//  HometableViewCell.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 28/03/23.
//

import UIKit
import Toast_Swift

class HometableViewCell: UITableViewCell {


    @IBOutlet var collection: UICollectionView!
    var arrImage = [UIImage(imageLiteralResourceName: "image1"),
              UIImage(imageLiteralResourceName: "image3"),
              UIImage(imageLiteralResourceName: "image6"),
              UIImage(imageLiteralResourceName: "image4"),
              UIImage(imageLiteralResourceName: "image5"),
              UIImage(imageLiteralResourceName: "image2")]
    @IBOutlet var page: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        page.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);
        collection.dataSource = self
        collection.delegate = self
        page?.hidesForSinglePage = true
        page?.numberOfPages = arrImage.count
        page?.currentPage = 0
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
extension HometableViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! homeCollectionViewCell
        cell.image.image = arrImage[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.page?.currentPage = indexPath.item
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
          let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
          let index = scrollView.contentOffset.x / witdh
          let roundedIndex = round(index)
          self.page.currentPage = Int(roundedIndex)
      }
      func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

          page.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
      }

      func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {

          page.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
      }
    
}
