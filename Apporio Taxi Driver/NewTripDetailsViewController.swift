//
//  NewTripDetailsViewController.swift
//  Apporio Taxi Driver
//
//  Created by Atul Jain on 20/12/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Firebase

class NewTripDetailsViewController: UIViewController,ParsingStates {
    
    var ridelateracceptdata: RideLaterAcceptModel!
    
    var checkridetimedata: CheckRideTimeModel!
    
     var rentalrideacceptdata: RentalRideAcceptModel!
    
    var acceptdata: RideAccept!
    
    var ref = Database.database().reference()
    
    var ref1 = Database.database().reference()
    
    var drivertoken = ""
    
    @IBOutlet weak var showchekridetimetext: UILabel!
    @IBOutlet weak var hiddentextview: UIView!
    
    @IBOutlet weak var acceptbtnview: UIView!
    @IBOutlet weak var scheduledatetext: UILabel!
    @IBOutlet weak var bookingdatetext: UILabel!
    @IBOutlet weak var bookingdatetextlbl: UILabel!
    
    @IBOutlet weak var scheduledatetextlbl: UILabel!
    @IBOutlet weak var bookingdetailstextlbl: UILabel!
    @IBOutlet weak var topnewtripdetailstextlbl: UILabel!
    
    @IBOutlet weak var dropofftextlbl: UILabel!
    
    @IBOutlet weak var dropofflocationtext: UILabel!
    @IBOutlet weak var pickuplocationtext: UILabel!
    @IBOutlet weak var pickuptextlbl: UILabel!
    @IBOutlet weak var tripdetailstextlbl: UILabel!
   // @IBOutlet weak var rejectbtntext: UIButton!
    
    @IBOutlet weak var acceptbtntext: UIButton!
    
    
    var userpickup = ""
    var userdropoff = ""
    var userbookingdate = ""
    var userscheduledate = ""
    var rideid = ""
    var ridemode = ""
    var ridestaus = ""
    
    var defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
    
    var driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drivertoken =  NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
          GlobalVariables.cancelbtnvaluematch = "2"
        
        topnewtripdetailstextlbl.text = "New Trip Detail".localized
        tripdetailstextlbl.text = "Trip Detail".localized
        bookingdetailstextlbl.text = "Booking Details".localized
        bookingdatetextlbl.text = "Booking Date :".localized
        scheduledatetextlbl.text = "Scheduled Date :".localized
        pickuptextlbl.text = "Pick From".localized
        dropofftextlbl.text = "Drop Off".localized
        acceptbtntext.setTitle("Accept".localized, for: UIControlState.normal)
        //rejectbtntext.setTitle("REJECT".localized, for: UIControlState.normal)
        
        pickuplocationtext.text = userpickup
        dropofflocationtext.text = userdropoff
        bookingdatetext.text = userbookingdate
        scheduledatetext.text = userscheduledate
        
        if(ridestaus == "22"){
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.CheckRideTime(Rideid: rideid, RideMode: ridemode)
          
        }else{
            
            acceptbtnview.isHidden = false
            hiddentextview.isHidden = true

        
        
        }
        
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backbtn(_ sender: Any) {
        
        self.dismissViewcontroller()
        
    }
    
  /*  @IBAction func rejectbtnclick(_ sender: Any) {
    }*/
    
    
    func showalert(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title: "Alert".localized, message:message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: "OK".localized, style: .default) { (action) in
                
                let Message1: NSDictionary = ["ride_id": "No Ride","ride_status": "No Ride Status"]
                
                self.ref1.child("Activeride").child(GlobalVariables.driverid).setValue(Message1)
                
                
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                
                if let window = self.view.window{
                    window.rootViewController = nextController
                }
                
                
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true) {
                
            }
            
            
        })
        
    }

    
    @IBAction func acceptbtnclick(_ sender: Any) {
        
         if(ridestaus == "22"){
            
            if(ridemode == "2"){
                
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.RentalRideAccept(RentalBookindId: rideid, DriverId: self.driverid, DriverToken: self.drivertoken)
            
            }else if(ridemode == "1"){
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.acceptRide(rideid: rideid, driverid: self.driverid)
            
            }
            
           
            
            
         }else{
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.RideLaterAcceptRide(RideId: rideid, RideMode: ridemode, DriverId: driverid, DriverToken: defaultdrivertoken)
        
        }
        
    }
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if resultCode == 8031 {
            
            ridelateracceptdata = data as! RideLaterAcceptModel
            
            if(ridelateracceptdata.result == 1){
                
                let alert = UIAlertController(title: "", message: self.ridelateracceptdata.msg!, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                    GlobalVariables.carbonkitvalue = 1
                     self.dismissViewcontroller()
                }
                alert.addAction(action)
                self.present(alert, animated: true){}
                

            
            
            }else{
                
                let alert = UIAlertController(title: "", message: self.ridelateracceptdata.msg!, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                    
                }
                alert.addAction(action)
                self.present(alert, animated: true){}
                
            }


            
            
        }
        
         if resultCode == 8033 {
            
            checkridetimedata = data as! CheckRideTimeModel
            
            if(checkridetimedata.result == 0){
                
                acceptbtnview.isHidden = true
                hiddentextview.isHidden = false
                showchekridetimetext.text = checkridetimedata.msg
            
            
            }else{
                
                acceptbtnview.isHidden = false
                 acceptbtntext.setTitle("Start For Customer Pick Up".localized, for: UIControlState.normal)
                hiddentextview.isHidden = true
                
            }
            
            
        }
        
        
        if (resultCode == 165){
            self.acceptdata = data as! RideAccept
            if(self.acceptdata.result == 1){
                
                
                GlobalVariables.driverid = (self.acceptdata.details?.driverId)!
                GlobalVariables.rideid = (self.acceptdata.details?.rideId)!
                GlobalVariables.pickupLoc = (self.acceptdata.details?.pickupLocation)!
                GlobalVariables.custId = (self.acceptdata.details?.userId)!
                GlobalVariables.pickupLat = (self.acceptdata.details?.pickupLat)!
                GlobalVariables.pickupLong = (self.acceptdata.details?.pickupLong)!
                GlobalVariables.trackusername = (self.acceptdata.details?.userName)!
                GlobalVariables.trackusermobile = (self.acceptdata.details?.userPhone)!
                GlobalVariables.trackdroplocation = (self.acceptdata.details?.dropLocation)!
                GlobalVariables.trackridestatus = (self.acceptdata.details?.rideStatus)!
                GlobalVariables.dropLat = (self.acceptdata.details?.dropLat)!
                GlobalVariables.dropLong = (self.acceptdata.details?.dropLong)!
                GlobalVariables.dropLocation = (self.acceptdata.details?.dropLocation)!
                
                
                let Message1: NSDictionary = ["ride_id": "No Ride","ride_status": "No Ride Status"]
                
                self.ref1.child("Activeride").child(GlobalVariables.driverid).setValue(Message1)
                
                
                let Message: NSDictionary = ["changed_destination": "0",
                                             "ride_id": GlobalVariables.rideid,"ride_status": "3","done_ride_id": ""]
                
                self.ref.child("RideTable").child(GlobalVariables.rideid).setValue(Message)
                
              NsUserDefaultManager.SingeltonInstance.RideAccept(DriverId: (self.acceptdata.details?.driverId)!, RideId: (self.acceptdata.details?.rideId)!, PickUpLoc: (self.acceptdata.details?.pickupLocation)!, CustId: (self.acceptdata.details?.userId)!, PickUpLat: (self.acceptdata.details?.pickupLat)!, PickUpLong: (self.acceptdata.details?.pickupLong)!, TrackUserName: (self.acceptdata.details?.userName)!, TrackUserMobile: (self.acceptdata.details?.userPhone)!, TrackDropLocation: (self.acceptdata.details?.dropLocation)!, TrackRideStatus: (self.acceptdata.details?.rideStatus)!, DropLat: (self.acceptdata.details?.dropLat)!, DropLong: (self.acceptdata.details?.dropLong)!, DropLocation: (self.acceptdata.details?.dropLocation)!)
                
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: TrackRideViewController = storyboard.instantiateViewController(withIdentifier: "TrackRideViewController") as! TrackRideViewController
                next.acceptdataresponse = self.acceptdata
                
                self.present(next, animated: true, completion: nil)
                
            }else{
                
                self.showalert(message: self.acceptdata.msg!)
            }
        }
        
        
        if (resultCode == 8008){
            
            
            
            self.rentalrideacceptdata = data as! RentalRideAcceptModel
            if(self.rentalrideacceptdata.status == 1){
                
                
                GlobalVariables.driverid = (self.rentalrideacceptdata.details?.driverId)!
                GlobalVariables.rideid = (self.rentalrideacceptdata.details?.rentalBookingId)!
                GlobalVariables.pickupLoc = (self.rentalrideacceptdata.details?.pickupLocation)!
                GlobalVariables.custId = (self.rentalrideacceptdata.details?.userId)!
                GlobalVariables.pickupLat = (self.rentalrideacceptdata.details?.pickupLat)!
                GlobalVariables.pickupLong = (self.rentalrideacceptdata.details?.pickupLong)!
                GlobalVariables.trackusername = (self.rentalrideacceptdata.details?.userName)!
                GlobalVariables.trackusermobile = (self.rentalrideacceptdata.details?.userPhone)!
                
                GlobalVariables.trackridestatus = (self.rentalrideacceptdata.details?.bookingStatus)!
                
                
                let Message1: NSDictionary = ["ride_id": "No Ride","ride_status": "No Ride Status"]
                
                self.ref1.child("Activeride").child(GlobalVariables.driverid).setValue(Message1)
                
                
                
                
                let Message: NSDictionary = ["changed_destination": "0","ride_id": GlobalVariables.rideid,"ride_status": "11","done_ride_id": ""]
                
                self.ref.child("RideTable").child(GlobalVariables.rideid).setValue(Message)
                
                             
                NsUserDefaultManager.SingeltonInstance.RentalRideAccept(DriverId: (self.rentalrideacceptdata.details?.driverId)!, RideId: (self.rentalrideacceptdata.details?.rentalBookingId)!, PickUpLoc: (self.rentalrideacceptdata.details?.pickupLocation)!, CustId: (self.rentalrideacceptdata.details?.userId)!, PickUpLat: (self.rentalrideacceptdata.details?.pickupLat)!, PickUpLong: (self.rentalrideacceptdata.details?.pickupLong)!, TrackUserName: (self.rentalrideacceptdata.details?.userName)!, TrackUserMobile: (self.rentalrideacceptdata.details?.userPhone)!, TrackRideStatus: (self.rentalrideacceptdata.details?.bookingStatus)!
                )
                
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: RentalTrackRideViewController = storyboard.instantiateViewController(withIdentifier: "RentalTrackRideViewController") as! RentalTrackRideViewController
                next.acceptdataresponse = self.rentalrideacceptdata
                
                self.present(next, animated: true, completion: nil)
                
            }else{
                
                self.showalert(message: self.rentalrideacceptdata.message!)
            }
            
            
            
        }


        
    }
    
    

}
