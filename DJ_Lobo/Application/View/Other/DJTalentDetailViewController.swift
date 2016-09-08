//
//  DJTalentDetailViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/16/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJTalentDetailViewController: BaseViewController, UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var talentImageView: UIImageView!
    @IBOutlet weak var talentDescription: UILabel!
    @IBOutlet weak var talentTitle: UILabel!
    @IBOutlet weak var talentLikeNumBnt: UIButton!
    @IBOutlet weak var talentPlayNumBtn: UIButton!
    @IBOutlet weak var talentViewNumBtn: UIButton!

    @IBOutlet weak var musicCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initUI()
        self.initData()
        self.initView()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //#MARK: - Init
    func initUI(){
        
        mainScrollView.contentSize = contentView.frame.size
        musicCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    }
    func initData(){
        
    }
    func initView(){
        
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var cellSize: CGSize!
        
        let kCellForRow: CGFloat = 2
        let kCellForLine: CGFloat = 2
        let height: CGFloat = (collectionView.frame.size.height - collectionView.contentInset.top - collectionView.contentInset.bottom - 10)/kCellForLine
        let width: CGFloat = (collectionView.frame.size.width - collectionView.contentInset.left - collectionView.contentInset.right - 10)/kCellForRow
        cellSize = CGSizeMake(width, height)
        
        return cellSize // The size of one cell
    }
    
    // #MARK: - CollectionViewDelegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var num: Int!
        num = 10

        return num
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell: UICollectionViewCell!
        cell = collectionView.dequeueReusableCellWithReuseIdentifier("talentDetailMusicCollectionViewCell", forIndexPath: indexPath) as! DJMusicCollectionViewCell
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: false)
        
        self.viewPlayer()
        
    }

    
}
