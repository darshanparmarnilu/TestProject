//
//  ContactData.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 14/04/23.
//

import UIKit

class ContactData: NSObject {

    var strName : String!
    var strNumber : String!
    var strImage : String!
    
    init(strName: String!, strNumber: String!, strImage: String!) {
        self.strName = strName
        self.strNumber = strNumber
        self.strImage = strImage
    }
}
