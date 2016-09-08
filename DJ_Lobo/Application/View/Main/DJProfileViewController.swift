//
//  DJProfileViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/16/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJProfileViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var userProfilePhotoView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var activityTableView: UITableView!
    
    let titleArray = ["Playlist", "Cue", "Favorite", "History", "Alarm"]
    let iconArray = ["icon_profile_playlist", "icon_profile_cue", "icon_profile_favourite", "icon_profile_history", "icon_profile_alarm"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.initData()
        self.initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initUI(){
        DLAppManager.sharedInstance.cropCircleImage(userProfilePhotoView)        
    }
    func initData(){
    
    }
    func initView(){
        
    }
    
    //#MARK: - TableViewDelegate
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 50
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        let label = UILabel(frame: CGRect(x: 0, y: 20, width: 200, height: 20))
        label.text = "ACTIVITIES"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "ProximaNova-Semibold", size: 14)!
        view.addSubview(label)
        
        let lineLabel = UILabel(frame: CGRect(x: 0, y: 49, width: tableView.frame.size.width, height: 1))
        lineLabel.backgroundColor = UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 0.5)
        view.addSubview(lineLabel)
        
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        
        return view
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var num: Int!
        num = titleArray.count
        return num
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.activityTableView.dequeueReusableCellWithIdentifier("profileActivityTableViewCell") as! DJSearchTableViewCell
        
        cell.activityTitleLabel?.text = titleArray[indexPath.row]
        cell.activityIconImageView?.image = UIImage(named: iconArray[indexPath.row])
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        var pageController: UIViewController!
        switch indexPath.row {
        case 0:
           pageController = self.storyboard?.instantiateViewControllerWithIdentifier("playlistPage")
        case 1:
            pageController = self.storyboard?.instantiateViewControllerWithIdentifier("cuePage")

        case 2:
            pageController = self.storyboard?.instantiateViewControllerWithIdentifier("favoritePage")

        case 3:
            pageController = self.storyboard?.instantiateViewControllerWithIdentifier("historyPage")

        case 4:
            pageController = self.storyboard?.instantiateViewControllerWithIdentifier("alarmPage")

        default: break
            
        }
        if (pageController != nil) {
            self.navigationController? .pushViewController(pageController!, animated: true)
        }
    }    

}
