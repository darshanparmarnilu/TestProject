//
//  contactTableViewCell.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 13/04/23.
//

import UIKit

class contactTableViewCell: UITableViewCell {
    
    @IBOutlet var stack: UIStackView!
    
    
    
    @IBOutlet var calldetial: UIButton!
    @IBOutlet var videocall: UIButton!
    @IBOutlet var audiocall: UIButton!
    @IBOutlet var btnshow: UIButton!
    @IBOutlet var lblnumber: UILabel!
    @IBOutlet var lblname: UILabel!
    @IBOutlet var lbltime: UILabel!
    @IBOutlet var contactimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        btnshow.isSelected = false
       // btnshow.setImage(UIImage(named: "show"), for: .normal)
        stack.isHidden = false
        
        contactimage.layer.masksToBounds = true
        contactimage.layer.cornerRadius = 28
 
    }

//    @IBAction func stackshow(_ sender: UIButton) {
//
//        if btnshow.isSelected == false{
//           // btnshow.setImage(UIImage(named: "hide"), for: .selected)
//          //  btnshow.isSelected = true
//           // stack.isHidden = false
//
//        }else{
//          //  btnshow.setImage(UIImage(named: "show"), for: .normal)
//           // btnshow.isSelected = false
//           // stack.isHidden = true
//        }
//
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
