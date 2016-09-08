//
//  DJPlayListDetailViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/16/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJPlayListDetailViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var playListTableView: UITableView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var topImageVIew: UIImageView!
    
    var playListArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initUI()
        self.initData()
        self.initView()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // Init
    func initUI(){
        
        self.playListTableView.sectionHeaderHeight = 40.0
    }
    func initView(){
        
    }
    func initData(){
        playListArray = NSMutableArray.init(capacity: 0)
    }
    
    //#MARK: - TableViewDelegate
    func numberOfSectionsInTableView(tableView:UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        let label = UILabel(frame: CGRect(x: 0, y: 10, width: 200, height: 20))
        label.text = "PLAYLIST INCLUDES"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "ProximaNova-Semibold", size: 13)!
        view.addSubview(label)
        
        let lineLabel = UILabel(frame: CGRect(x: 0, y: playListTableView.sectionHeaderHeight - 1, width: tableView.frame.size.width, height: 1))
        lineLabel.backgroundColor = UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 0.5)
        view.addSubview(lineLabel)
        
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        
        return view
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var num: Int!
        num = playListArray.count
        num = 10 // testing value
  
        return num
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.playListTableView.dequeueReusableCellWithIdentifier("playListDetailTableViewCell") as! DJSearchTableViewCell
        //cell.locationLabel?.text = dataSourceArray [indexPath.row]
        return cell
        
    }

}
