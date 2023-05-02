//
//  selectcontactTableViewCell.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 13/04/23.
//

import UIKit

class selectcontactTableViewCell: UITableViewCell {

    @IBOutlet var lblnumber: UILabel!
    @IBOutlet var lblname: UILabel!
    @IBOutlet var contactimage: UIImageView!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        contactimage.layer.masksToBounds = true
        contactimage.layer.cornerRadius = contactimage.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
