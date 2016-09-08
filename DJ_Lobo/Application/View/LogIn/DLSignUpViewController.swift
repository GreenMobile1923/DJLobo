//
//  DLSignUpViewController.swift
//  DJ_Lobo
//
//  Created by Star on 5/11/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DLSignUpViewController: UserBaseViewController, UIScrollViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userBirthYearTextField: UITextField!

    @IBOutlet weak var languageENBtn: UIButton!
    @IBOutlet weak var languageESBtn: UIButton!
    @IBOutlet weak var genderMaleBtn: UIButton!
    @IBOutlet weak var genderFemaleBtn: UIButton!
    @IBOutlet weak var checkImageView: UIImageView!
    
    var currentTextField: UITextField!
    var userInfo: NSMutableDictionary!
    var isCheckedTermAndPolicy: Bool!
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
        checkImageView.image = UIImage(named: "icon_check_off")
    }
    func initData(){
        isCheckedTermAndPolicy = false
        isEditing = false
    }
    func initView(){
        
        mainScrollView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action:#selector(DLSignUpViewController.onTappedScreen)))
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool
    {
        if (self.isLodingUserBase == true) {
            return false
        }else{
            
            isEditing = true
            currentTextField = textField
            var offsetY: CGFloat!
            offsetY = 0
            if (currentTextField == userBirthYearTextField) {
                offsetY = 20.0
            }
            mainScrollView.setContentOffset(CGPointMake(0, offsetY), animated: true)
            return true
        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        mainScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        return currentTextField.resignFirstResponder()
    }
    
    // MARK: - Custom IBAction
    @IBAction func onClickLanguageEnBtn(sender: UIButton) {
        if (self.isLodingUserBase == true){
            return
        }
        sender.titleLabel?.textColor = UIColor.whiteColor()
        languageESBtn.titleLabel?.textColor = UIColor.darkGrayColor()
    }
    @IBAction func onClickLanguageSpBtn(sender: UIButton) {
        if (self.isLodingUserBase == true){
            return
        }
        languageENBtn.titleLabel?.textColor = UIColor.darkGrayColor()
        sender.titleLabel?.textColor = UIColor.whiteColor()
    }
    @IBAction func onClickGenderMaleBtn(sender: UIButton) {
        if (self.isLodingUserBase == true){
            return
        }
        sender.titleLabel?.textColor = UIColor.whiteColor()
        genderFemaleBtn.titleLabel?.textColor = UIColor.darkGrayColor()
    }
    @IBAction func onClickGenderFemaleBtn(sender: UIButton) {
        if (self.isLodingUserBase == true){
            return
        }
        genderMaleBtn.titleLabel?.textColor = UIColor.darkGrayColor()
        sender.titleLabel?.textColor = UIColor.whiteColor()
    }
    @IBAction func termsCheckStateBtn(sender: AnyObject) {
        
        if (self.isLodingUserBase == true){
            return
        }        
        if (isCheckedTermAndPolicy == false) {
            isCheckedTermAndPolicy = true
            checkImageView.image = UIImage(named: "icon_check_on")
        }else{
            isCheckedTermAndPolicy = false
            checkImageView.image = UIImage(named: "icon_check_off")
        }
    }
    @IBAction func createAccount(sender: UIButton) {
        if (self.isLodingUserBase == true) {
            return
        }else{
            if (isCheckedTermAndPolicy == false) {
                
                let alertController = appManager.showAlert("Warning!", message: "You should agree to Terms of Use and Privacy Policy")
                self.presentViewController(alertController, animated: true, completion: nil)
                return
            }else{
                
                // here coding for API calling
            }
        }
        
    }
    
    @IBAction func fbSignUp(sender: UIButton) {
        
        if (self.isLodingUserBase == true) {
            return
        }else{
            if (isCheckedTermAndPolicy == false) {
                let alertController = appManager.showAlert("Warning!", message: "You should agree to Terms of Use and Privacy Policy")
                self.presentViewController(alertController, animated: true, completion: nil)
                return
            }else{
                
                // here coding for API calling
            }
        }


    }
    @IBAction func twitterSignUp(sender: UIButton) {
        
        if (self.isLodingUserBase == true) {
            return
        }else{
            if (isCheckedTermAndPolicy == false) {
                let alertController = appManager.showAlert("Warning!", message: "You should agree to Terms of Use and Privacy Policy")
                self.presentViewController(alertController, animated: true, completion: nil)
                return
            }else{
                
                // here coding for API calling
            }
        }
    }
    
    @IBAction func guestLogIn(sender: AnyObject) {
        
        if (self.isLodingUserBase == true) {
            return
        }else{
            
                // here coding for API calling
                self.navToMainView()
         
        }
    }
    //#MARK: - Custom Func
    func onTappedScreen(){
        
        if (self.isLodingUserBase == true) {
            return
        }
        if (isEditing == true){
            currentTextField.resignFirstResponder()
            mainScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        }
        
    }
    
}
