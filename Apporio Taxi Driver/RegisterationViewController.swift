//
//  RegisterationViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 06/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import DropDown


class RegisterationViewController: UIViewController,ParsingStates, UIImagePickerControllerDelegate , UINavigationControllerDelegate,MICountryPickerDelegate  {
    
    var username: String = ""
    var email: String = ""
    var mobile: String = ""
    var pwd: String = ""
    var carmodelid: String = ""
    var carnumber: String = ""
    var cartypeid: String = ""
    var cityid: String = ""
    var driverbankname: String = ""
    var driveraccountnumber: String = ""
    var driveraccountname: String = ""
    var data: RegisterDriver!
    var carModelData: CarModel!
    var cartypeData: CarType!
    var cityData: CityTypeModel!
    var cartypeArray = [String]()
    var cityArray = [String]()
    var carModelArray = [String]()
    let dropDown = DropDown()
    let dropDown1 = DropDown()
    let dropDown2 = DropDown()
     let dropDown3 = DropDown()
    
    @IBOutlet weak var enterphonetext: UITextField!
    
    @IBOutlet weak var countrycodetext: UILabel!

    var selcetcountrycode = "+52"

    
  //  @IBOutlet weak var selectcategoryview: UIView!
    
  //  @IBOutlet weak var selectcategorytext: UILabel!
    
    
    @IBOutlet weak var enterbanknametext: UITextField!
    
    @IBOutlet weak var enteraccountnumbertext: UITextField!
    
    @IBOutlet weak var createyouraccounttextlabel: UILabel!
    
    @IBOutlet weak var enteraccountnametext: UITextField!
   
    
    @IBOutlet weak var boundaryview: UIView!
    
  
    @IBOutlet weak var driverimage: UIImageView!
    
    @IBOutlet weak var register_btn: UIButton!
    @IBOutlet weak var carNoField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
   // @IBOutlet weak var mobileField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
   
    @IBOutlet weak var city_view: UIView!
    @IBOutlet weak var carModel_view: UIView!
    @IBOutlet weak var carType_view: UIView!
    
    @IBOutlet weak var citytextlabel: UILabel!
    
    @IBOutlet weak var cartypetextlabel: UILabel!
    
    @IBOutlet weak var carmodeltextlabel: UILabel!
    
  
    @IBOutlet weak var scrollView: UIScrollView!
    
     @IBOutlet var phoneButton: UIButton!
    
    
    
    func setupView(){
        createyouraccounttextlabel.text = "CREATE YOUR ACCOUNT".localized
        usernameField.placeholder = "Enter Name".localized
        emailField.placeholder = "Enter Email".localized
       // mobileField.placeholder = "Enter Mobile".localized
    //    phoneButton.setTitle("Enter Mobile Number".localized, for: UIControlState.normal)
        pwdField.placeholder = "Enter Password".localized
        citytextlabel.text = "Select City".localized
        cartypetextlabel.text = "Select Car Type".localized
        carmodeltextlabel.text = "Select Model".localized
        carNoField.placeholder = "Enter Car Number".localized
       // selectcategorytext.text = "Types of Rides".localized
        enterbanknametext.placeholder = "Enter Bank Name".localized
        enteraccountnumbertext.placeholder = "Enter Account Number".localized
        enteraccountnametext.placeholder = "Enter Account Name".localized
       
        register_btn.setTitle("CONTINUE".localized, for: UIControlState.normal)
        enterphonetext.placeholder = "Enter Phone".localized
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        
         dropDown3.dataSource = ["Normal Rides","Rental Rides","Both Normal & Rental Rides"]
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(RegisterationViewController.imageTapped(_:)))
        driverimage.isUserInteractionEnabled = true
        driverimage.addGestureRecognizer(tapGestureRecognizer)
        
        
        driverimage.layer.cornerRadius = driverimage.frame.width/2
        driverimage.clipsToBounds = true
        
         GlobalVariables.driverprofileimageselect = 0
        
        boundaryview.layer.cornerRadius = 5
        boundaryview.layer.borderWidth = 1.0
        boundaryview.layer.borderColor = UIColor.lightGray.cgColor

        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.viewcityType()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func countryPicker(_ picker: MICountryPicker, didSelectCountryWithName name: String, code: String) {
        
    }
    func countryPicker(_ picker: MICountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String)
    {
        selcetcountrycode = dialCode
        countrycodetext.text = dialCode
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func onPhone(_ sender: Any) {
        
        
      /*  let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let verifyViewController = storyBoard.instantiateViewController(withIdentifier: "VerifyPhoneViewController") as! VerifyPhoneViewController
        verifyViewController.matchString = ""
        self.present(verifyViewController, animated:true, completion:nil)*/
        
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
        
        
        
      
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
             GlobalVariables.driverprofileimageselect = 1
            
            driverimage.image =  self.RBResizeImage(pickedImage, targetSize: CGSize(width: 500,height: 500))
        }
        
        dismiss(animated: true, completion: nil)
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        
        if GlobalVariables.checkphonenumber == 1{
            
            self.phoneButton.setTitle(GlobalVariables.enteruserphonenumber, for: .normal)
            self.phoneButton.setTitleColor(UIColor.black, for: .normal)
            GlobalVariables.checkphonenumber = 0
            
        }else{
            
        }
        
    }

    
    override func viewWillLayoutSubviews() {
        
       
        
        super.viewWillLayoutSubviews()
        self.scrollView.frame = self.scrollView.bounds
        self.scrollView.contentSize.height =  1100
        self.scrollView.contentSize.width = 0
    }
    
    
    @IBAction func backbtn(_ sender: Any) {
        dismissViewcontroller()
    }
    
    @IBAction func select_city_btn(_ sender: Any) {
        
        dropDown2.anchorView = city_view
        dropDown2.topOffset = CGPoint(x:0, y: self.city_view.bounds.height)
        
        self.dropDown2.width = 200
        self.dropDown2.cellHeight = 50
        
         GlobalVariables.cartypeid = ""
        GlobalVariables.carModelid = ""
        cartypetextlabel.text = "Select Car Type".localized
        carmodeltextlabel.text = "Select Model".localized
        
        self.dropDown2.show()
        
        dropDown2.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            
            GlobalVariables.cityid = self.cityData.msg![index].cityId!
            print(GlobalVariables.cityid)
            GlobalVariables.city = self.cityData.msg![index].cityName!
            self.citytextlabel.text = item
            
            if GlobalVariables.cityid != ""{
                
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.viewCarType(cityId: GlobalVariables.cityid)
            }
            
            
            self.dropDown2.hide()
        }
        
        

    }
    
    
    
  /*  @IBAction func Selectcategorybtn_click(_ sender: Any) {
        
        
        dropDown3.anchorView = selectcategoryview
        dropDown3.topOffset = CGPoint(x:0, y: self.selectcategoryview.bounds.height)
        
        self.dropDown3.width = 280
        self.dropDown3.cellHeight = 50
        
        
        self.dropDown3.show()
        
        dropDown3.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            
            GlobalVariables.drivercategoryindex = index + 1
            print(GlobalVariables.drivercategoryindex)
            
            self.selectcategorytext.text = item
            
            
            self.dropDown3.hide()
        }

    }*/
    
    
    
    @IBAction func select_car_type_btn(_ sender: Any) {
        
        if citytextlabel.text == "Select City" {
            let alert = UIAlertController(title: "", message: "Please select city first ".localized, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        else {
            
           
            carmodeltextlabel.text = "Select Model".localized
            GlobalVariables.carModelid = ""
            dropDown.anchorView = carType_view
            dropDown.topOffset = CGPoint(x:0, y: self.carType_view.bounds.height)
            
            self.dropDown.width = 200
            self.dropDown.cellHeight = 50
            
            
            self.dropDown.show()
            
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index)")
                
                GlobalVariables.cartypeid = self.cartypeData.msg![index].carTypeId!
                print(GlobalVariables.cartypeid)
                // GlobalVariables.cityid = self.cartypeData.msg![index].cityId!
                self.cartypetextlabel.text = item
                if GlobalVariables.cartypeid != ""{
                    
                    APIManager.sharedInstance.delegate = self
                    APIManager.sharedInstance.viewCarModels(carTypeid: GlobalVariables.cartypeid)
                }
                self.dropDown.hide()
            }
            
        }

        
        
        
    }

    @IBAction func select_car_model_btn(_ sender: Any) {
        
        if cartypetextlabel.text == "Select Car Type" {
            let alert = UIAlertController(title: "", message: "Please select car type first ".localized, preferredStyle: .alert)
            let action = UIAlertAction(title:  "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        else {
            
            
            dropDown1.anchorView = carModel_view
            dropDown1.topOffset = CGPoint(x:0, y: self.carModel_view.bounds.height)
            
            self.dropDown1.width = 200
            self.dropDown1.cellHeight = 50
            
            
            self.dropDown1.show()
            
            dropDown1.selectionAction = { [unowned self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index)")
                
                GlobalVariables.carModelid = self.carModelData.msg![index].carModelId!
                print(GlobalVariables.carModelid)
                GlobalVariables.carModelName = self.carModelData.msg![index].carModelName!
                self.carmodeltextlabel.text = item
                self.dropDown1.hide()
            }
        }

    }
    
    
    func showAlertMessage(_ title:String,Message:String){
        
        let alert = UIAlertController(title: title, message: Message, preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
            
        }
        alert.addAction(action)
        self.present(alert, animated: true){}
    }
    
    
    
    @IBAction func Register_btn_click(_ sender: Any) {
        
        username = usernameField.text!
        email = emailField.text!
       // mobile = mobileField.text!
        pwd = pwdField.text!
        cityid = GlobalVariables.cityid
        cartypeid = GlobalVariables.cartypeid
        carmodelid = GlobalVariables.carModelid
        carnumber = carNoField.text!
        driverbankname = enterbanknametext.text!
        driveraccountname = enteraccountnametext.text!
        driveraccountnumber = enteraccountnumbertext.text!
        
        if (GlobalVariables.driverprofileimageselect == 0){
            
            self.showAlertMessage("Alert".localized, Message: "Please upload your image".localized)
            
        }
        
        else if (username == ""){
            
            self.showAlertMessage("Alert".localized, Message: "Please enter First Name".localized)
            
        }
        else if (email == ""){
            
            self.showAlertMessage("Alert".localized, Message: "Please enter Email".localized)
            
        }
        else if self.phoneButton.currentTitle == "Enter Phone"{
            
            self.showAlertMessage("Alert".localized, Message: "Please Enter Mobile Number".localized)
            
        }

            
        else if (pwd == ""){
            
            self.showAlertMessage("Alert".localized, Message: "Please enter Password".localized)
            
        }
            
        else  if ( self.cityid == ""){
            
            self.showAlertMessage("Alert".localized, Message: "Please select city first ".localized)
            
        }
        else  if (self.cartypeid  == ""){
            
            self.showAlertMessage("Alert".localized, Message: "Please select car type first ".localized)
            
        }
       else  if (self.carmodelid == ""){
            
            self.showAlertMessage("Alert".localized, Message: "Please select car model first ".localized)
            
        }
        else if (carnumber == ""){
            
            self.showAlertMessage("Alert".localized, Message: "Please enter Vehicle Plate".localized)
            
        }
        else if (driverbankname == ""){
            
            self.showAlertMessage("Alert".localized, Message: "Please enter Bank Name".localized)
            
        }
        
        else if (driveraccountnumber == ""){
            
            self.showAlertMessage("Alert".localized, Message: "Please enter Account Number".localized)
            
        }
        else if (driveraccountname == ""){
            
            self.showAlertMessage("Alert".localized, Message: "Please enter Account Name".localized)
            
        }

        

        
        
      /*  if ((username == "") || (email == "") || (pwd == "") || (self.carmodelid == "") || (carnumber == "") || (self.cartypeid == "") || (self.cityid == "") || (self.driverbankname == "") || (self.driveraccountname == "") || (self.driveraccountnumber == "")) {
            
            let alert = UIAlertController(title:"Registeration Failed!".localized, message:"Fields cannot be blank".localized, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else if self.phoneButton.currentTitle == "Enter Phone"{
            
            let alert = UIAlertController(title: "Registeration Failed!".localized, message:"Please Enter Mobile Number".localized, preferredStyle: .alert)
            let action = UIAlertAction(title:  "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
            
            
        }
            
      /*  else if ((mobile.characters.count < 10) || (mobile.characters.count > 10 ))
        {
            let alert = UIAlertController(title: "Registeration Failed!".localized, message:"Mobile number must be 10  digits".localized, preferredStyle: .alert)
            let action = UIAlertAction(title:  "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }*/
            
        else if (carmodeltextlabel.text == "Select Car Model")
        {
            let alert = UIAlertController(title: "Registeration Failed!".localized, message:"Please Select Model ".localized, preferredStyle: .alert)
            let action = UIAlertAction(title:  "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else if (cartypetextlabel.text == "Select Car Type")
        {
            let alert = UIAlertController(title: "", message:"Please Select CarType ".localized, preferredStyle: .alert)
            let action = UIAlertAction(title:  "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }*/
            
            
            
            
        else if (!email.contains("@"))
        {
            let alert = UIAlertController(title: "Registeration Failed!".localized, message:" Wrong Email format ".localized, preferredStyle: .alert)
            let action = UIAlertAction(title:  "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else if (email.contains(" "))
        {
            let alert = UIAlertController(title: "", message:" Email id must not contain space ".localized, preferredStyle: .alert)
            let action = UIAlertAction(title:  "OK".localized, style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else
        {
            
            
            
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.registerDriver(email: email, phone: GlobalVariables.enteruserphonenumber, pass: pwd, name: username, cartype_id: cartypeid, carmodelId: carmodelid, carnumber: carnumber, cityid: cityid,DriverCategory: String(GlobalVariables.drivercategoryindex),DriverBankName: driverbankname,DriverAccountNumber: driveraccountnumber,DriverAccountName: driveraccountname, driverimage: self.driverimage.image!)
                
        }

    }
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if resultCode == 33 {
            
            
            self.data = data as! RegisterDriver
            if(self.data.result == 1){
                
                
                NsUserDefaultManager.SingeltonInstance.registerDriver(insurance: (self.data.details?.insurance!)!, rc: (self.data.details?.rc!)!, licence: (self.data.details?.license!)!, did: (self.data.details?.deviceId!)!, carModelId: (self.data.details?.carModelId!)!, otherDoc: (self.data.details?.otherDocs!)!, driverId: (self.data.details?.driverId!)!, driverImg: (self.data.details?.driverImage!)!, driverEmail: (self.data.details?.driverEmail!)!, driverName: (self.data.details?.driverName!)!, flag: (self.data.details?.flag!)!, long: (self.data.details?.currentLong!)!, cityid: (self.data.details?.cityId!)!, carNo: (self.data.details?.carNumber!)!, password: (self.data.details?.driverPassword!)!, lat: (self.data.details?.currentLat!)!, phoneNo: (self.data.details?.driverPhone!)!, carType: (self.data.details?.carTypeId!)!, onOff: (self.data.details?.onlineOffline!)!, status: (self.data.details?.driverAdminStatus!)!, loginLogout: (self.data.details?.loginLogout!)!,driverToken: (self.data.details?.driverToken!)!,detailStatus : (self.data.details?.detailStatus)!,carmodelname : (self.data.details?.carModelName!)! , cartypename : (self.data.details?.carTypeName!)!,cityname : (self.data.details?.cityName!)!,Driverstatusimage: (self.data.details?.driverStatusImage)!,Driverstatusmessage: (self.data.details?.driverStatusMessage)!,DriverBankName: (self.data.details?.driverBankName!)!,DriverAccountName: (self.data.details?.driverAccountName!)!,DriverAccountNumber: (self.data.details?.driverAccountNumber!)!)
                
                
              /*  let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: UploadDocumentViewController = storyboard.instantiateViewController(withIdentifier: "UploadDocumentViewController") as! UploadDocumentViewController
                self.present(next, animated: true, completion: nil)*/
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: DocumentStatusViewController = storyboard.instantiateViewController(withIdentifier: "DocumentStatusViewController") as! DocumentStatusViewController
                self.present(next, animated: true, completion: nil)
                
            }else{
                
                let alert = UIAlertController(title: self.data.msg!, message: self.data.msg!, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                    
                }
                alert.addAction(action)
                self.present(alert, animated: true){}
                
            }
            
            
        }
        
        if resultCode == 22 {
            
            self.cartypeData = data as! CarType
            if self.cartypeData.result == 1 {
                
                cartypeArray.removeAll()
                
                for items in  self.cartypeData.msg!
                {
                    
                    if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "en"){
                        
                        cartypeArray.append(items.carTypeName!)
                    }else{
                        cartypeArray.append(items.carTypeName!)
                    }
                    
                                    
                    dropDown.dataSource = cartypeArray
                    
                }
            }else{
                cartypeArray.removeAll()
                
                dropDown.dataSource = cartypeArray
            }

        }
        
        
        if resultCode == 11 {
            
            self.carModelData = data as! CarModel
            if self.carModelData.result == 1 {
                
                carModelArray.removeAll()
                
                for items in  self.carModelData.msg!
                {
                    
                    if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "en"){
                        
                        carModelArray.append(items.carModelName!)
                    }else{
                        carModelArray.append(items.carModelName!)
                        
                    }
                    
                    
                    dropDown1.dataSource = carModelArray
                    
                }
            }else{
             carModelArray.removeAll()
                
                 dropDown1.dataSource = carModelArray
            }
        }
        
        
        if resultCode == 1003 {
            
            self.cityData = data as! CityTypeModel
            
            if self.cityData.result == 1 {
                
                cityArray.removeAll()
                
                for items in  self.cityData.msg!
                {
                    
                    if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "en"){
                        
                        cityArray.append(items.cityName!)
                    }else{
                        cityArray.append(items.cityName!)
                    }
                    
                    
                    //  cityArray.append(items.cityName!)
                    //selectcity_field.text = items.cityName
                    
                    print(cityArray)
                    
                    dropDown2.dataSource = cityArray
                    
                }
            }else{
                cityArray.removeAll()
                
                 dropDown2.dataSource = cityArray
            }
        }
        
        
        
        
        
    }
    
    // ********************* Textfield delegate ***************************
    
    
    override func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    

    
    
}


extension RegisterationViewController
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

