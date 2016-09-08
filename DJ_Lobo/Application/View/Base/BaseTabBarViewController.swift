//
//  BaseTabBarViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/11/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit


class BaseTabBarViewController: UITabBarController {


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initUI()
        
    }
    // Change Status Bar Style
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func initUI() -> Void {
        
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        UITabBar.appearance().barTintColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
