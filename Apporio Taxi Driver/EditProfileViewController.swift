//
//  EditProfileViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 07/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Firebase


class EditProfileViewController: UIViewController, ParsingStates , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
      var data1: LogOut!
    
    var driverid: String = ""
    var OnOffData: OnLineOffline!
    
    
    var ref = Database.database().reference()
    
   
    
    var defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
    
    
    
    var onoffstatus = "2"

    
    var mobileNo: String = ""
    var password: String = ""
    var name: String = ""
    var bankname: String = ""
    var accountname: String = ""
    var accountnumber: String = ""
    let imageUrl = API_URLs.imagedomain
    var data: RegisterDriver!
    var defaultdriverid = ""
    var defaultdrivername = ""
    var defaultdriverphone = ""
    var defaultdriveremail = ""
    var defaultdriverPassword = ""
    var defaultdriverbankname = ""
    var defaultdriveraccountname = ""
    var defaultdriveraccountnumber = ""
    

    
    
    @IBOutlet var lblYourAccount: UILabel!
    @IBOutlet var btnDone: UIButton!
    @IBOutlet var lblEmailId: UILabel!
    @IBOutlet var lblPassword: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblMobileNumber: UILabel!

    
   // @IBOutlet weak var logoutbtntextlabel: UIButton!
    
    var driverdeviceid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDeviceId)!
    
    var driverimage = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverImage)!
    
    
    var driverflag = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyFlag)!
    
    var drivercartypename = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarName)!
    
    var drivercarmodelname = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarModelName)!
    
    var drivercarno = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarNo)!
    
    var drivercityid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCityId)!
    
    var drivermodelid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarModelid)!
    
    
    var loginlogoutstatus = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyLoginLogout)!
    
    
    var cartypeid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarType)!
   
    @IBOutlet weak var driverProfileImage: UIImageView!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var mobileTf: UITextField!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    
    
    @IBOutlet weak var accountnumbertextlabel: UILabel!
    @IBOutlet weak var accountnametextlabel: UILabel!
    @IBOutlet weak var scrollview: UIScrollView!
    
    
    @IBOutlet weak var banknametextlabel: UILabel!
    @IBOutlet weak var banknameTf: UITextField!
    
    @IBOutlet weak var accountnumberTf: UITextField!
    
    @IBOutlet weak var accountnameTf: UITextField!
    
    func viewSetup(){
        
      //  logoutbtntextlabel.setTitle("LOG OUT".localized, for: UIControlState.normal)
        lblYourAccount.text = "Your Account".localized
        lblEmailId.text = "EMAIL ID".localized
        lblName.text = "NAME".localized
        lblMobileNumber.text = "MOBILE NUMBER".localized
        btnDone.setTitle("DONE".localized, for: UIControlState.normal)
        lblPassword.text = "PASSWORD".localized
        accountnumbertextlabel.text = "ACCOUNT NUMBER".localized
        accountnametextlabel.text = "ACCOUNT NAME".localized
        banknametextlabel.text = "BANK NAME".localized
        
        
        
    }

    


    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewSetup()
        defaultdriverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
        defaultdrivername = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDrivername)!
        defaultdriverphone = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyPhoneno)!
        defaultdriveremail = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverEmail)!
        defaultdriverPassword =  NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyPassword)!
        defaultdriverbankname = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.keydriverbankname)!
        defaultdriveraccountname = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.keydriversaccountname)!
        defaultdriveraccountnumber = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.keydriveraccountnumber)!
        
        emailTf.text = defaultdriveremail
        mobileTf.text = defaultdriverphone
        nameTf.text = defaultdrivername
        passwordTf.text = defaultdriverPassword
        banknameTf.text = defaultdriverbankname
        accountnameTf.text = defaultdriveraccountname
        accountnumberTf.text = defaultdriveraccountnumber

        
       
        let image = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverImage)!
        let newUrl = imageUrl + image
        let url = URL(string: newUrl)
        driverProfileImage.af_setImage(withURL:
            url! as URL,
                                       placeholderImage: UIImage(named: "dress"),
                                       filter: nil,
                                       imageTransition: .crossDissolve(1.0))
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(EditProfileViewController.imageTapped(_:)))
        driverProfileImage.isUserInteractionEnabled = true
        driverProfileImage.addGestureRecognizer(tapGestureRecognizer)
        
        driverProfileImage.layer.cornerRadius =  driverProfileImage.frame.width/2
        driverProfileImage.clipsToBounds = true
        driverProfileImage.layer.borderWidth = 1
        driverProfileImage.layer.borderColor = UIColor.black.cgColor

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if GlobalVariables.checkphonenumber == 1{
            
            mobileTf.text! = GlobalVariables.enteruserphonenumber
                     
            GlobalVariables.checkphonenumber = 0
            
        }else{
            
        }
        
    }
    
    
    
    @IBAction func phoneeditbtn_click(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let verifyViewController = storyBoard.instantiateViewController(withIdentifier: "VerifyPhoneViewController") as! VerifyPhoneViewController
        verifyViewController.matchString = ""
        self.present(verifyViewController, animated:true, completion:nil)
        

        
    }
    
    
    override func viewWillLayoutSubviews() {
        
        
        
        super.viewWillLayoutSubviews()
        self.scrollview.frame = self.scrollview.bounds
        self.scrollview.contentSize.height = 800
        self.scrollview.contentSize.width = 0
    }
    
    
    
    @IBAction func change_password_btn(_ sender: Any) {
        
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: ChangePasswordViewController = storyboard.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
        self.present(next, animated: true, completion: nil)

    }
    
    
    
    func imageTapped(_ img: AnyObject)
    {
        
        let alertView = UIAlertController(title: "Select Option".localized, message: "", preferredStyle: .alert)
        let Camerabutton = UIAlertAction(title: "Camera".localized, style: .default, handler: { (alert) in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }

            
            
            
        })
        let Gallerybutton = UIAlertAction(title: "Gallery".localized, style: .default, handler: { (alert) in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
                print("Button capture")
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
                imagePicker.allowsEditing = false
                
                self.present(imagePicker, animated: true, completion: nil)
            }

        })
        let cancelAction = UIAlertAction(title: "Cancel".localized,
                                         style: .cancel, handler: nil)
        alertView.addAction(Camerabutton)
        alertView.addAction(Gallerybutton)
        alertView.addAction(cancelAction)
        self.present(alertView, animated: true, completion: nil)
        
        
        
       /* let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)*/
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            driverProfileImage.image = self.RBResizeImage(pickedImage, targetSize: CGSize(width: 500,height: 500))
        }
        
        dismiss(animated: true, completion: nil)
    }
    

    
    @IBAction func backbtn(_ sender: Any) {
        dismissViewcontroller()
    }

    @IBAction func Donebtn(_ sender: Any) {
        
        
        name = nameTf.text!
        mobileNo = mobileTf.text!
        password = passwordTf.text!
        bankname = banknameTf.text!
        accountname = accountnameTf.text!
        accountnumber = accountnumberTf.text!
        
       /* if ((mobileNo.characters.count < 10) || (mobileNo.characters.count > 10 )) {
            
            let alert = UIAlertController(title: "Edit Failed!".localized, message:"Mobile No. must be of 10 characters ".localized, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
            
        else
        {*/
            let parameters = [
                "driver_id": defaultdriverid,
                "driver_name": name,
                "driver_phone": mobileNo,
                "driver_token=": defaultdrivertoken,
                "driver_bank_name":bankname,
                "driver_account_name":accountname,
                "driver_account_number":accountnumber,
                "language_code":GlobalVariables.languagecode
                
            ]
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.uploadRequest(parameters: parameters, driverImage: self.driverProfileImage.image!)
      //  }

    }
    
   /* @IBAction func LogOutbtn(_ sender: Any) {
        
        
        let refreshAlert = UIAlertController(title:  "LOG OUT".localized, message: "Are You Sure to Log Out ?".localized, preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Confirm".localized , style: .default, handler: { (action: UIAlertAction!) in
            
            APIManager.sharedInstance.goOnline(driverid: self.defaultdriverid, onlineOffline: "2",driverToken: self.defaultdrivertoken)
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.logOut(driverid: self.defaultdriverid)
            
        }))
        
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel".localized, style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
       
    }*/
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
         if resultCode == 55{
        
        self.data = data as! RegisterDriver
        
        print(" Result is: \(self.data.result!)")
        if ( self.data.result == 1){
            
            
            NsUserDefaultManager.SingeltonInstance.registerDriver(insurance: (self.data.details?.insurance!)!, rc: (self.data.details?.rc!)!, licence: (self.data.details?.license!)!, did: (self.data.details?.deviceId!)!, carModelId: (self.data.details?.carModelId!)!, otherDoc: (self.data.details?.otherDocs!)!, driverId: (self.data.details?.driverId!)!, driverImg: (self.data.details?.driverImage!)!, driverEmail: (self.data.details?.driverEmail!)!, driverName: (self.data.details?.driverName!)!, flag: (self.data.details?.flag!)!, long: (self.data.details?.currentLong!)!, cityid: (self.data.details?.cityId!)!, carNo: (self.data.details?.carNumber!)!, password: (self.data.details?.driverPassword!)!, lat: (self.data.details?.currentLat!)!, phoneNo: (self.data.details?.driverPhone!)!, carType: (self.data.details?.carTypeId!)!, onOff: (self.data.details?.onlineOffline!)!, status: (self.data.details?.driverAdminStatus!)!, loginLogout: (self.data.details?.loginLogout!)!,driverToken: (self.data.details?.driverToken!)!,detailStatus : (self.data.details?.detailStatus)!,carmodelname : (self.data.details?.carModelName!)! , cartypename : (self.data.details?.carTypeName!)!,cityname : (self.data.details?.cityName!)!,Driverstatusimage: (self.data.details?.driverStatusImage)!,Driverstatusmessage: (self.data.details?.driverStatusMessage)!,DriverBankName: (self.data.details?.driverBankName!)!,DriverAccountName: (self.data.details?.driverAccountName!)!,DriverAccountNumber: (self.data.details?.driverAccountNumber!)!)
            
            
            let alert = UIAlertController(title: "Profile Updated".localized, message:"", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                
                if let window = self.view.window{
                    window.rootViewController = nextController
                }
              /* let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                self.present(next, animated: true, completion: nil)*/
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else{
            
            let alert = UIAlertController(title: "Unable to edit!".localized, message:" Email Already Exsist or Field is Incorrect".localized, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        
    }
    
        if resultCode == 187{
            
            self.data1 = data as! LogOut
            
            
            if(self.data1.result == 419){
                
                NsUserDefaultManager.SingeltonInstance.logOut()
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
                
                
            }else if(self.data1.result == 1){
                
                
                 UserDefaults.standard.setValue("2", forKey:"onoffline_status")
                
                let Message: NSDictionary = ["driver_id": self.defaultdriverid , "driver_name": self.defaultdrivername , "driver_phone": self.defaultdriverphone , "driver_email": self.defaultdriveremail , "driver_image": self.driverimage , "driver_password": self.defaultdriverPassword , "driver_token": self.defaultdrivertoken , "driver_device_id": self.driverdeviceid , "driver_flag": self.driverflag,"driver_rating": "" ,"driver_car_type_id": self.cartypeid ,"driver_model_id": self.drivermodelid ,"driver_number": self.drivercarno , "driver_city_id": self.drivercityid ,"driver_registration_date": "" ,"driver_lisence": "" ,"driver_rc": "" ,"driver_insurence": "" ,"driver_other_doc": "" ,"driver_last_update": "" ,"driver_last_update_date": "" ,"driver_completed_rides": "" ,"driver_rejected_rides": "" ,"driver_cancelled_rides": "" ,"driver_login_logout": "2" ,"driver_busy_status": "" ,"driver_online_offline_status": self.onoffstatus ,"driver_detail_status": "" ,"driver_admin_status": "" ,"driver_car_type_name": self.drivercartypename ,"driver_car_model_name": self.drivercarmodelname ,"driver_current_latitude": Lat ,"driver_current_longitude": Lng ,"driver_location_text": GlobalVariables.driverLocation ,"timestamp": "","bearingfactor": "0.0"]
                
                self.ref.child("Drivers_A").child(self.defaultdriverid).setValue(Message)
                
                
                NsUserDefaultManager.SingeltonInstance.logOut()
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
            }
        }
        
        if resultCode == 88 {
            self.OnOffData = data as! OnLineOffline
        }
        

        
        
        
    }

    
   
}


extension EditProfileViewController
{
    
    
    func RBResizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let heightInPoints = newImage?.size.height
        let heightInPixels = heightInPoints! * (newImage?.scale)!
        print(heightInPixels)
        
        let widthInPoints = newImage?.size.width
        let widthInPixels = widthInPoints! * (newImage?.scale)!
        print(widthInPixels)
        
        
        return newImage!
    }
}

