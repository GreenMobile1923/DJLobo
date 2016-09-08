//
//  DJGenreViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/16/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJGenreViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var genreCollectionView: UICollectionView!
    
    
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
        genreCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
       
    }
    func initData(){
        
    }
    func initView(){
        
    }

    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var cellSize: CGSize!
            
            let kCellForRow: CGFloat = 2
            let width: CGFloat = (collectionView.frame.size.width - collectionView.contentInset.left - collectionView.contentInset.right - 10)/kCellForRow
            let height: CGFloat = width
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
        cell = collectionView.dequeueReusableCellWithReuseIdentifier("genreCollectionViewCell", forIndexPath: indexPath) as! DJStyleCollectionViewCell
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        
        self.navToDetailPage(indexPath.item)
        // Select operation
    }
    
    func navToDetailPage(index: Int){
        
        let pageController = self.storyboard?.instantiateViewControllerWithIdentifier("genreDetailPage")
        self.navigationController? .pushViewController(pageController!, animated: true)
    }



}
