//
//  homeCollectionViewCell.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 28/03/23.
//

import UIKit
import Toast_Swift
class homeCollectionViewCell: UICollectionViewCell {
    @IBOutlet var image: UIImageView!
    override func layoutSubviews() {
           super.layoutSubviews()
           image.frame = contentView.bounds
       }
}
