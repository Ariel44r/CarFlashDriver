//
//  Details.swift
//
//  Created by Rakesh kumar on 19/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Details: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.


    private struct SerializationKeys {
        static let cityAdminStatus = "city_admin_status"
        static let verificationStatus = "verification_status"
        static let insuranceExpire = "insurance_expire"
        static let cityName = "city_name"
        static let cityLatitude = "city_latitude"
        static let driverName = "driver_name"
        static let driverPayment = "driver_payment"
        static let driverToken = "driver_token"
        static let driverBankName = "driver_bank_name"
        static let busy = "busy"
        static let totalDocumentNeed = "total_document_need"
        static let driverPassword = "driver_password"
        static let currency = "currency"
        static let verfiyDocument = "verfiy_document"
        static let otherDocs = "other_docs"
        static let completedRides = "completed_rides"
        static let carNumber = "car_number"
        static let companyPayment = "company_payment"
        static let commission = "commission"
        static let carModelId = "car_model_id"
        static let detailStatus = "detail_status"
        static let driverId = "driver_id"
        static let rating = "rating"
        static let license = "license"
        static let insurance = "insurance"
        static let loginLogout = "login_logout"
        static let carTypeId = "car_type_id"
        static let driverPhone = "driver_phone"
        static let onlineOffline = "online_offline"
        static let flag = "flag"
        static let rc = "rc"
        static let companyId = "company_id"
        static let verificationDate = "verification_date"
        static let cityLongitude = "city_longitude"
        static let rcExpire = "rc_expire"
        static let currentLat = "current_lat"
        static let uniqueNumber = "unique_number"
        static let totalCardPayment = "total_card_payment"
        static let amountTransferPending = "amount_transfer_pending"
        static let driverStatusMessage = "driver_status_message"
        static let driverCategory = "driver_category"
        static let lastUpdateDate = "last_update_date"
        static let cityNameArabic = "city_name_arabic"
        static let licenseExpire = "license_expire"
        static let driverAccountName = "driver_account_name"
        static let driverEmail = "driver_email"
        static let paymentTransfer = "payment_transfer"
        static let lastUpdate = "last_update"
        static let distance = "distance"
        static let driverAccountNumber = "driver_account_number"
        static let totalCashPayment = "total_cash_payment"
        static let currentLocation = "current_location"
        static let currentLong = "current_long"
        static let carModelName = "car_model_name"
        static let cityId = "city_id"
        static let cancelledRides = "cancelled_rides"
        static let driverAdminStatus = "driver_admin_status"
        static let cityNameFrench = "city_name_french"
        static let driverStatusImage = "driver_status_image"
        static let rejectRides = "reject_rides"
        static let carTypeName = "car_type_name"
        static let driverSignupDate = "driver_signup_date"
        static let totalPaymentEraned = "total_payment_eraned"
        static let deviceId = "device_id"
        static let driverImage = "driver_image"
        static let registerDate = "register_date"
        
    }
    
    // MARK: Properties
    public var cityAdminStatus: String?
    public var verificationStatus: String?
    public var insuranceExpire: String?
    public var cityName: String?
    public var cityLatitude: String?
    public var driverName: String?
    public var driverPayment: String?
    public var driverToken: String?
    public var driverBankName: String?
    public var busy: String?
    public var totalDocumentNeed: String?
    public var driverPassword: String?
    public var currency: String?
    public var verfiyDocument: String?
    public var otherDocs: String?
    public var completedRides: String?
    public var carNumber: String?
    public var companyPayment: String?
    public var commission: String?
    public var carModelId: String?
    public var detailStatus: String?
    public var driverId: String?
    public var rating: String?
    public var license: String?
    public var insurance: String?
    public var loginLogout: String?
    public var carTypeId: String?
    public var driverPhone: String?
    public var onlineOffline: String?
    public var flag: String?
    public var rc: String?
    public var companyId: String?
    public var verificationDate: String?
    public var cityLongitude: String?
    public var rcExpire: String?
    public var currentLat: String?
    public var uniqueNumber: String?
    public var totalCardPayment: String?
    public var amountTransferPending: String?
    public var driverStatusMessage: String?
    public var driverCategory: String?
    public var lastUpdateDate: String?
    public var cityNameArabic: String?
    public var licenseExpire: String?
    public var driverAccountName: String?
    public var driverEmail: String?
    public var paymentTransfer: String?
    public var lastUpdate: String?
    public var distance: String?
    public var driverAccountNumber: String?
    public var totalCashPayment: String?
    public var currentLocation: String?
    public var currentLong: String?
    public var carModelName: String?
    public var cityId: String?
    public var cancelledRides: String?
    public var driverAdminStatus: String?
    public var cityNameFrench: String?
    public var driverStatusImage: String?
    public var rejectRides: String?
    public var carTypeName: String?
    public var driverSignupDate: String?
    public var totalPaymentEraned: String?
    public var deviceId: String?
    public var driverImage: String?
    public var registerDate: String?
    
    
    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public required init(json: JSON) {
        cityAdminStatus = json[SerializationKeys.cityAdminStatus].string
        verificationStatus = json[SerializationKeys.verificationStatus].string
        insuranceExpire = json[SerializationKeys.insuranceExpire].string
        cityName = json[SerializationKeys.cityName].string
        cityLatitude = json[SerializationKeys.cityLatitude].string
        driverName = json[SerializationKeys.driverName].string
        driverPayment = json[SerializationKeys.driverPayment].string
        driverToken = json[SerializationKeys.driverToken].string
        driverBankName = json[SerializationKeys.driverBankName].string
        busy = json[SerializationKeys.busy].string
        totalDocumentNeed = json[SerializationKeys.totalDocumentNeed].string
        driverPassword = json[SerializationKeys.driverPassword].string
        currency = json[SerializationKeys.currency].string
        verfiyDocument = json[SerializationKeys.verfiyDocument].string
        otherDocs = json[SerializationKeys.otherDocs].string
        completedRides = json[SerializationKeys.completedRides].string
        carNumber = json[SerializationKeys.carNumber].string
        companyPayment = json[SerializationKeys.companyPayment].string
        commission = json[SerializationKeys.commission].string
        carModelId = json[SerializationKeys.carModelId].string
        detailStatus = json[SerializationKeys.detailStatus].string
        driverId = json[SerializationKeys.driverId].string
        rating = json[SerializationKeys.rating].string
        license = json[SerializationKeys.license].string
        insurance = json[SerializationKeys.insurance].string
        loginLogout = json[SerializationKeys.loginLogout].string
        carTypeId = json[SerializationKeys.carTypeId].string
        driverPhone = json[SerializationKeys.driverPhone].string
        onlineOffline = json[SerializationKeys.onlineOffline].string
        flag = json[SerializationKeys.flag].string
        rc = json[SerializationKeys.rc].string
        companyId = json[SerializationKeys.companyId].string
        verificationDate = json[SerializationKeys.verificationDate].string
        cityLongitude = json[SerializationKeys.cityLongitude].string
        rcExpire = json[SerializationKeys.rcExpire].string
        currentLat = json[SerializationKeys.currentLat].string
        uniqueNumber = json[SerializationKeys.uniqueNumber].string
        totalCardPayment = json[SerializationKeys.totalCardPayment].string
        amountTransferPending = json[SerializationKeys.amountTransferPending].string
        driverStatusMessage = json[SerializationKeys.driverStatusMessage].string
        driverCategory = json[SerializationKeys.driverCategory].string
        lastUpdateDate = json[SerializationKeys.lastUpdateDate].string
        cityNameArabic = json[SerializationKeys.cityNameArabic].string
        licenseExpire = json[SerializationKeys.licenseExpire].string
        driverAccountName = json[SerializationKeys.driverAccountName].string
        driverEmail = json[SerializationKeys.driverEmail].string
        paymentTransfer = json[SerializationKeys.paymentTransfer].string
        lastUpdate = json[SerializationKeys.lastUpdate].string
        distance = json[SerializationKeys.distance].string
        driverAccountNumber = json[SerializationKeys.driverAccountNumber].string
        totalCashPayment = json[SerializationKeys.totalCashPayment].string
        currentLocation = json[SerializationKeys.currentLocation].string
        currentLong = json[SerializationKeys.currentLong].string
        carModelName = json[SerializationKeys.carModelName].string
        cityId = json[SerializationKeys.cityId].string
        cancelledRides = json[SerializationKeys.cancelledRides].string
        driverAdminStatus = json[SerializationKeys.driverAdminStatus].string
        cityNameFrench = json[SerializationKeys.cityNameFrench].string
        driverStatusImage = json[SerializationKeys.driverStatusImage].string
        rejectRides = json[SerializationKeys.rejectRides].string
        carTypeName = json[SerializationKeys.carTypeName].string
        driverSignupDate = json[SerializationKeys.driverSignupDate].string
        totalPaymentEraned = json[SerializationKeys.totalPaymentEraned].string
        deviceId = json[SerializationKeys.deviceId].string
        driverImage = json[SerializationKeys.driverImage].string
        registerDate = json[SerializationKeys.registerDate].string
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = cityAdminStatus { dictionary[SerializationKeys.cityAdminStatus] = value }
        if let value = verificationStatus { dictionary[SerializationKeys.verificationStatus] = value }
        if let value = insuranceExpire { dictionary[SerializationKeys.insuranceExpire] = value }
        if let value = cityName { dictionary[SerializationKeys.cityName] = value }
        if let value = cityLatitude { dictionary[SerializationKeys.cityLatitude] = value }
        if let value = driverName { dictionary[SerializationKeys.driverName] = value }
        if let value = driverPayment { dictionary[SerializationKeys.driverPayment] = value }
        if let value = driverToken { dictionary[SerializationKeys.driverToken] = value }
        if let value = driverBankName { dictionary[SerializationKeys.driverBankName] = value }
        if let value = busy { dictionary[SerializationKeys.busy] = value }
        if let value = totalDocumentNeed { dictionary[SerializationKeys.totalDocumentNeed] = value }
        if let value = driverPassword { dictionary[SerializationKeys.driverPassword] = value }
        if let value = currency { dictionary[SerializationKeys.currency] = value }
        if let value = verfiyDocument { dictionary[SerializationKeys.verfiyDocument] = value }
        if let value = otherDocs { dictionary[SerializationKeys.otherDocs] = value }
        if let value = completedRides { dictionary[SerializationKeys.completedRides] = value }
        if let value = carNumber { dictionary[SerializationKeys.carNumber] = value }
        if let value = companyPayment { dictionary[SerializationKeys.companyPayment] = value }
        if let value = commission { dictionary[SerializationKeys.commission] = value }
        if let value = carModelId { dictionary[SerializationKeys.carModelId] = value }
        if let value = detailStatus { dictionary[SerializationKeys.detailStatus] = value }
        if let value = driverId { dictionary[SerializationKeys.driverId] = value }
        if let value = rating { dictionary[SerializationKeys.rating] = value }
        if let value = license { dictionary[SerializationKeys.license] = value }
        if let value = insurance { dictionary[SerializationKeys.insurance] = value }
        if let value = loginLogout { dictionary[SerializationKeys.loginLogout] = value }
        if let value = carTypeId { dictionary[SerializationKeys.carTypeId] = value }
        if let value = driverPhone { dictionary[SerializationKeys.driverPhone] = value }
        if let value = onlineOffline { dictionary[SerializationKeys.onlineOffline] = value }
        if let value = flag { dictionary[SerializationKeys.flag] = value }
        if let value = rc { dictionary[SerializationKeys.rc] = value }
        if let value = companyId { dictionary[SerializationKeys.companyId] = value }
        if let value = verificationDate { dictionary[SerializationKeys.verificationDate] = value }
        if let value = cityLongitude { dictionary[SerializationKeys.cityLongitude] = value }
        if let value = rcExpire { dictionary[SerializationKeys.rcExpire] = value }
        if let value = currentLat { dictionary[SerializationKeys.currentLat] = value }
        if let value = uniqueNumber { dictionary[SerializationKeys.uniqueNumber] = value }
        if let value = totalCardPayment { dictionary[SerializationKeys.totalCardPayment] = value }
        if let value = amountTransferPending { dictionary[SerializationKeys.amountTransferPending] = value }
        if let value = driverStatusMessage { dictionary[SerializationKeys.driverStatusMessage] = value }
        if let value = driverCategory { dictionary[SerializationKeys.driverCategory] = value }
        if let value = lastUpdateDate { dictionary[SerializationKeys.lastUpdateDate] = value }
        if let value = cityNameArabic { dictionary[SerializationKeys.cityNameArabic] = value }
        if let value = licenseExpire { dictionary[SerializationKeys.licenseExpire] = value }
        if let value = driverAccountName { dictionary[SerializationKeys.driverAccountName] = value }
        if let value = driverEmail { dictionary[SerializationKeys.driverEmail] = value }
        if let value = paymentTransfer { dictionary[SerializationKeys.paymentTransfer] = value }
        if let value = lastUpdate { dictionary[SerializationKeys.lastUpdate] = value }
        if let value = distance { dictionary[SerializationKeys.distance] = value }
        if let value = driverAccountNumber { dictionary[SerializationKeys.driverAccountNumber] = value }
        if let value = totalCashPayment { dictionary[SerializationKeys.totalCashPayment] = value }
        if let value = currentLocation { dictionary[SerializationKeys.currentLocation] = value }
        if let value = currentLong { dictionary[SerializationKeys.currentLong] = value }
        if let value = carModelName { dictionary[SerializationKeys.carModelName] = value }
        if let value = cityId { dictionary[SerializationKeys.cityId] = value }
        if let value = cancelledRides { dictionary[SerializationKeys.cancelledRides] = value }
        if let value = driverAdminStatus { dictionary[SerializationKeys.driverAdminStatus] = value }
        if let value = cityNameFrench { dictionary[SerializationKeys.cityNameFrench] = value }
        if let value = driverStatusImage { dictionary[SerializationKeys.driverStatusImage] = value }
        if let value = rejectRides { dictionary[SerializationKeys.rejectRides] = value }
        if let value = carTypeName { dictionary[SerializationKeys.carTypeName] = value }
        if let value = driverSignupDate { dictionary[SerializationKeys.driverSignupDate] = value }
        if let value = totalPaymentEraned { dictionary[SerializationKeys.totalPaymentEraned] = value }
        if let value = deviceId { dictionary[SerializationKeys.deviceId] = value }
        if let value = driverImage { dictionary[SerializationKeys.driverImage] = value }
        if let value = registerDate { dictionary[SerializationKeys.registerDate] = value }
        return dictionary
    }
    
}



    
  /*  internal let kDetailsRcKey: String = "rc"
    internal let kDetailsInsuranceKey: String = "insurance"
    internal let kDetailsLastUpdateKey: String = "last_update"
    internal let kDetailsRejectRidesKey: String = "reject_rides"
    internal let kDetailsRatingKey: String = "rating"
    internal let kDetailsDriverEmailKey: String = "driver_email"
    internal let kDetailsDriverImageKey: String = "driver_image"
    internal let kDetailsCarModelNameKey: String = "car_model_name"
    internal let kDetailsFlagKey: String = "flag"
    internal let kDetailsDriverNameKey: String = "driver_name"
    internal let kDetailsCancelledRidesKey: String = "cancelled_rides"
    internal let kDetailsDeviceIdKey: String = "device_id"
    internal let kDetailsLoginLogoutKey: String = "login_logout"
    internal let kDetailsCompletedRidesKey: String = "completed_rides"
    internal let kDetailsStatusKey: String = "driver_admin_status"
    internal let kDetailsBusyKey: String = "busy"
    internal let kDetailsCarModelIdKey: String = "car_model_id"
    internal let kDetailsCarTypeNameKey: String = "car_type_name"
    internal let kDetailsCurrentLocationKey: String = "current_location"
    internal let kDetailsDriverIdKey: String = "driver_id"
    internal let kDetailsDetailStatusKey: String = "detail_status"
    internal let kDetailsCarNumberKey: String = "car_number"
    internal let kDetailsLicenseKey: String = "license"
    internal let kDetailsLastUpdateDateKey: String = "last_update_date"
    internal let kDetailsDriverTokenKey: String = "driver_token"
    internal let kDetailsRegisterDateKey: String = "register_date"
    internal let kDetailsCurrentLatKey: String = "current_lat"
    internal let kDetailsCurrentLongKey: String = "current_long"
    internal let kDetailsDriverPhoneKey: String = "driver_phone"
    internal let kDetailsOnlineOfflineKey: String = "online_offline"
    internal let kDetailsCarTypeIdKey: String = "car_type_id"
    internal let kDetailsCityIdKey: String = "city_id"
    internal let kDetailsDriverPasswordKey: String = "driver_password"
    internal let kDetailsOtherDocsKey: String = "other_docs"
    internal let kDetailsCityName: String =  "city_name"
    internal let kDetailsDriverStatusImage: String = "driver_status_image"
     internal let kDetailsDriverStatusMessage: String = "driver_status_message"
    
    
    // MARK: Properties
    public var rc: String?
    public var insurance: String?
    public var lastUpdate: String?
    public var rejectRides: String?
    public var rating: String?
    public var driverEmail: String?
    public var driverImage: String?
    public var carModelName: String?
    public var flag: String?
    public var driverName: String?
    public var cancelledRides: String?
    public var deviceId: String?
    public var loginLogout: String?
    public var completedRides: String?
    public var status: String?
    public var busy: String?
    public var carModelId: String?
    public var carTypeName: String?
    public var currentLocation: String?
    public var driverId: String?
    public var detailStatus: String?
    public var carNumber: String?
    public var license: String?
    public var lastUpdateDate: String?
    public var driverToken: String?
    public var registerDate: String?
    public var currentLat: String?
    public var currentLong: String?
    public var driverPhone: String?
    public var onlineOffline: String?
    public var carTypeId: String?
    public var cityId: String?
    public var driverPassword: String?
    public var otherDocs: String?
    public var cityname: String?
    public var driverstatusimage: String?
    public var driverstatusmessage: String?
    
    
    // MARK: SwiftyJSON Initalizers
    /**
     Initates the class based on the object
     - parameter object: The object of either Dictionary or Array kind that was passed.
     - returns: An initalized instance of the class.
     */
    convenience public init(object: AnyObject) {
        self.init(json: JSON(object))
    }
    
    /**
     Initates the class based on the JSON that was passed.
     - parameter json: JSON object from SwiftyJSON.
     - returns: An initalized instance of the class.
     */
    public init(json: JSON) {
        rc = json[kDetailsRcKey].string
        insurance = json[kDetailsInsuranceKey].string
        lastUpdate = json[kDetailsLastUpdateKey].string
        rejectRides = json[kDetailsRejectRidesKey].string
        rating = json[kDetailsRatingKey].string
        driverEmail = json[kDetailsDriverEmailKey].string
        driverImage = json[kDetailsDriverImageKey].string
        carModelName = json[kDetailsCarModelNameKey].string
        flag = json[kDetailsFlagKey].string
        driverName = json[kDetailsDriverNameKey].string
        cancelledRides = json[kDetailsCancelledRidesKey].string
        deviceId = json[kDetailsDeviceIdKey].string
        loginLogout = json[kDetailsLoginLogoutKey].string
        completedRides = json[kDetailsCompletedRidesKey].string
        status = json[kDetailsStatusKey].string
        busy = json[kDetailsBusyKey].string
        carModelId = json[kDetailsCarModelIdKey].string
        carTypeName = json[kDetailsCarTypeNameKey].string
        currentLocation = json[kDetailsCurrentLocationKey].string
        driverId = json[kDetailsDriverIdKey].string
        detailStatus = json[kDetailsDetailStatusKey].string
        carNumber = json[kDetailsCarNumberKey].string
        license = json[kDetailsLicenseKey].string
        lastUpdateDate = json[kDetailsLastUpdateDateKey].string
        driverToken = json[kDetailsDriverTokenKey].string
        registerDate = json[kDetailsRegisterDateKey].string
        currentLat = json[kDetailsCurrentLatKey].string
        currentLong = json[kDetailsCurrentLongKey].string
        driverPhone = json[kDetailsDriverPhoneKey].string
        onlineOffline = json[kDetailsOnlineOfflineKey].string
        carTypeId = json[kDetailsCarTypeIdKey].string
        cityId = json[kDetailsCityIdKey].string
        driverPassword = json[kDetailsDriverPasswordKey].string
        otherDocs = json[kDetailsOtherDocsKey].string
        cityname = json[kDetailsCityName].string
        driverstatusimage = json[kDetailsDriverStatusImage].string
        driverstatusmessage = json[kDetailsDriverStatusMessage].string
        
    }
    
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String : AnyObject ] {
        
        var dictionary: [String : AnyObject ] = [ : ]
        if rc != nil {
            dictionary.updateValue(rc! as AnyObject, forKey: kDetailsRcKey)
        }
        if insurance != nil {
            dictionary.updateValue(insurance! as AnyObject, forKey: kDetailsInsuranceKey)
        }
        if lastUpdate != nil {
            dictionary.updateValue(lastUpdate! as AnyObject, forKey: kDetailsLastUpdateKey)
        }
        if rejectRides != nil {
            dictionary.updateValue(rejectRides! as AnyObject, forKey: kDetailsRejectRidesKey)
        }
        if rating != nil {
            dictionary.updateValue(rating! as AnyObject, forKey: kDetailsRatingKey)
        }
        if driverEmail != nil {
            dictionary.updateValue(driverEmail! as AnyObject, forKey: kDetailsDriverEmailKey)
        }
        if driverImage != nil {
            dictionary.updateValue(driverImage! as AnyObject, forKey: kDetailsDriverImageKey)
        }
        if carModelName != nil {
            dictionary.updateValue(carModelName! as AnyObject, forKey: kDetailsCarModelNameKey)
        }
        if flag != nil {
            dictionary.updateValue(flag! as AnyObject, forKey: kDetailsFlagKey)
        }
        if driverName != nil {
            dictionary.updateValue(driverName! as AnyObject, forKey: kDetailsDriverNameKey)
        }
        if cancelledRides != nil {
            dictionary.updateValue(cancelledRides! as AnyObject, forKey: kDetailsCancelledRidesKey)
        }
        if deviceId != nil {
            dictionary.updateValue(deviceId! as AnyObject, forKey: kDetailsDeviceIdKey)
        }
        if loginLogout != nil {
            dictionary.updateValue(loginLogout! as AnyObject, forKey: kDetailsLoginLogoutKey)
        }
        if completedRides != nil {
            dictionary.updateValue(completedRides! as AnyObject, forKey: kDetailsCompletedRidesKey)
        }
        if status != nil {
            dictionary.updateValue(status! as AnyObject, forKey: kDetailsStatusKey)
        }
        if busy != nil {
            dictionary.updateValue(busy! as AnyObject, forKey: kDetailsBusyKey)
        }
        if carModelId != nil {
            dictionary.updateValue(carModelId! as AnyObject, forKey: kDetailsCarModelIdKey)
        }
        if carTypeName != nil {
            dictionary.updateValue(carTypeName! as AnyObject, forKey: kDetailsCarTypeNameKey)
        }
        if currentLocation != nil {
            dictionary.updateValue(currentLocation! as AnyObject, forKey: kDetailsCurrentLocationKey)
        }
        if driverId != nil {
            dictionary.updateValue(driverId! as AnyObject, forKey: kDetailsDriverIdKey)
        }
        if detailStatus != nil {
            dictionary.updateValue(detailStatus! as AnyObject, forKey: kDetailsDetailStatusKey)
        }
        if carNumber != nil {
            dictionary.updateValue(carNumber! as AnyObject, forKey: kDetailsCarNumberKey)
        }
        if license != nil {
            dictionary.updateValue(license! as AnyObject, forKey: kDetailsLicenseKey)
        }
        if lastUpdateDate != nil {
            dictionary.updateValue(lastUpdateDate! as AnyObject, forKey: kDetailsLastUpdateDateKey)
        }
        if driverToken != nil {
            dictionary.updateValue(driverToken! as AnyObject, forKey: kDetailsDriverTokenKey)
        }
        if registerDate != nil {
            dictionary.updateValue(registerDate! as AnyObject, forKey: kDetailsRegisterDateKey)
        }
        if currentLat != nil {
            dictionary.updateValue(currentLat! as AnyObject, forKey: kDetailsCurrentLatKey)
        }
        if currentLong != nil {
            dictionary.updateValue(currentLong! as AnyObject, forKey: kDetailsCurrentLongKey)
        }
        if driverPhone != nil {
            dictionary.updateValue(driverPhone! as AnyObject, forKey: kDetailsDriverPhoneKey)
        }
        if onlineOffline != nil {
            dictionary.updateValue(onlineOffline! as AnyObject, forKey: kDetailsOnlineOfflineKey)
        }
        if carTypeId != nil {
            dictionary.updateValue(carTypeId! as AnyObject, forKey: kDetailsCarTypeIdKey)
        }
        if cityId != nil {
            dictionary.updateValue(cityId! as AnyObject, forKey: kDetailsCityIdKey)
        }
        if driverPassword != nil {
            dictionary.updateValue(driverPassword! as AnyObject, forKey: kDetailsDriverPasswordKey)
        }
        if otherDocs != nil {
            dictionary.updateValue(otherDocs! as AnyObject, forKey: kDetailsOtherDocsKey)
        }
        if cityname != nil {
             dictionary.updateValue(cityname! as AnyObject, forKey: kDetailsCityName)
        }
        if driverstatusimage != nil {
            dictionary.updateValue(driverstatusimage! as AnyObject, forKey: kDetailsCityName)
        }
        if driverstatusmessage != nil {
            dictionary.updateValue(driverstatusmessage! as AnyObject, forKey: kDetailsCityName)
        }
        
        return dictionary
    }
    
    
}*/

