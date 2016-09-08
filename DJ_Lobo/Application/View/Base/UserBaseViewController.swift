//
//  UserBaseViewController.swift
//  DJLobo
//
//  Created by Star on 5/11/16.
//  Copyright © 2016 EspinalLab, LLC. All rights reserved.
//

import UIKit

class UserBaseViewController: UIViewController {
    
    var isLodingUserBase: Bool!
    var dataManager = DLDataManager.sharedInstance
    var appManager = DLAppManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLodingUserBase = false
        
        dataManager.currentUser.setObject("sadf", forKey: "key")
        print(dataManager.currentUser.objectForKey("key"))
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }   

    // Change Status Bar Style
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func navToBack(sender: UIButton) {
        if (self.isLodingUserBase == true) {
            return
        }
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    func navToMainView() {
        
        if (self.isLodingUserBase == true) {
            return
        }
        
        dispatch_async(dispatch_get_main_queue()) {
        
            let navController = self.storyboard?.instantiateViewControllerWithIdentifier("mainNav")
            self.navigationController?.presentViewController(navController!, animated: true, completion: nil)
        }
        
    }


}
