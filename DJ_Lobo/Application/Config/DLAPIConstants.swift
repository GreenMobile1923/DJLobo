//
//  DLAPIConstants.swift
//  DJLobo
//
//  Created by Eddie Espinal on 9/26/15.
//  Copyright © 2015 EspinalLab, LLC. All rights reserved.
//

import Foundation

class DLAPIConstants {
    
    // DLAPIConstants.value(forKey: "APIClientSecret")
    class func value(forKey key: String) -> String? {
        let constantsPath = NSBundle.mainBundle().pathForResource("DLAPIConstants", ofType: "plist")!
        let constantsDictionary: NSDictionary = NSDictionary(contentsOfFile: constantsPath)!
        
        return constantsDictionary.objectForKey(key) as? String
    }
    
    // DLAPIConstants.value(forKey: "APIPaths", key2: "categoriesPath")
    class func value(forKey key1: String, key2: String) -> String? {
        let constantsPath = NSBundle.mainBundle().pathForResource("DLAPIConstants", ofType: "plist")!
        let constantsDictionary: NSDictionary = NSDictionary(contentsOfFile: constantsPath)!
        if let constantsValueDict = constantsDictionary.objectForKey(key1) as? NSDictionary
        {
            return constantsValueDict.objectForKey(key2) as? String
        }        
        return nil
    }
}
