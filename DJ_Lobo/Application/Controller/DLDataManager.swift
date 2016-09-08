//
//  DLDataManager.swift
//  DJLobo
//
//  Created by Eddie Espinal on 9/26/15.
//  Copyright © 2015 EspinalLab, LLC. All rights reserved.
//

import UIKit

class DLDataManager: NSObject {

    var currentUser: NSMutableDictionary!
    
    class var sharedInstance: DLDataManager {
        struct Static {
            static let instance: DLDataManager = DLDataManager()
        }
        
        return Static.instance
    }
    
    override init() {
        super.init()
        
        currentUser = NSMutableDictionary()
        
        print("current user's info")
    }
}
