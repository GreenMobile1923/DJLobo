//
//  DLAdManager.swift
//  DJLobo
//
//  Created by Eddie Espinal on 9/27/15.
//  Copyright © 2015 EspinalLab, LLC. All rights reserved.
//

import UIKit

class DLAdManager: NSObject {

    class var sharedInstance: DLAdManager {
        struct Static {
            static let instance: DLAdManager = DLAdManager()
        }
        return Static.instance
    }
}
