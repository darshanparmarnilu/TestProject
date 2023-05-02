//
//  HometableViewCell.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 28/03/23.
//

import UIKit
import Toast_Swift

class HometableViewCell: UITableViewCell {


    @IBOutlet var collactionview: UICollectionView!
    @IBOutlet var lblLocation: UILabel!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var userImg: UIImageView!
    @IBOutlet var btnsave: UIButton!
    @IBOutlet var btnlike: UIButton!
 


    @IBOutlet var page: UIPageControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImg.layer.masksToBounds = true
        userImg.layer.cornerRadius = userImg.frame.height/2

        page.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);

        page?.hidesForSinglePage = true

        page?.currentPage = 0
        
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
//    @IBAction func likeButton(_ sender: UIButton) {
//        btnlike.isSelected = !btnlike.isSelected
//    }
//    
//    @IBAction func saveButton(_ sender: UIButton) {
//        btnsave.isSelected = !btnsave.isSelected
//
//    }
}
