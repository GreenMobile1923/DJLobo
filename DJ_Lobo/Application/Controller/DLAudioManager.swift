//
//  DLAudioManager.swift
//  DJLobo
//
//  Created by Eddie Espinal on 9/27/15.
//  Copyright © 2015 EspinalLab, LLC. All rights reserved.
//

import UIKit

class DLAudioManager: NSObject {

    class var sharedInstance: DLAudioManager {
        struct Static {
            static let instance: DLAudioManager = DLAudioManager()
        }
        return Static.instance
    }
}
