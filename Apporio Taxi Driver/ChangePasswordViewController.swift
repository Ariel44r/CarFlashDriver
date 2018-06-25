//
//  ChangePasswordViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 12/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController,ParsingStates  {
    
    var oldPwd: String = ""
    var newPwd: String = ""
    var cnfrmPwd: String = ""
    var data: ChangePassword!
    var defaultdriverid = ""
    
    @IBOutlet weak var confirm_pwd_field: UITextField!
    @IBOutlet weak var new_pwd_field: UITextField!
    @IBOutlet weak var old_pwd_field: UITextField!
    
    @IBOutlet weak var changepasswordtextlabel: UILabel!

    @IBOutlet weak var donebtn: CustomButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        changepasswordtextlabel.text = "Change Password".localized
        old_pwd_field.placeholder = "Old Password".localized
        new_pwd_field.placeholder = "New Password".localized
        confirm_pwd_field.placeholder = "Confirm Password".localized
        donebtn.setTitle("DONE".localized, for: UIControlState.normal)
        
         defaultdriverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtn(_ sender: Any) {
        dismissViewcontroller()
        
        
    }

    @IBAction func Donebtn(_ sender: Any) {
        
        oldPwd = old_pwd_field.text!
        newPwd = new_pwd_field.text!
        cnfrmPwd = confirm_pwd_field.text!
        
        if (newPwd == cnfrmPwd){
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.changePassword(driverid: defaultdriverid, oldPwd: oldPwd, newPwd: newPwd)
        }

        
        
    }
    
    override func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }

    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        self.data = data as! ChangePassword
        if(self.data.result == 1){
            
            let alert = UIAlertController(title: "", message: self.data.msg! , preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        else{
            
            let alert = UIAlertController(title: "", message: self.data.msg! , preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        
    }

    
    
   

}
