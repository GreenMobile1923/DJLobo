//
//  BaseViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/11/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var isLodingBase:Bool!
    var audioManager: DLAudioManager! = DLAudioManager.sharedInstance
    var dataManager: DLDataManager! = DLDataManager.sharedInstance
    var appManager: DLAppManager! = DLAppManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLodingBase = false
        
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
        if (self.isLodingBase == true) {
            return
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    // #MARK: - Audio function
    func viewPlayer() {
        
        if (self.isLodingBase == true) {
            return
        }

        let playerPage  = self.storyboard?.instantiateViewControllerWithIdentifier("playerNav")
        self.navigationController?.presentViewController(playerPage!, animated: true, completion: nil)
    }
    
    @IBAction func dismissPlayerPage(sender: UIButton) {
        if (self.isLodingBase == true) {
            return
        }

        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
