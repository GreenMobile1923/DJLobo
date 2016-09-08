//
//  DJHomeViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/16/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJHomeViewController: BaseViewController, UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var topScrollView: UIScrollView!
    @IBOutlet weak var topPageControl: UIPageControl!
    @IBOutlet weak var firstTopImageView: UIImageView!
    @IBOutlet weak var secondTopImageView: UIImageView!
    @IBOutlet weak var thirdTopImageView: UIImageView!
    
    @IBOutlet weak var artistCollectionView: UICollectionView!
    @IBOutlet weak var recentMusicCollectionView: UICollectionView!
    @IBOutlet weak var popularStyleCollectionView: UICollectionView!
    @IBOutlet weak var popularStyleContainView: UIView!
    
    var artistArray: NSMutableArray! = NSMutableArray()
    var recentlyMusicArray: NSMutableArray! = NSMutableArray()
    var popularArray: NSMutableArray! = NSMutableArray()
    
    var originalHeigt: CGFloat!
    var mainScrollViewContentHeight: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initUI()
        self.initData()
        self.initView()
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.reloadUI()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //#MARK: - Init
    func initUI(){
        
        // top ScrollView
        firstTopImageView.frame = CGRectMake(0, 0, topScrollView.frame.size.width, topScrollView.frame.size.height)
        secondTopImageView.frame = CGRectMake(topScrollView.frame.size.width, 0, topScrollView.frame.size.width, topScrollView.frame.size.height)
        thirdTopImageView.frame = CGRectMake(topScrollView.frame.size.width * 2, 0, topScrollView.frame.size.width, topScrollView.frame.size.height)
        topScrollView.contentSize = CGSizeMake(topScrollView.frame.size.width * 3, topScrollView.frame.size.height)
        mainScrollView.contentSize = contentView.frame.size
        
        artistCollectionView.contentInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        recentMusicCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        popularStyleCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        originalHeigt = popularStyleCollectionView.frame.size.height
        mainScrollViewContentHeight = 1500
        
    }
    func initData(){
        
    }
    func initView(){        
        
    }
    
    // MARK: - Custom Function
    func reloadUI(){
        
        popularStyleCollectionView.frame = CGRectMake(popularStyleCollectionView.frame.origin.x, popularStyleCollectionView.frame.origin.y, popularStyleCollectionView.frame.size.width, popularStyleCollectionView.contentSize.height)
        print(popularStyleCollectionView.contentSize)
        
        let offsetHeight: CGFloat! = popularStyleCollectionView.frame.size.height - originalHeigt
        mainScrollView.contentSize.height = mainScrollViewContentHeight + offsetHeight
        popularStyleCollectionView.scrollEnabled = false
        
    }
    
    func navToDetailPage(index: Int){
        
        let pageController = self.storyboard?.instantiateViewControllerWithIdentifier("genreDetailPage")
        self.navigationController? .pushViewController(pageController!, animated: true)
    }

    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var cellSize: CGSize!
        if (collectionView == artistCollectionView) {
            
            //let kCellForRow: CGFloat = 2.8
            let kCellForLine: CGFloat = 1
            let kCellForRow: CGFloat = 2.5
            let height: CGFloat = (collectionView.frame.size.height - collectionView.contentInset.top - collectionView.contentInset.bottom)/kCellForLine
            let width: CGFloat = (collectionView.frame.size.width - collectionView.contentInset.left - collectionView.contentInset.right - 10)/kCellForRow
            cellSize = CGSizeMake(width, height)
        }
        if (collectionView == recentMusicCollectionView) {
            let kCellForRow: CGFloat = 2
            let kCellForLine: CGFloat = 2
            let height: CGFloat = (collectionView.frame.size.height - collectionView.contentInset.top - collectionView.contentInset.bottom - 10)/kCellForLine
            let width: CGFloat = (collectionView.frame.size.width - collectionView.contentInset.left - collectionView.contentInset.right - 10)/kCellForRow
            cellSize = CGSizeMake(width, height)
        }
        if (collectionView == popularStyleCollectionView) {
            
            let kCellForRow: CGFloat = 2
            let width: CGFloat = (collectionView.frame.size.width - collectionView.contentInset.left - collectionView.contentInset.right - 10)/kCellForRow
            let height: CGFloat = width
            cellSize = CGSizeMake(width, height)
        }
        
        return cellSize // The size of one cell
    }
    
    // #MARK: - CollectionViewDelegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var num: Int!
        if (collectionView == artistCollectionView) {
            num = 10
        }
        if (collectionView == recentMusicCollectionView) {
            num = 10
        }
        if (collectionView == popularStyleCollectionView) {
            num = 6
        }
        return num
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell: UICollectionViewCell!
        
        if (collectionView == artistCollectionView) {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("artistCollectionViewCell", forIndexPath: indexPath) as! DJArtistCollectionViewCell
        }
        if (collectionView == recentMusicCollectionView) {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("musicCollectionViewCell", forIndexPath: indexPath) as! DJMusicCollectionViewCell
        }
        if (collectionView == popularStyleCollectionView) {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("styleCollectionViewCell", forIndexPath: indexPath) as! DJStyleCollectionViewCell
        }
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: false)
        // Select operation
        if (collectionView == artistCollectionView) {
            
        }
        if (collectionView == recentMusicCollectionView) {
            
            self.viewPlayer()
        }
        if (collectionView == popularStyleCollectionView) {
            self.navToDetailPage(indexPath.item)
        }
        
    }
    
    // MARK: - ScrollView Delegate
    func scrollViewDidScroll(scrollView: UIScrollView){
        
        if (scrollView == topScrollView) {
            let posX = Int(scrollView.contentOffset.x) / Int(scrollView.frame.size.width)
            topPageControl.currentPage = posX
        }
    }

}
