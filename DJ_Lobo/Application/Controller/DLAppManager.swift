//
//  DLAppManager.swift
//  DJLobo
//
//  Created by Eddie Espinal on 9/27/15.
//  Copyright © 2015 EspinalLab, LLC. All rights reserved.
//

import UIKit

class DLAppManager: NSObject {

    class var sharedInstance: DLAppManager {
        struct Static {
            static let instance: DLAppManager = DLAppManager()
        }
        return Static.instance
    }
    
    // Common Utils Functions
    func showAlert (title: String, message: String) ->UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Ok", style: .Default) { (action) -> Void in
        }
        alertController.addAction(okAction)
        return alertController
    }
    func getUserDefault (key: String) -> AnyObject{
        var val: AnyObject! = NSUserDefaults.standardUserDefaults().objectForKey(key)
        if (val.isKindOfClass(NSString) && (val == nil || val.isEqualToString("0"))){
            val = nil
        }
        return val
    }
    func setUserDefault (key: String, val: AnyObject){
        
        var value: AnyObject! = val
        if (val.isKindOfClass(NSString) && val.isEqualToString("")) {
            value = "0"
        }
        NSUserDefaults.standardUserDefaults().setObject(value, forKey: key)
    }
    func removeUserDefault (key: String){
        NSUserDefaults.standardUserDefaults().removeObjectForKey(key)
    }
    func setUserDefaultDic(key: String, dic: NSMutableDictionary){
        var newKey: String = ""
        for dicKey in dic.allKeys {
            newKey = key.stringByAppendingString("_").stringByAppendingString(dicKey as! String)
            self.setUserDefault(newKey, val: dic.objectForKey(dicKey)!)
        }
    }
    func getUserDefaultDic(key:String) -> NSMutableDictionary {
        
        let dic: NSMutableDictionary! = NSMutableDictionary()
        let dicAll = NSUserDefaults.standardUserDefaults().dictionaryRepresentation()
        
        for dicKey:NSString in dicAll.keys {
            if (dicKey.rangeOfString(key.stringByAppendingString("_")).location != NSNotFound) {
                dic.setObject(NSUserDefaults.standardUserDefaults().objectForKey(dicKey as String)!, forKey: key.stringByAppendingString("_").stringByAppendingString(dicKey as String))
            }
        }
        
        return dic
    }
    func setUserDefaultMutableArray(key: String, array: NSMutableArray){
        
        let dataSave: NSData = NSKeyedArchiver.archivedDataWithRootObject(array)
        NSUserDefaults.standardUserDefaults().setObject(dataSave, forKey: key)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    func getUserDefaultMutableArray(key: String) -> NSMutableArray {
        
        let data: NSData! = NSUserDefaults.standardUserDefaults().objectForKey(key) as! NSData
        let savedArray: NSMutableArray! = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! NSMutableArray
        return savedArray
    }
    func removeUserDefaultNutableArray(key: String) {
        NSUserDefaults.standardUserDefaults().removeObjectForKey(key)
    }
    
    func cropCircleImage (imageView: UIImageView){
        var maxScaleLength: CGFloat!
        maxScaleLength = imageView.frame.size.width
        if (imageView.frame.size.height > maxScaleLength) {
            maxScaleLength = imageView.frame.size.height
        }
        imageView.frame.size = CGSizeMake(maxScaleLength, maxScaleLength)
        imageView.layer.cornerRadius = maxScaleLength/2
        imageView.clipsToBounds = true
    }
    func setRoundRectBorderButton(button: UIButton, borderWidth: CGFloat, borderColor: UIColor, borderRadius: CGFloat){
        
        button.clipsToBounds = true
        button.layer.cornerRadius = borderRadius
        button.layer.borderColor = borderColor.CGColor
        button.layer.borderWidth = borderWidth
    }
    func setRoundRectView(view: UIView, cornerRadius: CGFloat){
        
        view.clipsToBounds = true
        view.layer.cornerRadius = cornerRadius
        view.layer.masksToBounds = true
    }
    
}
