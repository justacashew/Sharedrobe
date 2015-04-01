//
//  GlobalVars.swift
//  Sharedrobe
//
//  Created by Dhawal Chandra on 2/28/15.
//  Copyright (c) 2015 Senior Design. All rights reserved.
//

import Foundation
import Realm

struct MyVars{
    static var realm = RLMRealm.defaultRealm()
    static var username:String?
    static var clothpic:NSData?
}