//
//  DJSearchArtistDetailViewController.swift
//  DJ_Lobo
//
//  Created by Star on 6/6/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJSearchArtistDetailViewController: BaseViewController {
    
    
    @IBOutlet weak var topMainView: UIView!
    @IBOutlet weak var postedTrackTableView: UITableView!
    @IBOutlet weak var postedPlayListView: UIView!
    @IBOutlet weak var playListCollectionView: UICollectionView!
    @IBOutlet weak var likeTableView: UITableView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var topMainImageView: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var artistFollowersLabel: UILabel!
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var artistDetailTextView: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.initUI()
        self.initView()
        self.initData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initUI(){
        
        appManager.setRoundRectBorderButton(followBtn, borderWidth: 1.0, borderColor: UIColor.redColor(), borderRadius: followBtn.frame.size.height/2)
    }
    func initView(){
        
    }
    func initData(){
        
    }
}
