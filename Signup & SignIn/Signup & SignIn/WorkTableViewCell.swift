//
//  WorkTableViewCell.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 12/04/23.
//

import UIKit

class WorkTableViewCell: UITableViewCell {
    
    var SliderMaxvalue = 100
    
    var checkStar:Bool! = false
    
    @IBOutlet var stackrating: UIStackView!
   
    
    @IBOutlet weak var ratingBtn3: UIButton!
    @IBOutlet weak var ratingBtn2: UIButton!
    @IBOutlet weak var ratingBtn1: UIButton!
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
    override func awakeFromNib() {
        super.awakeFromNib()

        self.isUserInteractionEnabled = true
        presentView.isUserInteractionEnabled = true
        
        self.subview.layer.masksToBounds = true
        self.subview.layer.cornerRadius = 20
        
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 25
        
        let thumbImage = UIImage(named: "Ellipse 4")?.resizeImage(to: CGSize(width: 20, height: 20))

        // Set the thumb image of the slider
        slider.setThumbImage(thumbImage, for: .normal)
        
        backView.layer.masksToBounds = true
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOffset = CGSize(width: 0, height: 1)
        backView.layer.shadowOpacity = 0.8
        backView.layer.shadowRadius = 7
        backView.layer.masksToBounds = false
        
        presentView.layer.masksToBounds = true
        presentView.layer.cornerRadius = 20
        
        
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 1)
//        layer.shadowOpacity = 0.5
//        layer.shadowRadius = 5
//
//        layer.masksToBounds = false
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    @IBAction func btnswitch(_ sender: UISwitch) {
//        if `switch`.isOn{
//            slider.isEnabled = true
//            ratingview.isUserInteractionEnabled = true
//
//        }else{
//            slider.isEnabled = false
//            ratingview.isUserInteractionEnabled = false
//        }
    }
    
//    @IBAction func actslider(_ sender: UISlider) {
//        var newBackgroundColor : UIColor
//        let sliderValue = slider.value
//        newBackgroundColor = UIColor(hue: CGFloat(sliderValue), saturation: 0.5, brightness: 0.5, alpha: 0.5)
//        
//        
//        let value = Int(sender.value)
//                lbl0.text = "\(value)"
//                progressbar.progress = sender.value / sender.maximumValue
//
//                ratio.text = "\(value) /\(SliderMaxvalue)"
//                
//                subview.backgroundColor = subview.backgroundColor?.withAlphaComponent(CGFloat(value))
//    }

}
extension UIImage{
    func resizeImage(to newSize: CGSize) -> UIImage? {
            UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
            self.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return resizedImage
        }
}
