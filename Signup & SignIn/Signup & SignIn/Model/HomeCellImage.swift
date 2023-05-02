//
//  HomeCellImage.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 26/04/23.
//

import UIKit

class HomeCellImage: NSObject {
    var arrImages : [String] = []
    var strUserName : String!
    var strLocation : String!
    var strUserImg : String!
    var strLike:Bool!
    var strBookmark:Bool!
    var currentPageNo:Int!
    
    init(arrImages: [String],strUserName : String!,strLocation : String!, strUserImg : String!,strLike:Bool!,strBookmark:Bool!,currentPageNo:Int!) {
        self.arrImages = arrImages
        self.strUserName = strUserName
        self.strLocation = strLocation
        self.strUserImg = strUserImg
        self.strLike = strLike
        self.strBookmark = strBookmark
        self.currentPageNo = currentPageNo
    }
    
}
