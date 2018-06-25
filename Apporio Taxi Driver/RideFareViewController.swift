//
//  RideFareViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 07/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import StarryStars

class RideFareViewController: UIViewController,ParsingStates,RatingViewDelegate {
    
      var mydatapage :DoneRideModel!
      var data: RateCustomer!
    
    
    @IBOutlet weak var commentifanytextlabel: UILabel!
    @IBOutlet weak var ratingtextlabel: UILabel!
    
    @IBOutlet weak var pleaseconfirmreciepttextlabel: UILabel!
    
    @IBOutlet weak var tripdetailstextlabel: UILabel!
    
    
    @IBOutlet weak var totalpayableamounttextlabel: UILabel!
    
    
    @IBOutlet weak var totaldistancetextlabel: UILabel!
    
    @IBOutlet weak var faretextlabel: UILabel!
    
    
    @IBOutlet weak var totalridetimetextlabel: UILabel!
    
    
    @IBOutlet weak var ridefaretextlabel: UILabel!
    @IBOutlet weak var ridetimechargestextlabel: UILabel!
    @IBOutlet weak var totalwaitingtimetextlabel: UILabel!
    
    @IBOutlet weak var waitingchargetextlabel: UILabel!
    
    @IBOutlet weak var nighttimechargetextlabel: UILabel!
    
    
    @IBOutlet weak var sumbitbtntext: UIButton!
    @IBOutlet weak var netfarelabeltext: UILabel!
    @IBOutlet weak var peaktimechargetextlabel: UILabel!
    
    
    
    func setupView(){
        pleaseconfirmreciepttextlabel.text = "Please Confirm This Receipt with customer.".localized
        tripdetailstextlabel.text = "TRIP DETAIL".localized
        totalpayableamounttextlabel.text = "Total Payable Amount".localized
        totaldistancetextlabel.text = "Total Distance :".localized
        faretextlabel.text = "Fare :".localized
        totalridetimetextlabel.text = "Total Ride Time :".localized
        totalwaitingtimetextlabel.text = "Total Waiting Time :".localized
        ridetimechargestextlabel.text = "Ride Time Charges :".localized
        waitingchargetextlabel.text = "Waiting Charge :".localized
        nighttimechargetextlabel.text = "Night Time Charges :".localized
        peaktimechargetextlabel.text = "Peak Time Charges :".localized
        netfarelabeltext.text = "Net Fare :".localized
        
        sumbitbtntext.setTitle("Rate the Ride".localized, for: UIControlState.normal)
        ridefaretextlabel.text = "RIDE FARE".localized
        ratingtextlabel.text = "RATING".localized
        commentifanytextlabel.text = "Comment(if any)".localized
        donebtn.setTitle("Done".localized, for: UIControlState.normal)
        
        
        
        
    }
    

    
    
    @IBOutlet weak var ratingview: RatingView!
    
    @IBOutlet weak var hiddenview: UIView!
    
    @IBOutlet weak var innerviewrating: UIView!
    @IBOutlet weak var submitbtnview: UIView!
    
    @IBOutlet weak var pickuplocationtext: UILabel!
    
    @IBOutlet weak var droplocationtext: UILabel!
    
    @IBOutlet weak var totalpayableview: UIView!
    
    
    @IBOutlet weak var tripdetailsview: UIView!
    
    @IBOutlet weak var commenttext: UITextView!
    
    @IBOutlet weak var commentview: UIView!
    
     @IBOutlet weak var Paymentmethodtext: UILabel!
    
    @IBOutlet weak var nighttimechargestext: UILabel!
    
    
    @IBOutlet weak var paektimechargestext: UILabel!
    
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var totalpayableamouttext: UILabel!
    
    @IBOutlet weak var totaldistancelabel: UILabel!
    
    @IBOutlet weak var farelabeltext: UILabel!
    
    @IBOutlet weak var ridetimechargelabel: UILabel!
    
    
    @IBOutlet weak var waitinglabel: UILabel!
    
    @IBOutlet weak var maincouponlabel: UILabel!
    
    @IBOutlet weak var netfaretextlabel: UILabel!
    
    @IBOutlet weak var coupontextlabel: UILabel!
    
 var ratingValue: String = ""
      var rating: Float = 0.0
    
    @IBOutlet weak var totalridetimevalue: UILabel!
    
    @IBOutlet weak var totalwaitingtimevalue: UILabel!
    
    @IBOutlet weak var donebtn: UIButton!
    
    var  defaultdriverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        
        self.commentview.layer.borderWidth = 1.0
        self.commentview.layer.cornerRadius = 4
        
       self.hiddenview.isHidden = true
        
        self.donebtn.layer.borderWidth = 1.0
        self.donebtn.layer.cornerRadius = 4
        self.donebtn.layer.backgroundColor = UIColor.lightGray.cgColor
        
        tripdetailsview.layer.shadowColor = UIColor.gray.cgColor
        tripdetailsview.layer.shadowOpacity = 1
        tripdetailsview.layer.shadowOffset = CGSize(width: 0, height: 3)
        tripdetailsview.layer.shadowRadius = 5
        
        totalpayableview.layer.shadowColor = UIColor.gray.cgColor
        totalpayableview.layer.shadowOpacity = 1
        totalpayableview.layer.shadowOffset = CGSize(width: 0, height: 3)
        totalpayableview.layer.shadowRadius = 5
        
        
        ratingview.editable = true
        ratingview.delegate = self
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.ViewDoneRide(RIDEID: GlobalVariables.donerideid)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // self.mainview.frame.size.height = 700
        self.scrollview.frame = self.scrollview.bounds
        self.scrollview.contentSize.height = 900
        self.scrollview.contentSize.width = 0
        
    }
    
    func ratingView(_ ratingView: RatingView, didChangeRating newRating: Float) {
        print("newRating: \(newRating)")
        rating = newRating
        ratingValue = String(rating)
        GlobalVariables.finalRating = ratingValue
    }

    @IBAction func donebtn(_ sender: Any) {
        
        
         UserDefaults.standard.setValue("1", forKey:"firebaseride_status")
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.rateCustomer(driverid: self.defaultdriverid, customerid: GlobalVariables.custId, rating: GlobalVariables.finalRating, comment: commenttext.text!,RideId: GlobalVariables.rideid)
    }
    
    @IBAction func submit_btn_click(_ sender: Any) {
        
       self.hiddenview.isHidden = false
        

        
    }
    
     func onSuccessState(_ data: AnyObject , resultCode: Int) {
    
   if (resultCode == 1777){
    
     mydatapage = data as! DoneRideModel
    
  
    
    if(mydatapage.result == 1){
        
        
        
    
   /* donerideid = (mydatapage.msg?.doneRideId)!
    
    GlobalVariables.RideId = (mydatapage.msg?.rideId)!
    
    GlobalVarible.TotalPayableamount = (mydatapage.msg!.totalAmount)!
    
    GlobalVarible.DRIVERID = (mydatapage.msg!.driverId)!*/
        
        GlobalVariables.rideid = (mydatapage.msg?.rideId)!
    
        droplocationtext.text = mydatapage.msg?.endLocation
    
        pickuplocationtext.text = mydatapage.msg?.beginLocation
        
        totalridetimevalue.text = mydatapage.msg?.rideTime
        
        totalwaitingtimevalue.text = mydatapage.msg?.waitingTime
    
    totalpayableamouttext.text = GlobalVariables.currencysymbol + " " + (mydatapage.msg!.totalAmount)!
    
    totaldistancelabel.text = (mydatapage.msg!.distance)! 
    
    farelabeltext.text =  GlobalVariables.currencysymbol + " " + (mydatapage.msg?.amount)!
    
    ridetimechargelabel.text = GlobalVariables.currencysymbol + " " + (mydatapage.msg?.rideTimePrice)!
    
    waitinglabel.text = GlobalVariables.currencysymbol + " " + (mydatapage.msg?.waitingPrice)!
    
    maincouponlabel.text = "Coupon".localized +  " (" + (mydatapage.msg?.couponsCode)! + " )"
    
    coupontextlabel.text =  GlobalVariables.currencysymbol + " " + (mydatapage.msg?.couponsPrice)!
    
    netfaretextlabel.text = GlobalVariables.currencysymbol + " " + (mydatapage.msg?.totalAmount)!
        
     paektimechargestext.text = GlobalVariables.currencysymbol + " " + (mydatapage.msg?.peaktimecharges)!
        
        nighttimechargestext.text =  GlobalVariables.currencysymbol + " " + (mydatapage.msg?.nighttimecharges)!
        
        GlobalVariables.custId = (mydatapage.msg?.userid)!
        
        
        
        
        Paymentmethodtext.text = "Payment Mode : ".localized + (mydatapage.msg?.paymentOptionName)!

    
      
    
    }else{
    
    print("HelloRating")
    
    }

    
    }
        
         if (resultCode == 154){
            
            
            self.data = data as! RateCustomer
            
            if(self.data.result == 419){
                
                NsUserDefaultManager.SingeltonInstance.logOut()
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
                
                
            }else if (self.data.result == 1){
               /* let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                self.present(next, animated: true, completion: nil)*/
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                
                if let window = self.view.window{
                    window.rootViewController = nextController
                }
            }

        }
    }
  
}
