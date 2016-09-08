//
//  DJSearchViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/16/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJSearchViewController: BaseViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let sectionHeaderArray = ["TOP RESULTS", "TOP ARTISTS", "PROFILES", "SONGS", "ALBUMS", "PLAYLISTS"]
    let sectionFooterArray = ["VIEW ALL TOP RESULTS", "VIEW ALL TOP ARTISTS", "VIEW ALL PROFILES", "VIEW ALL SONGS", "VIEW ALL ALBUMS", "VIEW ALL PLAYLISTS"]
    
    var topResultArray: NSMutableArray!
    var topArtistArray: NSMutableArray!
    var profileArray: NSMutableArray!
    var songArray: NSMutableArray!
    var albumArray: NSMutableArray!
    var playlistArray: NSMutableArray!
    
    var find_topResultArray: NSMutableArray!
    var find_topArtistArray: NSMutableArray!
    var find_profileArray: NSMutableArray!
    var find_songArray: NSMutableArray!
    var find_albumArray: NSMutableArray!
    var find_playlistArray: NSMutableArray!
    
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchLandingView: UIView!

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
        
        self.searchTableView.sectionHeaderHeight = 40.0
        self.searchTableView.sectionFooterHeight = 60.0
        self.searchTableView.hidden = true
        self.searchLandingView.hidden = false;
        
        let textFieldInsideSearchBar = searchBar.valueForKey("searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.lightGrayColor()
        let cancelButtonAttributes: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes as? [String : AnyObject], forState: UIControlState.Normal)
    }
    func initView(){
        
        self.view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action:#selector(DJSearchViewController.onTappedScreen)))
        self.searchTableView.contentInset = UIEdgeInsetsMake(-1.0, 0.0, -1.0, 0.0)
        
    }
    func initData(){
        
        topResultArray = NSMutableArray.init(capacity: 0)
        topArtistArray = NSMutableArray.init(capacity: 0)
        profileArray = NSMutableArray.init(capacity: 0)
        songArray = NSMutableArray.init(capacity: 0)
        albumArray = NSMutableArray.init(capacity: 0)
        playlistArray = NSMutableArray.init(capacity: 0)
        
        find_topResultArray = topResultArray
        find_topArtistArray = topArtistArray
        find_profileArray = profileArray
        find_songArray = songArray
        find_albumArray = albumArray
        find_playlistArray = playlistArray
        
        searchBar.delegate = self
        
    }
    
    //#MARK: - Custom Func
    func onTappedScreen(){
        searchBar.resignFirstResponder()
    }
    
    //#MARK: - TableViewDelegate
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        
        if(section == 0){
            return 1.0
        }else{
            return 40
        }
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        
        if(section == 0){
            return 1.0
        }else{
            return 40
        }
    }

    func numberOfSectionsInTableView(tableView:UITableView) -> Int {
        return sectionHeaderArray.count
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        
        if(section == 0){
            return nil
        }
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        let label = UILabel(frame: CGRect(x: 0, y: 10, width: 200, height: 20))
        label.text = sectionHeaderArray[section - 1]
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont(name: "ProximaNova-Semibold", size: 13)
        view.addSubview(label)
        
        let lineLabel = UILabel(frame: CGRect(x: 0, y: searchTableView.sectionHeaderHeight - 1, width: tableView.frame.size.width, height: 1))
        lineLabel.backgroundColor = UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 0.5)
        view.addSubview(lineLabel)
        
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        
        return view
    }
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView?{
        
        if(section == 0){
            return nil
        }
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        let button = UIButton(frame: CGRect(x: 50, y: 10, width: tableView.frame.size.width - 100, height: 40))
        button.setTitle(sectionFooterArray[section - 1], forState: .Normal)
        button.setTitleColor(UIColor.lightTextColor(), forState: .Normal)
        button.titleLabel!.font = UIFont(name: "ProximaNova-Semibold", size: 13)
        button.backgroundColor = UIColor.clearColor()
        view.addSubview(button)
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)

        return view
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var num: Int!
        
        switch section {
        case 0:
            num = 0
        case 1:
            num = find_topResultArray.count
            num = 1
        case 2:
            num = find_topArtistArray.count
            num = 3
        case 3:
            num = find_profileArray.count
            num = 3
        case 4:
            num = find_songArray.count
            num = 6
        case 5:
            num = find_albumArray.count
            num = 5
        case 6:
            num = find_playlistArray.count
            num = 3
        default:
            num = 0
        }
        
        return num
        
    }
 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.searchTableView.dequeueReusableCellWithIdentifier("searchTableViewCell") as! DJSearchTableViewCell
        //cell.locationLabel?.text = dataSourceArray [indexPath.row]
        
        switch indexPath.section {
            case 1:
                
                cell.artistName.hidden = true
                cell.artistDetailLabel.hidden = true
                cell.iconSongPlayingImageView.hidden = true
                
                break
            case 2:
                cell.artistName.hidden = true
                cell.artistDetailLabel.hidden = true
                cell.iconSongPlayingImageView.hidden = true
                
                break
            case 3:
                cell.activityTitleLabel.hidden = true
                cell.iconSongPlayingImageView.hidden = true
                
                break
            case 4:
                
                cell.activityTitleLabel.hidden = true
                cell.iconAvatarImageView.hidden = true
                cell.iconPlusSimbolImageView.hidden = true
                
                break
            case 5:
                
                cell.activityTitleLabel.hidden = true
                cell.iconAvatarImageView.hidden = true
                cell.iconPlusSimbolImageView.hidden = true
                
                break
            
            case 6:
                cell.activityTitleLabel.hidden = true
                cell.iconAvatarImageView.hidden = true
                cell.iconPlusSimbolImageView.hidden = true
                break
            default:
                break
        }
        return cell

    }
    
    //#MARK - SearchBar Delegate
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String){
        
        searchBar.showsCancelButton = true
        
        if searchText == "" {
            
            self.searchTableView.hidden = true
            self.searchLandingView.hidden = false
        }else{
            self.searchTableView.hidden = false
            self.searchLandingView.hidden = true
        }
        
    }
    func searchBarCancelButtonClicked(searchBar: UISearchBar){
        
        searchBar.showsCancelButton = false
        searchBar.text = ""
        self.searchTableView.hidden = true
        self.searchLandingView.hidden = false
    }
    
}
