//
//  GalleryData.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 18/04/23.
//

import UIKit

class GalleryData: NSObject {

    var strTitile : String!
    var arrImages : [String] = []
    
    init(strTitile: String!,images : [String]) {
        self.strTitile = strTitile
        self.arrImages = images
    }
}
