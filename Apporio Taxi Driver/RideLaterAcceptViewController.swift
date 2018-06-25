//
//  RideLaterAcceptViewController.swift
//  Apporio Taxi Driver
//
//  Created by Atul Jain on 02/01/18.
//  Copyright © 2018 apporio. All rights reserved.
//

import UIKit

class RideLaterAcceptViewController: UIViewController, ParsingStates {
    
    
    @IBOutlet weak var cancelbtnview: UIView!
    
    var ridelateracceptdata: RideLaterAcceptModel!

    
   // var rejectdata: RideReject!
   // var acceptdata: RideAccept!
    var count = 0
    //var driverid = ""
    var ridedata: ViewRide!
    var helloWorldTimer: Timer = Timer()
    var helloWorldTimer1: Timer = Timer()
    var player : AVAudioPlayer?
    
    var defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
    
    var driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
    
    //@IBOutlet weak var paymentmethodtext: UILabel!
    
    @IBOutlet weak var passtextlabel: UILabel!
    
    
    @IBOutlet weak var acceptridetextlabel: UILabel!
    
    
    @IBOutlet weak var scheduledate: UILabel!
    
    
    @IBOutlet weak var bookingdate: UILabel!
    //  @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dropAddress: UILabel!
    @IBOutlet weak var pickupAddress: UILabel!
    @IBOutlet weak var timeCircle: CircleTimer!
    
    @IBOutlet weak var mapimagecircle: UIImageView!

     var value = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        acceptridetextlabel.text = "ACCEPT RIDE".localized
        passtextlabel.text = "Pass".localized
        
        
        //GlobalVariables.firebasedriverride = 1
        
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.viewRideInfo(rideid: GlobalVariables.rideid)
        
        
        driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
        
        GlobalVariables.timerForGetDriverLocation5.invalidate()
        
        cancelbtnview.layer.borderWidth = 1.0
        cancelbtnview.layer.cornerRadius = 5


        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let url = Bundle.main.url(forResource: "notification_tone", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
        }
        catch let error as NSError {
            print(error.description)
        }
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func sayHello()
    {
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.rejectRide(rideid: GlobalVariables.rideid, driverid: driverid)
        self.helloWorldTimer.invalidate()
        self.helloWorldTimer1.invalidate()
        self.timeCircle.stop()
        player?.stop()
        self.timeCircle.isActive = false
    }
    
    
    func sayHello1()
    {
        
        let url = Bundle.main.url(forResource: "notification_tone", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
        }
        catch let error as NSError {
            print(error.description)
        }
        
        
    }
    
    @IBAction func reject_btn_click(_ sender: Any) {
        
        self.helloWorldTimer.invalidate()
        self.helloWorldTimer1.invalidate()
        self.timeCircle.stop()
        self.player?.stop()
        
        self.timeCircle.isActive = false

        GlobalVariables.rideid = ""
        self.dismissViewcontroller()
        
        
    }
    
    
    @IBAction func accept_btn_click(_ sender: Any) {
        
        self.timeCircle.stop()
        self.timeCircle.isActive = false
        self.player?.stop()
        self.helloWorldTimer.invalidate()
        self.helloWorldTimer1.invalidate()
    
    
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.RideLaterAcceptRide(RideId: GlobalVariables.rideid, RideMode: "1", DriverId: self.driverid, DriverToken: self.defaultdrivertoken)
    
    }
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if resultCode == 143 {
            
            self.ridedata = data as! ViewRide
            if (self.ridedata.result == 1){
                
                
               // let timerrequest = (self.ridedata.details?.driverrequesttime)!
               // let differencetime = (self.ridedata.details?.differenceInSeconds)!
                
                let finaltime = 60
                
                
                
                self.timeCircle.totalTime = TimeInterval(finaltime)
                self.timeCircle.isActive = true
                self.timeCircle.start()
                self.timeCircle.elapsedTime = TimeInterval(finaltime)
                self.timeCircle.font = UIFont.boldSystemFont(ofSize: 40.0)
                self.timeCircle.fontColor = UIColor.black
                
                
                self.helloWorldTimer = Timer.scheduledTimer(timeInterval: TimeInterval(finaltime), target: self, selector: #selector(AcceptRejectViewController.sayHello), userInfo: nil, repeats: false)
                
                self.helloWorldTimer1 = Timer.scheduledTimer(timeInterval: 17.0, target: self, selector: #selector(AcceptRejectViewController.sayHello1), userInfo: nil, repeats: true)
                
                
                
                GlobalVariables.driverid = (self.ridedata.details?.driverId)!
                GlobalVariables.rideid = (self.ridedata.details?.rideId)!
                GlobalVariables.pickupLoc = (self.ridedata.details?.pickupLocation)!
                GlobalVariables.custId = (self.ridedata.details?.userId)!
                GlobalVariables.pickupLat = (self.ridedata.details?.pickupLat)!
                GlobalVariables.pickupLong = (self.ridedata.details?.pickupLong)!
                GlobalVariables.ride_status = (self.ridedata.details?.rideStatus)!
                GlobalVariables.dropLat = (self.ridedata.details?.dropLat)!
                GlobalVariables.dropLong = (self.ridedata.details?.dropLong)!
                GlobalVariables.dropLocation = (self.ridedata.details?.dropLocation)!
                
                self.pickupAddress.text = (self.ridedata.details?.pickupLocation)!
                
               // self.paymentmethodtext.text = "Payment Mode : ".localized + (self.ridedata.details?.paymentOptionName)!
                
                scheduledate.text = "Scheduled Date :" + " " + (self.ridedata.details?.rideDate)! + "  " +  (self.ridedata.details?.rideTime)!
                
                bookingdate.text = "Booking Date :" + " " + (self.ridedata.details?.laterDate)! + "  " +  (self.ridedata.details?.laterTime)!

                
                dropAddress.text = (self.ridedata.details?.dropLocation)!
                
                
                mapimagecircle.layer.borderWidth = 1
                mapimagecircle.layer.masksToBounds = false
                mapimagecircle.layer.borderColor = UIColor.black.cgColor
                mapimagecircle.layer.cornerRadius =  mapimagecircle.frame.height/2
                mapimagecircle.clipsToBounds = true
                
                
                
                let url22 = "https://maps.googleapis.com/maps/api/staticmap?center=\(GlobalVariables.pickupLat),\(GlobalVariables.pickupLong)&zoom=15&size=350x350"
                
                print(url22)
                let url2 = NSURL(string: url22)
                mapimagecircle.af_setImage(withURL:
                    url2! as URL,
                                           placeholderImage: UIImage(named: "dress"),
                                           filter: nil,
                                           imageTransition: .crossDissolve(1.0))
                
                
                
                
                //  self.dropAddress.text = (self.ridedata.details?.dropLocation)!
            }
        }
        
        
        if resultCode == 8031 {
            
            ridelateracceptdata = data as! RideLaterAcceptModel
            
            if(ridelateracceptdata.result == 1){
                
                let alert = UIAlertController(title: "", message: self.ridelateracceptdata.msg!, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK".localized, style: .default) { _ in
                    GlobalVariables.rideid = ""
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

        

    }
    

   

}
