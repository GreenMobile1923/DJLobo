//
//  DJPlayerViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/16/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJPlayerViewController: BaseViewController, SBPageFlowViewDataSource, SBPageFlowViewDelegate {
    
    

    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var volumeStartValue: UILabel!
    @IBOutlet weak var volumeEndValue: UILabel!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var comentNumLabel: UILabel!
    @IBOutlet weak var playerPlayPauseIcon: UIImageView!
    @IBOutlet weak var repeatIcon: UIImageView!
    @IBOutlet weak var shuffleIcon: UIImageView!
    @IBOutlet weak var imageContainView: UIView!
    
    var musicImageArray: NSMutableArray! = NSMutableArray()
    var currentImagePage: Int!
    
    var flowView: SBPageFlowView = SBPageFlowView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initUI()
        self.initData()
        self.initView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
    
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // #MARK: - Init
    func initUI(){
        
        self.appManager.setRoundRectView(comentNumLabel, cornerRadius: comentNumLabel.frame.size.height / 2)
        
    }
    func initData(){
        
        musicImageArray = NSMutableArray(objects: "image_home_recently_photo", "image_home_recently_photo", "image_home_recently_photo","image_home_recently_photo", "image_home_recently_photo", "image_home_recently_photo")
        currentImagePage = 0
        flowView = SBPageFlowView.init(frame: CGRectMake(0, 0, imageContainView.bounds.size.width, imageContainView.bounds.size.height))
        flowView.delegate = self
        flowView.dataSource = self
        flowView.minimumPageAlpha = 0.6
        flowView.minimumPageScale = 0.8
        flowView.defaultImageView = UIImageView.init(image: musicImageArray[0] as? UIImage)
        imageContainView.addSubview(flowView)
        
        flowView.reloadData()
        
        
    }
    func initView(){
        
    }
    
    // #MARK: - Action Functions
    @IBAction func onClickShareBtn(sender: UIButton) {
    }
    @IBAction func onClickOptionBtn(sender: UIButton) {
        
        let pageController = self.storyboard?.instantiateViewControllerWithIdentifier("playerOptionPage")
        self.navigationController?.presentViewController(pageController!, animated: true, completion: nil)
    }
    @IBAction func onClickCommentBtn(sender: UIButton) {
        
        let pageController = self.storyboard?.instantiateViewControllerWithIdentifier("playerCommentPage")
        self.navigationController?.presentViewController(pageController!, animated: true, completion: nil)

        
    }
    @IBAction func onPlayPauseBtn(sender: UIButton) {
    }
    @IBAction func onPrevSong(sender: UIButton) {
    }
    @IBAction func onRepeatSong(sender: UIButton) {
    }
    @IBAction func onShuffleSong(sender: UIButton) {
    }
    @IBAction func onNextSong(sender: UIButton) {
    }
    @IBAction func onVolumeChanged(sender: UISlider) {
    }
    
    @IBAction func onPartyModeBtn(sender: UIButton) {
        
        let pageController = self.storyboard?.instantiateViewControllerWithIdentifier("playerPartyPage")
        self.navigationController?.presentViewController(pageController!, animated: true, completion: nil)

    }

    
    // #MARK: - SBPageFlowView DataSource Delegate
    func numberOfPagesInFlowView(flowView: SBPageFlowView!) -> Int {
        return musicImageArray.count
    }
    func sizeForPageInFlowView(flowView: SBPageFlowView!) -> CGSize {
        return CGSizeMake(imageContainView.frame.size.height, imageContainView.frame.size.height)
    }
    
    func flowView(flowView: SBPageFlowView!, cellForPageAtIndex index: Int) -> UIView! {
        
        var imageView: UIImageView! = flowView.dequeueReusableCell() as? UIImageView
        if (imageView == nil){
            imageView = UIImageView()
            imageView.layer.masksToBounds = true
        }
        imageView.image = UIImage(named: musicImageArray[index] as! String)
        return imageView
    }
    // #MARK: - SBPageFlowView Delegate
    func didScrollToPage(pageNumber: Int, inFlowView flowView: SBPageFlowView!) {
        print(pageNumber)
        currentImagePage = pageNumber
    }
    func didReloadData(cell: UIView!, cellForPageAtIndex index: Int) {
        let imageView: UIImageView! = cell as! UIImageView
        imageView.image = UIImage(named: musicImageArray[index] as! String)
    }
    func didSelectItemAtIndex(index: Int, inFlowView flowView: SBPageFlowView!) {
        print(index)
    }
    
}
