//
//  DLLogInViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/11/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DLLogInViewController: UserBaseViewController, UIScrollViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    var currentTextField: UITextField!
    var userInfo: NSMutableDictionary!
    
    var isEditing: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initUI()
        self.initData()
        self.initView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if (isEditing == true) {
            currentTextField.resignFirstResponder()
            mainScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
            isEditing = false
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - init
    func initUI(){

    }
    func initData(){
        isEditing = false
    }
    func initView(){
        mainScrollView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action:#selector(DLLogInViewController.onTappedScreen)))
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool
    {
        if (self.isLodingUserBase == true) {
            return false
        }else{
            currentTextField = textField
            isEditing = true
            return true
        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool{

        mainScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        return currentTextField.resignFirstResponder()
    }
    
    // MARK: - Custom IBAction
    @IBAction func guestLogIn(sender: AnyObject) {
        
        if (self.isLodingUserBase == true) {
            return
        }else{
            
            // here is Guest User LogIn coding
            self.navToMainView()

        }
    }
    
    @IBAction func customLogIn(sender: UIButton) {
        
        if (self.isLodingUserBase == true) {
            return
        }else{
            self.navToMainView()
        }
    }
    
    @IBAction func fbLogIn(sender: UIButton) {
        
        if (self.isLodingUserBase == true) {
            return
        }else{
            // here coding
        }
    }

    @IBAction func twitterLogIn(sender: UIButton) {
        
        if (self.isLodingUserBase == true) {
            return
        }else{
            // here coding
        }
    }

    @IBAction func forgotPwd(sender: UIButton) {
        
        if (self.isLodingUserBase == true) {
            return
        }else{
            // here coding
        }
        
    }
    //#MARK: - Custom Func
    func onTappedScreen(){
        
        if (self.isLodingUserBase == true) {
            return
        }
        if (isEditing == true) {
            currentTextField.resignFirstResponder()
            mainScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
            isEditing = false
        }
        
    }
   
}
