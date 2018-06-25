//
//  VerifyPhoneViewController.swift
//  YoTaxiCab Customer
//
//  Created by AppOrio on 04/10/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class VerifyPhoneViewController: UIViewController,ParsingStates,MICountryPickerDelegate {
    
    
    @IBOutlet var container: UIView!
    
    var checkotpdata : CheckOtpModel!
    
    var forgotcheckotpdata : ForgotCheckOtpModel!
    
    
    @IBOutlet weak var pleaseenterdetailstext: UILabel!
    @IBOutlet weak var getotpbtntext: UIButton!
    @IBOutlet weak var verifyphonenumbertextlabel: UILabel!
    
    @IBOutlet weak var submitbtntext: UIButton!
    
    
    @IBOutlet weak var countrycodetext: UILabel!
    
    @IBOutlet weak var enterphonetext: UITextField!
    
    @IBOutlet weak var enterotptext: UITextField!
    
    var otpvalue = "0"
    
   
   var matchString = ""
    
    var selcetcountrycode = "+52"
    
    var phonetext = ""

    @IBOutlet weak var otpcontainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pleaseenterdetailstext.text = "Please enter the One Time Password(OTP) received on your entered mobile number!".localized
        verifyphonenumbertextlabel.text = "Verify Phone Number".localized
        getotpbtntext.setTitle("GET OTP".localized, for: UIControlState.normal)
        submitbtntext.setTitle("Submit".localized, for: UIControlState.normal)
        enterphonetext.placeholder = "Enter Phone".localized
        enterotptext.placeholder = "Enter Otp".localized
        
        

        
         self.container.edgeWithShadow()
        
        self.otpcontainer.edgeWithShadow()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtn(_ sender: Any) {
        dismissViewcontroller()
    }
    
    func countryPicker(_ picker: MICountryPicker, didSelectCountryWithName name: String, code: String) {
        
    }
    func countryPicker(_ picker: MICountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String)
    {
        selcetcountrycode = dialCode
        countrycodetext.text = dialCode
        self.dismiss(animated: true, completion: nil)
        
        
    }
    @IBAction func Selectcountrycode_btn(_ sender: Any) {
        
        let picker = MICountryPicker { (name, code) -> () in
            print(code)
        }
        
        picker.delegate = self
         let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(backButtonTapped))
        picker.navigationItem.leftBarButtonItem = backButton
        // Display calling codes
        picker.showCallingCodes = true
        
        // or closure
        picker.didSelectCountryClosure = { name, code in
        }
        
        //self.present(picker, animated: true, completion: nil)
        let navcontroller = UINavigationController(rootViewController: picker)
       
              self.present(navcontroller,animated: true,completion: nil)
        

    }
    
    func backButtonTapped() {
        
        dismiss(animated: true, completion: nil)
    }

    
    @IBAction func getotp_btn_click(_ sender: Any) {
        
        phonetext = self.enterphonetext.text!
        
        if((phonetext.characters.count >= 11)){
            
            //if phonetext == ""{
            
            self.showalert(message: "Mobile number must be less than 11 digits.".localized)
            
            
        }else{

            
            enterotptext.becomeFirstResponder()
        
        if self.matchString == "forgot"{
            
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.ForgotGetOtpMethod(Phone: selcetcountrycode + self.enterphonetext.text!)
        
         
        
        }else{
        
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.GetOtpMethod(Phone: selcetcountrycode + self.enterphonetext.text!)
            
                  
        }
            
        }
        
    }
   
    
    @IBAction func Submit_btn_click(_ sender: Any) {
        
        phonetext = self.enterphonetext.text!
        
        if phonetext == ""{
            
            self.showalert(message: "Please Enter Mobile Number First".localized)
           
           
        }else{
        
        if otpvalue == self.enterotptext.text!
            
        {
            
             if self.matchString == "forgot"{
                
                 GlobalVariables.enteruserphonenumber = selcetcountrycode + self.enterphonetext.text!
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "NewForgotPasswordViewController") as! NewForgotPasswordViewController
               
                self.present(vc, animated: true, completion: nil)

             }else{
                GlobalVariables.checkphonenumber = 1
                GlobalVariables.enteruserphonenumber = selcetcountrycode + self.enterphonetext.text!
               dismissViewcontroller()
            
              }
            
            
        }else{
            
             self.showalert(message: "Please Enter Valid OTP".localized)
        }
        
        
        
        }
        
        
        
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
        
        
          if resultCode == 8028{
        
            checkotpdata = data as! CheckOtpModel
            
            if(checkotpdata.result == 1){
                
            self.otpvalue = checkotpdata.otp!
                
            }else{
                
            self.showalert(message: checkotpdata.msg!)
            }
        
        
        }
        
        if resultCode == 8030{
            
            forgotcheckotpdata = data as! ForgotCheckOtpModel
            
            if(forgotcheckotpdata.result == 1){
                
                self.otpvalue = forgotcheckotpdata.otp!
                
            }else{
                
                self.showalert(message: forgotcheckotpdata.msg!)
            }
            
            
        }
        
        
    }
    

   
}
