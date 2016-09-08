//
//  DJGenreDetailViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/16/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJGenreDetailViewController: BaseViewController, UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var topSubGenreImageView: UIImageView!
    @IBOutlet weak var trendingCollectionView: UICollectionView!
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
        
        // top ScrollView
        mainScrollView.contentSize = contentView.frame.size
        trendingCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        musicCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    func initData(){
        
    }
    func initView(){
        
    }
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var cellSize: CGSize!
        if (collectionView == trendingCollectionView) {
            let kCellForRow: CGFloat = 2
            let kCellForLine: CGFloat = 2
            let height: CGFloat = (collectionView.frame.size.height - collectionView.contentInset.top - collectionView.contentInset.bottom - 10)/kCellForLine
            let width: CGFloat = (collectionView.frame.size.width - collectionView.contentInset.left - collectionView.contentInset.right - 10)/kCellForRow
            cellSize = CGSizeMake(width, height)
        }
        if (collectionView == musicCollectionView) {
            
            let kCellForRow: CGFloat = 2
            let width: CGFloat = (collectionView.frame.size.width - collectionView.contentInset.left - collectionView.contentInset.right - 10)/kCellForRow
            let height = width + 40
            cellSize = CGSizeMake(width, height)
        }
        
       
        
        return cellSize // The size of one cell
    }
    
    // #MARK: - CollectionViewDelegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var num: Int!
        if (collectionView == trendingCollectionView) {
            num = 10
        }
        if (collectionView == musicCollectionView) {
            num = 10
        }
        return num
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell: UICollectionViewCell!
        
        if (collectionView == trendingCollectionView) {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("trendingCollectionViewCell", forIndexPath: indexPath) as! DJMusicCollectionViewCell
        }
        if (collectionView == musicCollectionView) {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("musicGenreCollectionViewCell", forIndexPath: indexPath) as! DJMusicCollectionViewCell
        }
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: false)
        
        self.viewPlayer()
        // Select operation
    }

  

}
