//
//  SplashViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 06/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps


class SplashViewController: UIViewController,ParsingStates , CLLocationManagerDelegate {
    
    //MARK: Variables & Instances
    var appupdateData: AppUpdateModel!
    var data: RegisterDriver!
    var randomNumber = ""
    var city = ""
    var CITY = ""
    var index = 0
    let animationDuration: TimeInterval = 0.25
    let switchingInterval: TimeInterval = 3
    let locationManager = CLLocationManager()    
    var Timer:Foundation.Timer!
    
    //MARK: Outlets
    //@IBOutlet weak var loginasdemodrivertextdriver: UILabel!
    @IBOutlet weak var apporiotaxidrivertextlabel: UILabel!
    @IBOutlet weak var login_btn: UIButton!
    @IBOutlet weak var register_btn: UIButton!
    @IBOutlet weak var container_view: UIView!
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "en"){
            
            if GlobalVariables.languagecodeselectinmenu == 0{
                
                UserDefaults.standard.set("en", forKey: "PreferredLanguage")
                
                GlobalVariables.languagecode = "en"
                GlobalVariables.languageid = 1
                Language.language = Language(rawValue: "en")!
                
            }else{
                
                
            }
        }
        else{
            if GlobalVariables.languagecodeselectinmenu == 0{
                
                UserDefaults.standard.set("es", forKey: "PreferredLanguage")
                
                
                GlobalVariables.languagecode = "es"
                GlobalVariables.languageid = 2
                Language.language = Language(rawValue: "es")!
                
            }else{
                
                
            }
            
        }
        
        
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        self.locationManager.pausesLocationUpdatesAutomatically = false
        self.locationManager.requestAlwaysAuthorization()
        if #available(iOS 9.0, *) {
            locationManager.allowsBackgroundLocationUpdates = true
        } else {
            // Fallback on earlier versions
        }
        self.locationManager.startUpdatingLocation()
        
        
      //  if(GlobalVariables.updatechecklater == "0"){
        
        
        
         if(NsUserDefaultManager.SingeltonInstance.isloggedin()){
        
            self.container_view.isHidden = true
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.AppUdateMethod(ApplicationVersion: GlobalVariables.appversion)

         }else{
        
            self.container_view.isHidden = false
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.AppUdateMethod(ApplicationVersion: GlobalVariables.appversion)

        
        }
        
     /*   }else{
        
        
        
        GlobalVariables.updatechecklater = "0"
        
        
        
        if(NsUserDefaultManager.SingeltonInstance.isloggedin()){
            
            
            let defaultdetailstatus = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDetailStatus)!
            
            
            if defaultdetailstatus == "1"{
                
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.sendDeviceId()
                
                
                
                self.container_view.isHidden = false
                Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode(_:)), userInfo: nil, repeats: false)
                
            }else if defaultdetailstatus == "3"{
                
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.sendDeviceId()
                
                
                
                self.container_view.isHidden = false
                Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode(_:)), userInfo: nil, repeats: false)
                
            }
            
            
            else{
                
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.sendDeviceId()
                
                
                
                self.container_view.isHidden = true
                Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode1(_:)), userInfo: nil, repeats: false)
                
            }
            
        }
        else{
            
            self.container_view.isHidden = false
            
            Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode(_:)), userInfo: nil, repeats: false)
            
        }
            
            
        }*/


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions & Functions
    class func getColorFromHex(_ hexString:String)->UIColor{
        
        var rgbValue : UInt32 = 0
        let scanner:Scanner =  Scanner(string: hexString)
        
        scanner.scanLocation = 1
        scanner.scanHexInt32(&rgbValue)
        
        return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }
    
    @IBAction func register_btn(_ sender: AnyObject) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let revealController: RegisterationViewController = storyboard.instantiateViewController(withIdentifier: "RegisterationViewController") as! RegisterationViewController
        self.present(revealController, animated: true, completion: nil)
        
    }
    
    @IBAction func login_btn(_ sender: AnyObject) {    
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let revealController: LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(revealController, animated: true, completion: nil)
       
    }

    func setupView(){
        apporiotaxidrivertextlabel.text = "Car Flash Driver".localized
       // loginasdemodrivertextdriver.text = "Login as demo driver".localized
        login_btn.setTitle("LOGIN".localized, for: UIControlState.normal)
        register_btn.setTitle("REGISTER".localized, for: UIControlState.normal)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            reverseGeocodeCoordinate(location.coordinate)
            Lat = String(location.coordinate.latitude)
            Lng = String(location.coordinate.longitude)
            
        }
    }
    
    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D)  {
        // 1
        let geocoder = GMSGeocoder()
        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                GlobalVariables.driverLocation = address.addressLine1()! + " , " + address.addressLine2()!
                
            }
        }
    }
    
    func myPerformeCode(_ timer : Foundation.Timer) {    
        Timer.invalidate()
        self.container_view.isHidden = false  
        let transition = CATransition()
        //transition.type = kCATransitionFade
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromBottom
        container_view.layer.add(transition, forKey: kCATransition)
        // here code to perform
    }
    
    func myPerformeCode1(_ timer : Foundation.Timer) {
        GlobalVariables.locationdidactive = 1
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
        if let window = self.view.window{
            window.rootViewController = nextController

        }
        /*let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let revealViewController:OnLineViewController = storyBoard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
              self.present(revealViewController, animated:true, completion:nil)*/
    }
    
    func myPerformeCode2(_ timer : Foundation.Timer) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: UploadDocumentViewController = storyboard.instantiateViewController(withIdentifier: "UploadDocumentViewController") as! UploadDocumentViewController
        self.present(next, animated: true, completion: nil)
        
    }
    
    @IBAction func demodriverbtn_click(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: CreateDemoDriverViewController = storyboard.instantiateViewController(withIdentifier: "CreateDemoDriverViewController") as! CreateDemoDriverViewController
        next.modalPresentationStyle = .overCurrentContext
        self.present(next, animated: true, completion: nil)
        
    }
    
    // ************************** Success state ********************************
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {    
        if resultCode == 8032 {
            self.appupdateData = data as! AppUpdateModel
            GlobalVariables.updatechecklater = self.appupdateData.appcheck!
            if(self.appupdateData.appcheck == 1){
                if(self.appupdateData.details?.iosDriverMaintenanceMode == "1"){
                    let alert = UIAlertController(title: "", message: "App is under maintance.".localized, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Exit".localized, style: .default) { _ in
                        exit(0)

                    }
                    alert.addAction(action)
                    self.present(alert, animated: true){}

                } else {
                    // print(appVersion)
                    let message: String = "New Version Available. Please update the app first.".localized
                    let alertController = UIAlertController(
                        title: "UPDATE AVAILABLE ".localized, // This gets overridden below.
                        message: message,
                        preferredStyle: .alert
                    )
                    let okAction = UIAlertAction(title: "Update App".localized, style: .cancel) { _ -> Void in
                        GlobalVariables.rateApp(appId: "id1361918107") { success in }
                        
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                
                }
            }
                
            else if(self.appupdateData.appcheck == 2) {
                if(self.appupdateData.details?.iosDriverMaintenanceMode == "1") {
                    let alert = UIAlertController(title: "", message: "App is under maintance.".localized, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Exit".localized, style: .default) { _ in
                        exit(0)

                    }
                    alert.addAction(action)
                    self.present(alert, animated: true){}
                    
                } else {
                    let refreshAlert = UIAlertController(title: "UPDATE AVAILABLE ".localized, message: "New Version Available. Please update the app.".localized, preferredStyle: UIAlertControllerStyle.alert)
                    refreshAlert.addAction(UIAlertAction(title: "Update App".localized, style: .default, handler: { (action: UIAlertAction!) in
                    GlobalVariables.rateApp(appId: "id1361918107") { success in } }))
                
                refreshAlert.addAction(UIAlertAction(title: "Later".localized, style: .default, handler: { (action: UIAlertAction!) in
                    
                    if(NsUserDefaultManager.SingeltonInstance.isloggedin()){
                        
                        
                        let defaultdetailstatus = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDetailStatus)!
                        
                        
                        if defaultdetailstatus == "1"{
                            
                            APIManager.sharedInstance.delegate = self
                            APIManager.sharedInstance.sendDeviceId()
                            
                            
                            
                            self.container_view.isHidden = false
                            self.Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode(_:)), userInfo: nil, repeats: false)
                            
                        }else if defaultdetailstatus == "3"{
                            
                            APIManager.sharedInstance.delegate = self
                            APIManager.sharedInstance.sendDeviceId()
                            
                            
                            
                            self.container_view.isHidden = false
                            self.Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode(_:)), userInfo: nil, repeats: false)
                            
                        }
                            
                            
                        else{
                            
                            APIManager.sharedInstance.delegate = self
                            APIManager.sharedInstance.sendDeviceId()
                            
                            
                            
                            self.container_view.isHidden = true
                            self.Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode1(_:)), userInfo: nil, repeats: false)
                            
                        }
                        
                    }
                    else{
                        
                        self.container_view.isHidden = false
                        
                        self.Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode(_:)), userInfo: nil, repeats: false)
                        
                    }
                    

                    
                    
                }))
                
                present(refreshAlert, animated: true, completion: nil)
                
                }
            }
                
            else{
                
                
                if(self.appupdateData.details?.iosDriverMaintenanceMode == "1"){
                    
                    
                    let alert = UIAlertController(title: "", message: "App is under maintance.".localized, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Exit".localized, style: .default) { _ in
                        exit(0)
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true){}
                    
                }else{

                    
                if(NsUserDefaultManager.SingeltonInstance.isloggedin()){
                    
                    
                    let defaultdetailstatus = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDetailStatus)!
                    
                    
                    if defaultdetailstatus == "1"{
                        
                        APIManager.sharedInstance.delegate = self
                        APIManager.sharedInstance.sendDeviceId()
                        
                        
                        
                        self.container_view.isHidden = false
                        Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode(_:)), userInfo: nil, repeats: false)
                        
                    }else if defaultdetailstatus == "3"{
                        
                        APIManager.sharedInstance.delegate = self
                        APIManager.sharedInstance.sendDeviceId()
                        
                        
                        
                        self.container_view.isHidden = false
                        Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode(_:)), userInfo: nil, repeats: false)
                        
                    }
                        
                        
                    else{
                        
                        APIManager.sharedInstance.delegate = self
                        APIManager.sharedInstance.sendDeviceId()
                        
                        
                        
                        self.container_view.isHidden = true
                        Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode1(_:)), userInfo: nil, repeats: false)
                        
                    }
                    
                }
                else{
                    
                    self.container_view.isHidden = false
                    
                    Timer  = Foundation.Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(SplashViewController.myPerformeCode(_:)), userInfo: nil, repeats: false)
                    
                }
                    
                }

                
            }
            
        }

        
        
    }


   

}
