//
//  DLMainLogInViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/11/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DLMainLogInViewController: UserBaseViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var introFirstView: UIView!
    @IBOutlet weak var introSecondView: UIView!
    @IBOutlet weak var introThirdView: UIView!
    @IBOutlet weak var getStartedBtn: UIButton!
    @IBOutlet weak var logInBtn: UIButton!
    
    var timer: NSTimer!
    var pageNumber: Float!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initUI()
        self.initData()
        self.initView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.initUI()
//        self.initData()
//        self.startTimer()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.stopTimer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //   init
    func initUI(){
        
        introFirstView.frame = CGRectMake(0, 0, mainScrollView.frame.size.width, mainScrollView.frame.size.height)
        introSecondView.frame = CGRectMake(mainScrollView.frame.size.width, 0, mainScrollView.frame.size.width, mainScrollView.frame.size.height)
        introThirdView.frame = CGRectMake(mainScrollView.frame.size.width * 2, 0, mainScrollView.frame.size.width, mainScrollView.frame.size.height)
        mainScrollView.contentSize = CGSizeMake(mainScrollView.frame.size.width * 3, mainScrollView.frame.size.height)
        mainScrollView.contentOffset = CGPointMake(0, 0)
        mainScrollView.pagingEnabled = true
        
        getStartedBtn.hidden = true
        logInBtn.hidden = true
    
    }
    func initData(){
        
        pageNumber = 0
        pageControl.currentPage = Int(pageNumber)
    }
    func initView(){
        
    }
    
    func startTimer() {
        
        if (timer == nil) {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector:#selector(DLMainLogInViewController.backgroundImageTransition), userInfo: nil, repeats: true)
        }
        
    }
    func stopTimer() {
        
        if (timer != nil) {
            timer.invalidate()
            timer = nil
        }
        
    }
    func backgroundImageTransition() {
        
        mainScrollView.setContentOffset(CGPointMake(CGFloat(pageNumber * Float(mainScrollView.frame.size.width)), 0), animated: true)
        pageNumber = pageNumber + 1;
        if pageNumber == 3 {
            pageNumber = 0
        }
        
    }
    // ScrollView Delegate
    func scrollViewDidScroll(scrollView: UIScrollView){
        let posX = Int(mainScrollView.contentOffset.x) / Int(mainScrollView.frame.size.width)
        pageControl.currentPage = posX
        if posX == 2 {
            getStartedBtn.hidden = false
            logInBtn.hidden = false
        }else{
            getStartedBtn.hidden = true
            logInBtn.hidden = true
        }
        
    }

}
