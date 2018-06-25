//
//  ForgotPasswordViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 12/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController,ParsingStates  {
    
    var driverEmail: String = ""
    var data: ForgotPassword!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var submitbtn: CustomButton!
    
    
    @IBOutlet weak var forgotpasswordtextlabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        forgotpasswordtextlabel.text = "Forgot Password".localized
         submitbtn.setTitle("Submit".localized, for: UIControlState.normal)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtn(_ sender: Any) {
        dismissViewcontroller()
    }
    
    
    @IBAction func submitbtn(_ sender: Any) {
        
        driverEmail = emailField.text!
        if (driverEmail.contains(" "))
        {
            let alert = UIAlertController(title: "", message:" Email id must not contain space ".localized, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else{
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.forgotPassword(driveremail: driverEmail)
            
        }

    }
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        self.data = data as! ForgotPassword
        if(self.data.result == 1){
            
            let alert = UIAlertController(title: "", message:self.data.msg!, preferredStyle: .alert)
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
