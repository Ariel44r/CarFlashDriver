//
//  YourRideViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 07/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class YourRideViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ParsingStates {
    
    @IBOutlet weak var backgroundcolorview: UIView!
    
    var toastLabel : UILabel!
    
    var mydata: AllRides!
    
    var collectionsize = 0
    
    
  //  @IBOutlet weak var yourtripstextlabel: UILabel!
    
    let driverid =   NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!

    @IBOutlet weak var yourridetable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       //  yourtripstextlabel.text = "Your Trips".localized
        
         GlobalVariables.cancelbtnvaluematch = "1"
        toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-300, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.white
        toastLabel.textColor = UIColor.black
        toastLabel.textAlignment = NSTextAlignment.center;
        self.view.addSubview(toastLabel)
        toastLabel.text = "No Rides!!".localized
        
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.ShowAllRides(driverid: self.driverid)
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backbtn(_ sender: Any) {
        dismissViewcontroller()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if GlobalVariables.cancelbtnvaluematch == "2"{
             GlobalVariables.cancelbtnvaluematch = ""
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.ShowAllRides(driverid: self.driverid)
            
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        /*  if(mydata == nil ){
         return 0
         }else {
         return (mydata.message?.count)!
         }*/
        return collectionsize
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = yourridetable.dequeueReusableCell(withIdentifier: "YourRide", for: indexPath) as! YourrideTableViewCell
        
        
        
        
        if mydata.details![indexPath.row].rideMode == "2"{
            
            cell.renteltypelabel.isHidden = false
            
            let checkstatus = mydata.details![indexPath.row].rentalRide?.bookingStatus
            
            
            if ((checkstatus == "15") || (checkstatus == "16") || (checkstatus == "19") || (checkstatus == "14") || (checkstatus == "18")) {
                
                
                
                cell.mainview.layer.shadowColor = UIColor.gray.cgColor
                cell.mainview.layer.shadowOpacity = 1
                cell.mainview.layer.shadowOffset = CGSize(width: 0, height: 2)
                cell.mainview.layer.shadowRadius = 2
                
                
                
                cell.datetimelabel.text = (mydata.details![indexPath.row].rentalRide!.bookingDate!) + "  " + (mydata.details![indexPath.row].rentalRide!.bookingTime!)
                cell.pickuplabel.text = mydata.details![indexPath.row].rentalRide!.pickupLocation
                
                cell.usernamelabel.text = mydata.details![indexPath.row].rentalRide!.userName
                cell.usermobilelabel.text = mydata.details![indexPath.row].rentalRide!.userPhone
                

                
                
                
            }else{

            
               /* backgroundcolorview.layer.backgroundColor = UIColor.white.cgColor
                
                toastLabel.isHidden = false
                yourridetable.isHidden = true*/
            
            }
            
            
            if(checkstatus == "15"){
                
                cell.pickuplabel.text = mydata.details![indexPath.row].rentalRide!.pickupLocation
                
                cell.statuslabel.text = "Cancelled by user".localized
                // cell.dropuplabel.text = mydata.msg![indexPath.row].dropLocation
                
                
            }
            
            if (checkstatus == "14"){
                
                cell.statuslabel.text = "REJECTED".localized
                //  cell.ongoinglabel.textColor = UIColor.greenColor()
                cell.pickuplabel.text = mydata.details![indexPath.row].rentalRide!.pickupLocation
                //  cell.dropuplabel.text = mydata.msg![indexPath.row].dropLocation
                
                
            }
            
           /* if (checkstatus == "10"){
                
                cell.statuslabel.text = "SCHEDULED".localized
                //  cell.ongoinglabel.textColor = UIColor.greenColor()
                cell.pickuplabel.text = mydata.details![indexPath.row].rentalRide!.pickupLocation
                
                //  cell.dropuplabel.text = mydata.msg![indexPath.row].dropLocation
                
                
            }
            
            if (checkstatus == "11"){
                
                cell.statuslabel.text = "Accepted".localized
                //   cell.ongoinglabel.textColor = UIColor.greenColor()
                cell.pickuplabel.text = mydata.details![indexPath.row].rentalRide!.pickupLocation
                
                // cell.dropuplabel.text = mydata.msg![indexPath.row].dropLocation
                
                
            }
            if (checkstatus == "14"){
                
                cell.statuslabel.text = "REJECTED".localized
                //  cell.ongoinglabel.textColor = UIColor.greenColor()
                cell.pickuplabel.text = mydata.details![indexPath.row].rentalRide!.pickupLocation
                //  cell.dropuplabel.text = mydata.msg![indexPath.row].dropLocation
                
                
            }
            if (checkstatus == "12"){
                
                cell.statuslabel.text = "Driver Arrived".localized
                //   cell.ongoinglabel.textColor = UIColor.greenColor()
                cell.pickuplabel.text = mydata.details![indexPath.row].rentalRide!.pickupLocation
                
                // cell.dropuplabel.text = mydata.msg![indexPath.row].dropLocation
                
                
                
            }
            
            if (checkstatus == "13"){
                
                cell.statuslabel.text = "ONGOING".localized
                //   cell.ongoinglabel.textColor = UIColor.greenColor()
                cell.pickuplabel.text = mydata.details![indexPath.row].rentalRide!.pickupLocation
                
                // cell.dropuplabel.text = mydata.msg![indexPath.row].dropLocation
                
                
            }*/
            
            
            if(checkstatus == "18"){
                
                cell.pickuplabel.text = mydata.details![indexPath.row].rentalRide!.pickupLocation
                
                cell.statuslabel.text = "Cancelled by you".localized
                // cell.dropuplabel.text = mydata.msg![indexPath.row].dropLocation
                
                
            }
            
            if (checkstatus == "16"){
                
                cell.statuslabel.text = GlobalVariables.currencysymbol + " " + (mydata.details![indexPath.row].rentalRide!.finalBillAmount)!
                cell.pickuplabel.text = mydata.details![indexPath.row].rentalRide!.pickupLocation
                cell.dropuplabel.text = mydata.details![indexPath.row].rentalRide!.endLocation
                
                
            }
            
            if(checkstatus == "19"){
                
                cell.pickuplabel.text = mydata.details![indexPath.row].rentalRide!.pickupLocation
                
                cell.statuslabel.text = "Cancelled by Admin".localized
                // cell.dropuplabel.text = mydata.msg![indexPath.row].dropLocation
                
                
            }
            
            
            
            
        }else{
            
            cell.renteltypelabel.isHidden = true
            
            
            
            
            let checkstatus = mydata.details![indexPath.row].normalRide!.rideStatus
            
            
            if ((checkstatus == "2") || (checkstatus == "7") || (checkstatus == "9") || (checkstatus == "17") || (checkstatus == "4") ) {
                
                cell.mainview.layer.shadowColor = UIColor.gray.cgColor
                cell.mainview.layer.shadowOpacity = 1
                cell.mainview.layer.shadowOffset = CGSize(width: 0, height: 2)
                cell.mainview.layer.shadowRadius = 2
                
                
                
                cell.datetimelabel.text = (mydata.details![indexPath.row].normalRide!.rideDate!) + "  " + (mydata.details![indexPath.row].normalRide!.rideTime!)
                cell.pickuplabel.text = mydata.details![indexPath.row].normalRide!.pickupLocation
                
                cell.usernamelabel.text = mydata.details![indexPath.row].normalRide!.userName
                cell.usermobilelabel.text = mydata.details![indexPath.row].normalRide!.userPhone

                
                
                
            }else{
                
              /*  backgroundcolorview.layer.backgroundColor = UIColor.white.cgColor
                
                toastLabel.isHidden = false
                yourridetable.isHidden = true*/
                

            
                
            }
            
            
            if(checkstatus == "2"){
                
                cell.pickuplabel.text = mydata.details![indexPath.row].normalRide!.pickupLocation
                
                cell.statuslabel.text = "Cancelled by user".localized
                cell.dropuplabel.text = mydata.details![indexPath.row].normalRide!.dropLocation
                
                
            }
            
            if (checkstatus == "4"){
                
                cell.statuslabel.text = "REJECTED".localized
                //  cell.ongoinglabel.textColor = UIColor.greenColor()
                cell.pickuplabel.text = mydata.details![indexPath.row].normalRide!.pickupLocation
                cell.dropuplabel.text = mydata.details![indexPath.row].normalRide!.dropLocation
                
                
            }
            
          /*  if (checkstatus == "1"){
                
                cell.statuslabel.text = "SCHEDULED".localized
                //  cell.ongoinglabel.textColor = UIColor.greenColor()
                cell.pickuplabel.text = mydata.details![indexPath.row].normalRide!.pickupLocation
                
                cell.dropuplabel.text = mydata.details![indexPath.row].normalRide!.dropLocation
                
                
            }
            
            if (checkstatus == "3"){
                
                cell.statuslabel.text = "Accepted".localized
                //   cell.ongoinglabel.textColor = UIColor.greenColor()
                cell.pickuplabel.text = mydata.details![indexPath.row].normalRide!.pickupLocation
                
                cell.dropuplabel.text = mydata.details![indexPath.row].normalRide!.pickupLocation
                
                
            }
            if (checkstatus == "4"){
                
                cell.statuslabel.text = "REJECTED".localized
                //  cell.ongoinglabel.textColor = UIColor.greenColor()
                cell.pickuplabel.text = mydata.details![indexPath.row].normalRide!.pickupLocation
                cell.dropuplabel.text = mydata.details![indexPath.row].normalRide!.dropLocation
                
                
            }
            if (checkstatus == "5"){
                
                cell.statuslabel.text = "Driver Arrived".localized
                //   cell.ongoinglabel.textColor = UIColor.greenColor()
                cell.pickuplabel.text = mydata.details![indexPath.row].normalRide!.pickupLocation
                
                cell.dropuplabel.text = mydata.details![indexPath.row].normalRide!.dropLocation
                
                
                
            }
            
            if (checkstatus == "6"){
                
                cell.statuslabel.text = "ONGOING".localized
                //   cell.ongoinglabel.textColor = UIColor.greenColor()
                cell.pickuplabel.text = mydata.details![indexPath.row].normalRide!.pickupLocation
                
                cell.dropuplabel.text = mydata.details![indexPath.row].normalRide!.dropLocation
                
                
            }*/
            
            if (checkstatus == "7"){
                
                cell.statuslabel.text = GlobalVariables.currencysymbol + " " + mydata.details![indexPath.row].normalRide!.totalAmount!
                cell.pickuplabel.text = mydata.details![indexPath.row].normalRide!.pickupLocation
                cell.dropuplabel.text = mydata.details![indexPath.row].normalRide!.dropLocation
                
                
            }
            
            if(checkstatus == "9"){
                
                cell.pickuplabel.text = mydata.details![indexPath.row].normalRide!.pickupLocation
                
                cell.statuslabel.text = "Cancelled by you".localized
                cell.dropuplabel.text = mydata.details![indexPath.row].normalRide!.dropLocation
                
                
            }
            
            if(checkstatus == "17"){
                
                cell.pickuplabel.text = mydata.details![indexPath.row].normalRide!.pickupLocation
                
                cell.statuslabel.text = "Cancelled by Admin".localized
                cell.dropuplabel.text = mydata.details![indexPath.row].normalRide!.dropLocation
                
                
            }
            
            
            
            
            
        }
        
        
        
        
        return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView,estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
         if mydata.details![indexPath.row].rideMode == "2"{
            
            let checkstatus = mydata.details![indexPath.row].rentalRide?.bookingStatus
            
            
            if ((checkstatus == "15") || (checkstatus == "16") || (checkstatus == "19") || (checkstatus == "14") || (checkstatus == "18")) {
                
              return 200
                
            }else{
            return 0
            }
            
            
         }else{
        
        let checkstatus = mydata.details![indexPath.row].normalRide!.rideStatus
        
        
        if ((checkstatus == "2") || (checkstatus == "7") || (checkstatus == "9") || (checkstatus == "17") || (checkstatus == "4")) {
            
            return 200
            
            
        }else{
            
            
            return 0
            
        }
            
        }
         return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
         if mydata.details![indexPath.row].rideMode == "2"{
            
            let checkstatus = mydata.details![indexPath.row].rentalRide?.bookingStatus
            
            
            if ((checkstatus == "15") || (checkstatus == "16") || (checkstatus == "19") || (checkstatus == "14") || (checkstatus == "18")) {
                return 200
            }else{
            
            return 0
            }
            

         }else{
        
        let checkstatus = mydata.details![indexPath.row].normalRide!.rideStatus
        
        
        if ((checkstatus == "2") || (checkstatus == "7") || (checkstatus == "9") || (checkstatus == "17") || (checkstatus == "4") ) {
            
            return 200
            
            
            
        }else{
            return 0
            
        }
            
        }
         return 0
    }
    
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        yourridetable.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        print("Row: \(row)")
        
        
        var value = ""
        
        var datevalue = ""
        
        var rideidvalue = ""
        
        var ridemodevalue = ""
        
        if mydata.details![indexPath.row].rideMode == "2"{
            
            ridemodevalue = "2"
            
            value = mydata.details![indexPath.row].rentalRide!.bookingStatus!
            
            datevalue = mydata.details![indexPath.row].rentalRide!.bookingDate! + "  " + mydata.details![indexPath.row].rentalRide!.bookingTime!
            
            rideidvalue = mydata.details![indexPath.row].rentalRide!.rentalBookingId!
            
            
        }else{
            
            ridemodevalue = "1"
            
            value = mydata.details![indexPath.row].normalRide!.rideStatus!
            
            datevalue = mydata.details![indexPath.row].normalRide!.rideDate! + "  " + mydata.details![indexPath.row].normalRide!.rideTime!
            
            rideidvalue = mydata.details![indexPath.row].normalRide!.rideId!
            
            
        }
        
        
        
        print(value)
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let fulldetailsViewController = storyBoard.instantiateViewController(withIdentifier: "FullDetailsViewController") as! FullDetailsViewController
        fulldetailsViewController.ridestausvalue = value
        fulldetailsViewController.datetimedata = datevalue
        fulldetailsViewController.rideid = rideidvalue
        fulldetailsViewController.ridemode = ridemodevalue
        self.present(fulldetailsViewController, animated:true, completion:nil)
        
    }
    
    
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        
        
        mydata = data as! AllRides
        
        if(self.mydata.status == 419){
            
           
             NsUserDefaultManager.SingeltonInstance.logOut()
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
            self.present(next, animated: true, completion: nil)
            
            
        }else if(mydata.status == 0){
            
            backgroundcolorview.layer.backgroundColor = UIColor.white.cgColor
            
            toastLabel.isHidden = false
            yourridetable.isHidden = true
            
            
        }else{
            
            toastLabel.isHidden = true
            yourridetable.isHidden = false
            
            collectionsize = (mydata.details?.count)!
            
            yourridetable.reloadData()
            
        }
        
        
        
    }
    
    
    
    
}
