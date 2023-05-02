//
//  WorkOut.swift
//  Signup & SignIn
//
//  Created by Mac Mini on 27/04/23.
//

import UIKit

class WorkOut: NSObject {
    var arrColors:UIColor!
    var WorkType:String!
    var Switch : Bool
    var Slider: Int!
    
    init(arrColors:UIColor!,WorkType:String!,Switch: Bool,Slider:Int!) {
        self.arrColors = arrColors
        self.WorkType = WorkType
        self.Switch = Switch
        self.Slider = Slider
    }

}
