//
//  File.swift
//  TaxiAppDriver
//
//  Created by Rakesh kumar on 22/08/16.
//  Copyright © 2016 Apporio. All rights reserved.
//


struct GlobalVariables {
    
    static var lat: Double = 0.0
    static var long: Double = 0.0
    static var driverLocation = ""
    
    static var city = "Dummy City"
    static var carModelName = ""
    
    static var carbonkitvalue: Int = 0
    
    static var appversion: String = ""
    
    static var updatechecklater: Int = 0
    
    static var tempValue: String = ""
    
    static var rideid: String = ""
    static var driverid: String = ""
    
    static var custId: String = ""
    
    
    static var driverfinishlat: String = ""
    
    static var driverfinishlong: String = ""
    
    
    
    static var arrived_sec: Int = 0
    
    static var finalRating: String = ""
    
    static var cartypeid: String = ""
    static var cityid: String = ""
    static var carModelid: String = ""
    static var pickupLat: String = ""
    static var dropLat: String = ""
    static var pickupLong: String = ""
    static var dropLong: String = ""
    static var pickupLoc: String = ""
    static var dropLocation: String = ""
    
    static var dropLatforPath: String = ""
    static var dropLongforPath: String = ""
    
    static var ride_status: String = ""
    
    static var deviceid: String = ""
    
    static var totalamount: String = ""
    static var totaldistance: String = ""
    static var totaltime: String = ""
    static var i: Int = 0
    
    static var license: UIImage = UIImage()
    static var registration: UIImage = UIImage()
    static var otherDocument: UIImage = UIImage()
    static var insurance: UIImage = UIImage()
    
    static var matchString: String = "mylocation"
    static var contactTelephone: String = ""
    static var cancelbtnvaluematch: String = ""
      static var cancelId: String = ""
    static var ridecurrentstatus: String = ""
    
    static var emergencylatitude: String = ""
    static var emergencylongitude: String = ""
    
    static var checkbackstatusfromfullride: Int = 0
    
    static var trackbackbtnvaluematch: Int = 0
    
     static var languageid: Int = 1
    
    static var languagecode: String = ""
    
    static var insurancdocumentdate: String = "Expiry Date"
    
      static var licensedocumentdate: String = "Expiry Date"
    
      static var rcdocumentdate: String = "Expiry Date"
    
    static var documentdateselected: String = "DD MM YYYY"
    
     static var dynamicdocumentimage: UIImage = UIImage()
    
    static var movefromcalender: Int = 0
    
     static var movefromdemodriver: String = ""
    
     static var locationdidactive: Int = 0
    
    static  var timerForGetDriverLocation5 = Timer()
    
    static var firebasedriverride: Int = 0
    
    static var selecteddocumentId: String = ""
    
    static var checkphonenumber: Int = 0
    
    static var driverprofileimageselect: Int = 0
    
    static var enteruserphonenumber: String = ""
    
    static var checknostatus: Int = 0
    
     static var drivercategoryindex = 3
    
    static var currencysymbol: String = ""
    
    static var languagecodeselectinmenu: Int = 0
    
    static var chatvalue: Int = 0
    
    static var  googlemapkeys = "AIzaSyDcerhRQNc1zh9mWHX8S2kznEj8kfBO7kM"
    
   // static var DriverBaseUrl: String = "http://apporioinfolabs.com/apporiotaxi/api/"
   // static var DriverImageBaseUrl: String = "http://apporioinfolabs.com/apporiotaxi/"
    
  //  static var DriverBaseUrl: String = "http://apporioinfolabs.com/apporiotaxi/api/"
  //  static var DriverImageBaseUrl: String = "http://apporioinfolabs.com/apporiotaxi/"
    
   // "http://www.apporiotaxi.com/api/"
  
    
    static var DriverBaseUrl: String = "http://www.car-flash.mx/api/"
    static var DriverImageBaseUrl: String = "http://www.car-flash.mx/"

 static var notificationvalue = 0
    
    static var donerideid: String = ""
    
    static var checkcurrentstatusvalue: Int = 0
    
    static var trackusername: String = ""
    static var trackusermobile: String = ""
    static var trackdroplocation: String = ""
    static var trackridestatus: String = ""
    
    static var radiansBearing : Double = 0.0
    
    static var checkvaluedriverpressonoffbtn: Int = 0
    
    static var meterimage: UIImage = UIImage()
    
    static var meterreadingvalue: String = ""
    
    static var checkbeginendbtnclick: String = ""
    
    
    static  func rateApp(appId: String, completion: @escaping ((_ success: Bool)->())) {
        guard let url = URL(string : "itms-apps://itunes.apple.com/app/" + appId) else {
            completion(false)
            return
        }
        guard #available(iOS 10, *) else {
            print(url)
            completion(UIApplication.shared.openURL(url))
            return
        }
        print(url)
        UIApplication.shared.open(url, options: [:]
            , completionHandler: completion)
    }
    

        
}
