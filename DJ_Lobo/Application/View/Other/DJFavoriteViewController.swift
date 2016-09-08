//
//  DJFavoriteViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/16/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJFavoriteViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableContainView: UIView!
    @IBOutlet weak var favoritTableView: UITableView!
    
    var favoriteArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initUI()
        self.initData()
        self.initView()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.reloadPage()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //#MARK: - Init
    func initUI(){
        
    }
    func initData(){
        favoriteArray = NSMutableArray.init(capacity: 0)
    }
    func initView(){
        
    }
    
    //MARK: - Custom Func
    func reloadPage(){
//        if (favoriteArray.count == 0) {
//            emptyView.hidden = false
//            tableContainView.hidden = true
//        }else{
//            emptyView.hidden = true
//            tableContainView.hidden = false
//            favoritTableView.reloadData()
//        }
    }
    
    //#MARK: - TableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var num: Int!
        num = favoriteArray.count
        
        num = 10 // Testing value
        return num
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.favoritTableView.dequeueReusableCellWithIdentifier("favoriteTableViewCell") as! DJSearchTableViewCell
        //cell.locationLabel?.text = dataSourceArray [indexPath.row]
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
    }
    

}
