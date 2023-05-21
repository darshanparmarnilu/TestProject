//
//  WorkTableViewCell.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 12/04/23.
//

import UIKit
import Cosmos

class WorkTableViewCell: UITableViewCell {
    
    var SliderMaxvalue = 100
    
    var checkStar:Bool! = false
    
    // IB-Outlets
    
    @IBOutlet weak var RatingStar: CosmosView!
    @IBOutlet weak var presentView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet var lbl100: UILabel!
    @IBOutlet var lbl0: UILabel!
    @IBOutlet var progressbar: UIProgressView!
    @IBOutlet var subview: UIView!
    @IBOutlet var btnSwitch: UISwitch!
    @IBOutlet var ratio: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var lblwork: UILabel!
    
    // Function
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.isUserInteractionEnabled = true
        presentView.isUserInteractionEnabled = true
        
        self.subview.layer.masksToBounds = true
        self.subview.layer.cornerRadius = 20
        
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 25
        
        let thumbImage = UIImage(named: "Ellipse 4")?.resizeImage(to: CGSize(width: 17, height: 17))
        slider.setThumbImage(thumbImage, for: .normal)
        slider.setThumbImage(thumbImage, for: .highlighted)
        
        backView.layer.masksToBounds = true
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOffset = CGSize(width: 0, height: 1)
        backView.layer.shadowOpacity = 0.8
        backView.layer.shadowRadius = 7
        backView.layer.masksToBounds = false
        
        presentView.layer.masksToBounds = true
        presentView.layer.cornerRadius = 20
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// Extention UIImage Resize Image

extension UIImage{
    func resizeImage(to newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
