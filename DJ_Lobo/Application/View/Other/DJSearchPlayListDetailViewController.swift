//
//  DJSearchPlayListDetailViewController.swift
//  DJ_Lobo
//
//  Created by Star on 6/6/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJSearchPlayListDetailViewController: BaseViewController {

    @IBOutlet weak var topBgImageView: UIImageView!
    @IBOutlet weak var topMainImageView: UIImageView!
    
    @IBOutlet weak var playListNameLabel: UILabel!
    @IBOutlet weak var playingNumBtn: UIButton!
    @IBOutlet weak var likeNumBtn: UIButton!
    @IBOutlet weak var viewNumBtn: UIButton!
    
    @IBOutlet weak var includeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
