//
//  DJPlayerCommentViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/16/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJPlayerCommentViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var commentNumLabel: UILabel!
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var emptyContainView: UIView!
    @IBOutlet weak var tableViewContainView: UIView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var textFieldContainView: UIView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    var textFieldContainViewHeight: CGFloat!
    
    var commentArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initUI()
        self.initData()
        self.initView()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
        
        self.reloadPage()
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        commentTextField.resignFirstResponder()
        mainScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // #MARK: - Init
    func initUI(){
        self.appManager.setRoundRectView(commentNumLabel, cornerRadius: commentNumLabel.frame.size.height / 2)        
    }
    func initData(){
        commentArray = NSMutableArray.init(capacity: 0)
        textFieldContainViewHeight = textFieldContainView.frame.size.height
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
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var num: Int!
        num = commentArray.count
        
        num = 10 // Testing value
        return num
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.commentTableView.dequeueReusableCellWithIdentifier("commentTableViewCell") as! DJSearchTableViewCell
        appManager.cropCircleImage(cell.artistImageView)
        
        return cell
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool{
        if (self.isLodingBase == true) {
            return false
        }
        return true
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        return commentTextField.resignFirstResponder()
    }
    @IBAction func onClickPostBtn(sender: UIButton) {
        if(self.isLodingBase == true){
            return
        }
    }
    
    //#MARK: - Keyboard Notification
    func keyboardWillShow(notification: NSNotification){
        
        let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        var offsetY: CGFloat!
        offsetY  = frame.size.height
        print(offsetY)
        mainScrollView.setContentOffset(CGPointMake(0, offsetY), animated: true)
        
    }
    func keyboardWillHide(notification: NSNotification){
        
        let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        var offsetY: CGFloat!
        offsetY  = textFieldContainView.frame.origin.y + frame.size.height
        print(offsetY)
        mainScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
    }

}
