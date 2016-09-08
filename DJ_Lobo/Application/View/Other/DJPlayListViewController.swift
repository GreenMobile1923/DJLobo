//
//  DJPlayListViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/16/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJPlayListViewController: BaseViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var emptyNotifyView: UIView!
    @IBOutlet weak var tableContainerView: UIView!
    @IBOutlet weak var playlistTableView: UITableView!
    
    var playListArray: NSMutableArray!

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
    
    func  initUI(){
        self.playlistTableView.sectionHeaderHeight = 40.0
    }
    func initData(){
        
        playListArray = NSMutableArray.init(capacity: 0)
    }
    func initView(){
        
    }
    
    //MARK: - Custom Func
    func reloadPage(){
//        if (playListArray.count == 0) {
//            emptyNotifyView.hidden = false
//            tableContainerView.hidden = true
//        }else{
//            emptyNotifyView.hidden = true
//            tableContainerView.hidden = false
//            playlistTableView.reloadData()
//        }
    }
    
    //#MARK: - TableViewDelegate
    func numberOfSectionsInTableView(tableView:UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        let label = UILabel(frame: CGRect(x: 0, y: 10, width: 200, height: 20))
        label.text = "ARCHIEVE"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "ProximaNova-Semibold", size: 13)!
        view.addSubview(label)
        
        let lineLabel = UILabel(frame: CGRect(x: 0, y: playlistTableView.sectionHeaderHeight - 1, width: tableView.frame.size.width, height: 1))
        lineLabel.backgroundColor = UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 0.5)
        view.addSubview(lineLabel)
        
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        
        return view
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var num: Int!
        num = playListArray.count
        
        num = 10 // Testing value
        return num
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.playlistTableView.dequeueReusableCellWithIdentifier("playlistTableViewCell") as! DJSearchTableViewCell
        //cell.locationLabel?.text = dataSourceArray [indexPath.row]
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){        
        self.gotoDatailPage(indexPath.row)
    }
    
    func gotoDatailPage(index:Int){
        let pageController = self.storyboard?.instantiateViewControllerWithIdentifier("playListDetailPage")
        self.navigationController?.pushViewController(pageController!, animated: true)
    }

    
}
