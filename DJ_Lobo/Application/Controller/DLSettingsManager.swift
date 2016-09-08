//
//  DLSettingsManager.swift
//  DJLobo
//
//  Created by Eddie Espinal on 9/27/15.
//  Copyright © 2015 EspinalLab, LLC. All rights reserved.
//

import UIKit

class DLSettingsManager: NSObject {

    class var sharedInstance: DLSettingsManager {
        struct Static {
            static let instance: DLSettingsManager = DLSettingsManager()
        }
        return Static.instance
    }
}
