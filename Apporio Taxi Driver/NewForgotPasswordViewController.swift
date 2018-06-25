//
//  NewForgotPasswordViewController.swift
//  YoTaxiCab Driver
//
//  Created by AppOrio on 05/10/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class NewForgotPasswordViewController: UIViewController,ParsingStates {
    
    var changepasswordresponse : NewChangePassword!
    
    @IBOutlet var password: UITextField!
    
    @IBOutlet var confrimPassword: UITextField!
    
   // @IBOutlet var changePasswordButton: UIButton!
    
    
    @IBOutlet weak var topresetyourpasswordtext: UILabel!
    
    @IBOutlet weak var newpasswordtext: UILabel!
    
    @IBOutlet weak var confirmpasswordtext: UILabel!
    
    
    @IBOutlet weak var changepasswordbtntext: UIButton!

    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        topresetyourpasswordtext.text = "RESET YOUR PASSWORD".localized
        newpasswordtext.text = "New Password".localized
        confirmpasswordtext.text = "Confirm Password".localized
        changepasswordbtntext.setTitle("Change Password".localized, for: UIControlState.normal)
        password.placeholder = "Enter Password".localized
        confrimPassword.placeholder = "Confirm Password".localized
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onChangePassword(_ sender: Any) {
        
        if self.password.text!.characters.count < 6
        {
            self.showalert(message: "Password Shoud Not Be Less Then 6".localized)
          
            return
        }
        
        
        if self.password.text!  != self.confrimPassword.text {
            self.showalert(message: "Password Does Not Match".localized)
            
            return
        }
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.ChangeUserPassword(Phone: GlobalVariables.enteruserphonenumber, Password: self.password.text!)
      
        
        
        
        
    }
    
    
    func showalert(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title:   "Alert".localized, message:message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: "ok".localized, style: .default) { (action) in
                
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true) {
                
            }
            
            
        })
        
    }
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        
        if resultCode == 8029{
            
            changepasswordresponse = data as! NewChangePassword
            
            
            if(changepasswordresponse.result == 1){
                
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let revealController: LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                self.present(revealController, animated: true, completion: nil)
                
                
                
            }else{
                
                self.showalert(message: changepasswordresponse.message!)
                
            }

            
        }
        
    }

    

}
