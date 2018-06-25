//
//  LoginViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 06/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController,ParsingStates,MICountryPickerDelegate {
    
    
    var mobileNo: String = ""
    var password: String = ""
    var data: RegisterDriver!
    
    var selcetcountrycode = "+52"
    
    var phonetext = ""
 @IBOutlet weak var enterphonetext: UITextField!
    
     @IBOutlet weak var countrycodetext: UILabel!
    
    
    @IBOutlet weak var toplogintextlabel: UILabel!
    
    
    @IBOutlet weak var forgotpasswordtextlabel: UIButton!
    
    
    @IBOutlet weak var ortextlabel: UILabel!
    
     var ref1 = Database.database().reference()
    
    @IBOutlet weak var boundaryview: UIView!
    
    
    @IBOutlet weak var phoneNoField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var login_btn: UIButton!
    
    
    func setupView(){
        toplogintextlabel.text = "LOGIN".localized
        phoneNoField.placeholder = "Enter Email".localized
        enterphonetext.placeholder = "Enter Mobile".localized
        passwordField.placeholder = "Password".localized
        login_btn.setTitle("LOGIN".localized, for: UIControlState.normal)
        forgotpasswordtextlabel.setTitle("Forgot Password?".localized, for: UIControlState.normal)
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        boundaryview.layer.cornerRadius = 5
        boundaryview.layer.borderWidth = 1.0
        boundaryview.layer.borderColor = UIColor.lightGray.cgColor

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
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
        
        let navcontroller = UINavigationController(rootViewController: picker)
        
        self.present(navcontroller,animated: true,completion: nil)
        
    }
    
    func backButtonTapped() {
        
        dismiss(animated: true, completion: nil)
    }



    @IBAction func login_btn_click(_ sender: Any) {
        
      //  mobileNo = phoneNoField.text!
        password = passwordField.text!
        
        if phoneNoField.text! == ""{
            
            mobileNo =  selcetcountrycode + self.enterphonetext.text!
            
        }else{
            
            mobileNo = phoneNoField.text!
        }
        

        
        if ((mobileNo == "") || (password == "") ) {
            
            let alert = UIAlertController(title: "Login Failed!".localized, message: "Fields cannot be blank ".localized, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else
        {
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.loginDriver(emailPhone: mobileNo, password: password)
            
        }

    }
    
    @IBAction func forgotbtnclick(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let verifyViewController = storyBoard.instantiateViewController(withIdentifier: "VerifyPhoneViewController") as! VerifyPhoneViewController
        verifyViewController.matchString = "forgot"
        self.present(verifyViewController, animated:true, completion:nil)
        
    }
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        self.data = data as! RegisterDriver
        if(self.data.result == 1){
            
            
            if(self.data.details?.detailStatus == "1"){
                
                NsUserDefaultManager.SingeltonInstance.registerDriver(insurance: (self.data.details?.insurance!)!, rc: (self.data.details?.rc!)!, licence: (self.data.details?.license!)!, did: (self.data.details?.deviceId!)!, carModelId: (self.data.details?.carModelId!)!, otherDoc: (self.data.details?.otherDocs!)!, driverId: (self.data.details?.driverId!)!, driverImg: (self.data.details?.driverImage!)!, driverEmail: (self.data.details?.driverEmail!)!, driverName: (self.data.details?.driverName!)!, flag: (self.data.details?.flag!)!, long: (self.data.details?.currentLong!)!, cityid: (self.data.details?.cityId!)!, carNo: (self.data.details?.carNumber!)!, password: (self.data.details?.driverPassword!)!, lat: (self.data.details?.currentLat!)!, phoneNo: (self.data.details?.driverPhone!)!, carType: (self.data.details?.carTypeId!)!, onOff: (self.data.details?.onlineOffline!)!, status: (self.data.details?.driverAdminStatus!)!, loginLogout: (self.data.details?.loginLogout!)!,driverToken: (self.data.details?.driverToken!)!,detailStatus : (self.data.details?.detailStatus)!,carmodelname : (self.data.details?.carModelName!)! , cartypename : (self.data.details?.carTypeName!)!,cityname : (self.data.details?.cityName!)!,Driverstatusimage: (self.data.details?.driverStatusImage)!,Driverstatusmessage: (self.data.details?.driverStatusMessage)!,DriverBankName: (self.data.details?.driverBankName!)!,DriverAccountName: (self.data.details?.driverAccountName!)!,DriverAccountNumber: (self.data.details?.driverAccountNumber!)!)
                
               /* let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: UploadDocumentViewController = storyboard.instantiateViewController(withIdentifier: "UploadDocumentViewController") as! UploadDocumentViewController
                self.present(next, animated: true, completion: nil)*/
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: DocumentStatusViewController = storyboard.instantiateViewController(withIdentifier: "DocumentStatusViewController") as! DocumentStatusViewController
                self.present(next, animated: true, completion: nil)
                
                
                
                
            }else  if(self.data.details?.detailStatus == "3"){
                
                  NsUserDefaultManager.SingeltonInstance.registerDriver(insurance: (self.data.details?.insurance!)!, rc: (self.data.details?.rc!)!, licence: (self.data.details?.license!)!, did: (self.data.details?.deviceId!)!, carModelId: (self.data.details?.carModelId!)!, otherDoc: (self.data.details?.otherDocs!)!, driverId: (self.data.details?.driverId!)!, driverImg: (self.data.details?.driverImage!)!, driverEmail: (self.data.details?.driverEmail!)!, driverName: (self.data.details?.driverName!)!, flag: (self.data.details?.flag!)!, long: (self.data.details?.currentLong!)!, cityid: (self.data.details?.cityId!)!, carNo: (self.data.details?.carNumber!)!, password: (self.data.details?.driverPassword!)!, lat: (self.data.details?.currentLat!)!, phoneNo: (self.data.details?.driverPhone!)!, carType: (self.data.details?.carTypeId!)!, onOff: (self.data.details?.onlineOffline!)!, status: (self.data.details?.driverAdminStatus!)!, loginLogout: (self.data.details?.loginLogout!)!,driverToken: (self.data.details?.driverToken!)!,detailStatus : (self.data.details?.detailStatus)!,carmodelname : (self.data.details?.carModelName!)! , cartypename : (self.data.details?.carTypeName!)!,cityname : (self.data.details?.cityName!)!,Driverstatusimage: (self.data.details?.driverStatusImage)!,Driverstatusmessage: (self.data.details?.driverStatusMessage)!,DriverBankName: (self.data.details?.driverBankName!)!,DriverAccountName: (self.data.details?.driverAccountName!)!,DriverAccountNumber: (self.data.details?.driverAccountNumber!)!)
                
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SignupVerifyViewController = storyboard.instantiateViewController(withIdentifier: "SignupVerifyViewController") as! SignupVerifyViewController
                self.present(next, animated: true, completion: nil)
                
            }
            else{
                
                
                NsUserDefaultManager.SingeltonInstance.registerDriver(insurance: (self.data.details?.insurance!)!, rc: (self.data.details?.rc!)!, licence: (self.data.details?.license!)!, did: (self.data.details?.deviceId!)!, carModelId: (self.data.details?.carModelId!)!, otherDoc: (self.data.details?.otherDocs!)!, driverId: (self.data.details?.driverId!)!, driverImg: (self.data.details?.driverImage!)!, driverEmail: (self.data.details?.driverEmail!)!, driverName: (self.data.details?.driverName!)!, flag: (self.data.details?.flag!)!, long: (self.data.details?.currentLong!)!, cityid: (self.data.details?.cityId!)!, carNo: (self.data.details?.carNumber!)!, password: (self.data.details?.driverPassword!)!, lat: (self.data.details?.currentLat!)!, phoneNo: (self.data.details?.driverPhone!)!, carType: (self.data.details?.carTypeId!)!, onOff: (self.data.details?.onlineOffline!)!, status: (self.data.details?.driverAdminStatus!)!, loginLogout: (self.data.details?.loginLogout!)!,driverToken: (self.data.details?.driverToken!)!,detailStatus : (self.data.details?.detailStatus)!,carmodelname : (self.data.details?.carModelName!)! , cartypename : (self.data.details?.carTypeName!)!,cityname : (self.data.details?.cityName!)!,Driverstatusimage: (self.data.details?.driverStatusImage)!,Driverstatusmessage: (self.data.details?.driverStatusMessage)!,DriverBankName: (self.data.details?.driverBankName!)!,DriverAccountName: (self.data.details?.driverAccountName!)!,DriverAccountNumber: (self.data.details?.driverAccountNumber!)!)
                
                print("data saved")
                
                let alert = UIAlertController(title: "", message:self.data.msg!, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                    
                    
                    
                    let Message: NSDictionary = ["ride_id": "No Ride","ride_status": "No Ride Status"]
                    
                    self.ref1.child("Activeride").child((self.data.details?.driverId!)!).setValue(Message)
                                    
                   /* let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let revealViewController:OnLineViewController = storyBoard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                    
                    self.present(revealViewController, animated:true, completion:nil)*/
                    
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                    
                    if let window = self.view.window{
                        window.rootViewController = nextController
                    }
                    
                }
                alert.addAction(action)
                self.present(alert, animated: true){}
            }
            
            
        }
        else{
            
            let alert = UIAlertController(title: "Unable to login!".localized, message: self.data.msg! , preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        
    }
    
    
    // ********************* Textfield delegate ***************************
    
    
    override func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    

    
   
}
