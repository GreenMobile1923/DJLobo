//
//  DJHistoryViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/16/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJHistoryViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableViewContainView: UIView!
    @IBOutlet weak var historyTableView: UITableView!
    
    var historyArray: NSMutableArray!

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
        historyArray = NSMutableArray.init(capacity: 0)
    }
    func initView(){
        
    }
    
    //MARK: - Custom Func
    func reloadPage(){
//        if (historyArray.count == 0) {
//            emptyView.hidden = false
//            tableViewContainView.hidden = true
//        }else{
//            emptyView.hidden = true
//            tableViewContainView.hidden = false
//            historyTableView.reloadData()
//        }
    }
    
    //#MARK: - TableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var num: Int!
        num = historyArray.count
        
        num = 10 // Testing value
        return num
        
    }    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.historyTableView.dequeueReusableCellWithIdentifier("historyTableViewCell") as! DJSearchTableViewCell
        //cell.locationLabel?.text = dataSourceArray [indexPath.row]
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
    }
    

}
