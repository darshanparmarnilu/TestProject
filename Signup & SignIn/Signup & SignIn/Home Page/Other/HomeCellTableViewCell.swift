//
//  HomeCellTableViewCell.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 24/03/23.
//

import UIKit
import Toast_Swift

class HomeCellTableViewCell: UITableViewCell {

    @IBOutlet var subview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.subview.backgroundColor = UIColor(red: 232/256, green: 232/256, blue: 232/256, alpha: 1)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
