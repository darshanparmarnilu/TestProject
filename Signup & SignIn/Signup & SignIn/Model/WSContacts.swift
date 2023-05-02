//
//  WSContacts.swift
//  Signup & SignIn
//
//  Created by MacBookAir_4 on 02/05/23.
//

import UIKit

class WSContacts: NSObject {

    var userImage : String!
    var userName: String!
    var userNumber:String!
    var ShowStack:Bool!
    var lblTime:String!
    
    init(userImage: String!, userName: String!, userNumber: String!, ShowStack: Bool!, lblTime: String!) {
        self.userImage = userImage
        self.userName = userName
        self.userNumber = userNumber
        self.ShowStack = ShowStack
        self.lblTime = lblTime
    }
    
}
