//
//  DJTalentViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/16/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJTalentViewController: BaseViewController, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var topTalentImageView: UIImageView!
    @IBOutlet weak var topTalentName: UILabel!
    @IBOutlet weak var topTalentLikeNumBtn: UIButton!
    @IBOutlet weak var topTalentPlayNumBtn: UIButton!
    @IBOutlet weak var talentCollectionView: UICollectionView!
    
    var mainScrollViewContentSizeHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initUI()
        self.initData()
        self.initView()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        talentCollectionView.frame = CGRectMake(talentCollectionView.frame.origin.x, talentCollectionView.frame.origin.y, talentCollectionView.frame.size.width, talentCollectionView.contentSize.height)
        //mainScrollView.contentSize.height = talentCollectionView.contentSize.height
        talentCollectionView.scrollEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //#MARK: - Init
    func initUI(){

        mainScrollView.contentSize = contentView.frame.size
        mainScrollViewContentSizeHeight = mainScrollView.contentSize.height
        talentCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
       
    }
    func initData(){
        
    }
    func initView(){
        
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var cellSize: CGSize!
        
        let kCellForRow: CGFloat = 2
        let kCellForLine: CGFloat = 2.8
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
        cell = collectionView.dequeueReusableCellWithReuseIdentifier("talentCollectionViewCell", forIndexPath: indexPath) as! DJArtistCollectionViewCell
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: false)
        
        self.navToDetailPage(indexPath.item)
        // Select operation
    }

    @IBAction func goToDetailPage(sender: UIButton) {
        
        self.navToDetailPage(sender.tag)
    }
    
    func navToDetailPage(index: Int){
        let pageController = self.storyboard?.instantiateViewControllerWithIdentifier("talentDetailPage")
        self.navigationController? .pushViewController(pageController!, animated: true)
    }

}
