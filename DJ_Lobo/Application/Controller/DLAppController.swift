//
//  DLAppController.swift
//  DJ_Lobo
//
//  Created by Star on 5/11/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit
import Foundation

class DLAppController: NSObject {
    
    class var sharedInstance: DLAppController {
        struct Static {
            static var instance: DLAppController? = nil
            static var onceToken: dispatch_once_t = 0
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = DLAppController()
            
        }
        return Static.instance!
    }
    
    private override init() {
        print("CCC", terminator: "");
        NSLog("shared Instance")
    }

}
