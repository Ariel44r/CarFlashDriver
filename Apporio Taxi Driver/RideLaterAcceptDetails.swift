//
//  Details.swift
//
//  Created by Atul Jain on 21/12/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class RideLaterAcceptDetails {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let rideImage = "ride_image"
    static let verificationStatus = "verification_status"
    static let facebookFirstname = "facebook_firstname"
    static let userEmail = "user_email"
    static let googleToken = "google_token"
    static let couponCode = "coupon_code"
    static let laterTime = "later_time"
    static let pickupLocation = "pickup_location"
    static let pickupLat = "pickup_lat"
    static let driverToken = "driver_token"
    static let driverBankName = "driver_bank_name"
    static let userPhone = "user_phone"
    static let carDescription = "car_description"
    static let busy = "busy"
    static let dropLong = "drop_long"
    static let driverRating = "driver_rating"
    static let carAdminStatus = "car_admin_status"
    static let cardId = "card_id"
    static let driverPassword = "driver_password"
    static let rideMode = "ride_mode"
    static let rideDate = "ride_date"
    static let userRating = "user_rating"
    static let verfiyDocument = "verfiy_document"
    static let rideAdminStatus = "ride_admin_status"
    static let carTypeNameFrench = "car_type_name_french"
    static let cartypeImageSize = "cartype_image_size"
    static let pickupLong = "pickup_long"
    static let completedRides = "completed_rides"
    static let companyPayment = "company_payment"
    static let license = "license"
    static let detailStatus = "detail_status"
    static let referralCodeSend = "referral_code_send"
    static let carTypeId = "car_type_id"
    static let driverPhone = "driver_phone"
    static let flag = "flag"
    static let userName = "user_name"
    static let verificationDate = "verification_date"
    static let rcExpire = "rc_expire"
    static let rideStatus = "ride_status"
    static let totalCardPayment = "total_card_payment"
    static let googleId = "google_id"
    static let userSignupDate = "user_signup_date"
    static let driverCategory = "driver_category"
    static let userDelete = "user_delete"
    static let cartypeBigImage = "cartype_big_image"
    static let licenseExpire = "license_expire"
    static let driverEmail = "driver_email"
    static let driverAccountName = "driver_account_name"
    static let userSignupType = "user_signup_type"
    static let lastUpdate = "last_update"
    static let dropLat = "drop_lat"
    static let driverAccountNumber = "driver_account_number"
    static let facebookMail = "facebook_mail"
    static let driverAdminStatus = "driver_admin_status"
    static let date = "date"
    static let rejectRides = "reject_rides"
    static let carTypeName = "car_type_name"
    static let driverSignupDate = "driver_signup_date"
    static let facebookLastname = "facebook_lastname"
    static let status = "status"
    static let rideTime = "ride_time"
    static let referralCode = "referral_code"
    static let userType = "user_type"
    static let facebookId = "facebook_id"
    static let userId = "user_id"
    static let rideType = "ride_type"
    static let deviceId = "device_id"
    static let tokenCreated = "token_created"
    static let dropLocation = "drop_location"
    static let insuranceExpire = "insurance_expire"
    static let driverName = "driver_name"
    static let carLongdescriptionArabic = "car_longdescription_arabic"
    static let driverPayment = "driver_payment"
    static let freeRides = "free_rides"
    static let totalDocumentNeed = "total_document_need"
    static let carDescriptionArabic = "car_description_arabic"
    static let userImage = "user_image"
    static let paymentStatus = "payment_status"
    static let facebookToken = "facebook_token"
    static let carTypeImage = "car_type_image"
    static let emailVerified = "email_verified"
    static let carNumber = "car_number"
    static let otherDocs = "other_docs"
    static let carLongdescription = "car_longdescription"
    static let commission = "commission"
    static let passwordCreated = "password_created"
    static let carModelId = "car_model_id"
    static let lastTimeStamp = "last_time_stamp"
    static let driverId = "driver_id"
    static let rating = "rating"
    static let insurance = "insurance"
    static let loginLogout = "login_logout"
    static let facebookImage = "facebook_image"
    static let onlineOffline = "online_offline"
    static let ridePlatform = "ride_platform"
    static let laterDate = "later_date"
    static let rc = "rc"
    static let companyId = "company_id"
    static let currentLat = "current_lat"
    static let pemFile = "pem_file"
    static let uniqueNumber = "unique_number"
    static let rideId = "ride_id"
    static let amountTransferPending = "amount_transfer_pending"
    static let driverStatusMessage = "driver_status_message"
    static let phoneVerified = "phone_verified"
    static let googleName = "google_name"
    static let lastUpdateDate = "last_update_date"
    static let paymentTransfer = "payment_transfer"
    static let userPassword = "user_password"
    static let googleImage = "google_image"
    static let googleMail = "google_mail"
    static let totalCashPayment = "total_cash_payment"
    static let currentLocation = "current_location"
    static let walletMoney = "wallet_money"
    static let currentLong = "current_long"
    static let cityId = "city_id"
    static let carNameArabic = "car_name_arabic"
    static let cancelledRides = "cancelled_rides"
    static let reasonId = "reason_id"
    static let driverStatusImage = "driver_status_image"
    static let totalPaymentEraned = "total_payment_eraned"
    static let driverImage = "driver_image"
    static let registerDate = "register_date"
    static let paymentOptionId = "payment_option_id"
  }

  // MARK: Properties
  public var rideImage: String?
  public var verificationStatus: String?
  public var facebookFirstname: String?
  public var userEmail: String?
  public var googleToken: String?
  public var couponCode: String?
  public var laterTime: String?
  public var pickupLocation: String?
  public var pickupLat: String?
  public var driverToken: String?
  public var driverBankName: String?
  public var userPhone: String?
  public var carDescription: String?
  public var busy: String?
  public var dropLong: String?
  public var driverRating: String?
  public var carAdminStatus: String?
  public var cardId: String?
  public var driverPassword: String?
  public var rideMode: String?
  public var rideDate: String?
  public var userRating: String?
  public var verfiyDocument: String?
  public var rideAdminStatus: String?
  public var carTypeNameFrench: String?
  public var cartypeImageSize: String?
  public var pickupLong: String?
  public var completedRides: String?
  public var companyPayment: String?
  public var license: String?
  public var detailStatus: String?
  public var referralCodeSend: String?
  public var carTypeId: String?
  public var driverPhone: String?
  public var flag: String?
  public var userName: String?
  public var verificationDate: String?
  public var rcExpire: String?
  public var rideStatus: String?
  public var totalCardPayment: String?
  public var googleId: String?
  public var userSignupDate: String?
  public var driverCategory: String?
  public var userDelete: String?
  public var cartypeBigImage: String?
  public var licenseExpire: String?
  public var driverEmail: String?
  public var driverAccountName: String?
  public var userSignupType: String?
  public var lastUpdate: String?
  public var dropLat: String?
  public var driverAccountNumber: String?
  public var facebookMail: String?
  public var driverAdminStatus: String?
  public var date: String?
  public var rejectRides: String?
  public var carTypeName: String?
  public var driverSignupDate: String?
  public var facebookLastname: String?
  public var status: String?
  public var rideTime: String?
  public var referralCode: String?
  public var userType: String?
  public var facebookId: String?
  public var userId: String?
  public var rideType: String?
  public var deviceId: String?
  public var tokenCreated: String?
  public var dropLocation: String?
  public var insuranceExpire: String?
  public var driverName: String?
  public var carLongdescriptionArabic: String?
  public var driverPayment: String?
  public var freeRides: String?
  public var totalDocumentNeed: String?
  public var carDescriptionArabic: String?
  public var userImage: String?
  public var paymentStatus: String?
  public var facebookToken: String?
  public var carTypeImage: String?
  public var emailVerified: String?
  public var carNumber: String?
  public var otherDocs: String?
  public var carLongdescription: String?
  public var commission: String?
  public var passwordCreated: String?
  public var carModelId: String?
  public var lastTimeStamp: String?
  public var driverId: String?
  public var rating: String?
  public var insurance: String?
  public var loginLogout: String?
  public var facebookImage: String?
  public var onlineOffline: String?
  public var ridePlatform: String?
  public var laterDate: String?
  public var rc: String?
  public var companyId: String?
  public var currentLat: String?
  public var pemFile: String?
  public var uniqueNumber: String?
  public var rideId: String?
  public var amountTransferPending: String?
  public var driverStatusMessage: String?
  public var phoneVerified: String?
  public var googleName: String?
  public var lastUpdateDate: String?
  public var paymentTransfer: String?
  public var userPassword: String?
  public var googleImage: String?
  public var googleMail: String?
  public var totalCashPayment: String?
  public var currentLocation: String?
  public var walletMoney: String?
  public var currentLong: String?
  public var cityId: String?
  public var carNameArabic: String?
  public var cancelledRides: String?
  public var reasonId: String?
  public var driverStatusImage: String?
  public var totalPaymentEraned: String?
  public var driverImage: String?
  public var registerDate: String?
  public var paymentOptionId: String?

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
    rideImage = json[SerializationKeys.rideImage].string
    verificationStatus = json[SerializationKeys.verificationStatus].string
    facebookFirstname = json[SerializationKeys.facebookFirstname].string
    userEmail = json[SerializationKeys.userEmail].string
    googleToken = json[SerializationKeys.googleToken].string
    couponCode = json[SerializationKeys.couponCode].string
    laterTime = json[SerializationKeys.laterTime].string
    pickupLocation = json[SerializationKeys.pickupLocation].string
    pickupLat = json[SerializationKeys.pickupLat].string
    driverToken = json[SerializationKeys.driverToken].string
    driverBankName = json[SerializationKeys.driverBankName].string
    userPhone = json[SerializationKeys.userPhone].string
    carDescription = json[SerializationKeys.carDescription].string
    busy = json[SerializationKeys.busy].string
    dropLong = json[SerializationKeys.dropLong].string
    driverRating = json[SerializationKeys.driverRating].string
    carAdminStatus = json[SerializationKeys.carAdminStatus].string
    cardId = json[SerializationKeys.cardId].string
    driverPassword = json[SerializationKeys.driverPassword].string
    rideMode = json[SerializationKeys.rideMode].string
    rideDate = json[SerializationKeys.rideDate].string
    userRating = json[SerializationKeys.userRating].string
    verfiyDocument = json[SerializationKeys.verfiyDocument].string
    rideAdminStatus = json[SerializationKeys.rideAdminStatus].string
    carTypeNameFrench = json[SerializationKeys.carTypeNameFrench].string
    cartypeImageSize = json[SerializationKeys.cartypeImageSize].string
    pickupLong = json[SerializationKeys.pickupLong].string
    completedRides = json[SerializationKeys.completedRides].string
    companyPayment = json[SerializationKeys.companyPayment].string
    license = json[SerializationKeys.license].string
    detailStatus = json[SerializationKeys.detailStatus].string
    referralCodeSend = json[SerializationKeys.referralCodeSend].string
    carTypeId = json[SerializationKeys.carTypeId].string
    driverPhone = json[SerializationKeys.driverPhone].string
    flag = json[SerializationKeys.flag].string
    userName = json[SerializationKeys.userName].string
    verificationDate = json[SerializationKeys.verificationDate].string
    rcExpire = json[SerializationKeys.rcExpire].string
    rideStatus = json[SerializationKeys.rideStatus].string
    totalCardPayment = json[SerializationKeys.totalCardPayment].string
    googleId = json[SerializationKeys.googleId].string
    userSignupDate = json[SerializationKeys.userSignupDate].string
    driverCategory = json[SerializationKeys.driverCategory].string
    userDelete = json[SerializationKeys.userDelete].string
    cartypeBigImage = json[SerializationKeys.cartypeBigImage].string
    licenseExpire = json[SerializationKeys.licenseExpire].string
    driverEmail = json[SerializationKeys.driverEmail].string
    driverAccountName = json[SerializationKeys.driverAccountName].string
    userSignupType = json[SerializationKeys.userSignupType].string
    lastUpdate = json[SerializationKeys.lastUpdate].string
    dropLat = json[SerializationKeys.dropLat].string
    driverAccountNumber = json[SerializationKeys.driverAccountNumber].string
    facebookMail = json[SerializationKeys.facebookMail].string
    driverAdminStatus = json[SerializationKeys.driverAdminStatus].string
    date = json[SerializationKeys.date].string
    rejectRides = json[SerializationKeys.rejectRides].string
    carTypeName = json[SerializationKeys.carTypeName].string
    driverSignupDate = json[SerializationKeys.driverSignupDate].string
    facebookLastname = json[SerializationKeys.facebookLastname].string
    status = json[SerializationKeys.status].string
    rideTime = json[SerializationKeys.rideTime].string
    referralCode = json[SerializationKeys.referralCode].string
    userType = json[SerializationKeys.userType].string
    facebookId = json[SerializationKeys.facebookId].string
    userId = json[SerializationKeys.userId].string
    rideType = json[SerializationKeys.rideType].string
    deviceId = json[SerializationKeys.deviceId].string
    tokenCreated = json[SerializationKeys.tokenCreated].string
    dropLocation = json[SerializationKeys.dropLocation].string
    insuranceExpire = json[SerializationKeys.insuranceExpire].string
    driverName = json[SerializationKeys.driverName].string
    carLongdescriptionArabic = json[SerializationKeys.carLongdescriptionArabic].string
    driverPayment = json[SerializationKeys.driverPayment].string
    freeRides = json[SerializationKeys.freeRides].string
    totalDocumentNeed = json[SerializationKeys.totalDocumentNeed].string
    carDescriptionArabic = json[SerializationKeys.carDescriptionArabic].string
    userImage = json[SerializationKeys.userImage].string
    paymentStatus = json[SerializationKeys.paymentStatus].string
    facebookToken = json[SerializationKeys.facebookToken].string
    carTypeImage = json[SerializationKeys.carTypeImage].string
    emailVerified = json[SerializationKeys.emailVerified].string
    carNumber = json[SerializationKeys.carNumber].string
    otherDocs = json[SerializationKeys.otherDocs].string
    carLongdescription = json[SerializationKeys.carLongdescription].string
    commission = json[SerializationKeys.commission].string
    passwordCreated = json[SerializationKeys.passwordCreated].string
    carModelId = json[SerializationKeys.carModelId].string
    lastTimeStamp = json[SerializationKeys.lastTimeStamp].string
    driverId = json[SerializationKeys.driverId].string
    rating = json[SerializationKeys.rating].string
    insurance = json[SerializationKeys.insurance].string
    loginLogout = json[SerializationKeys.loginLogout].string
    facebookImage = json[SerializationKeys.facebookImage].string
    onlineOffline = json[SerializationKeys.onlineOffline].string
    ridePlatform = json[SerializationKeys.ridePlatform].string
    laterDate = json[SerializationKeys.laterDate].string
    rc = json[SerializationKeys.rc].string
    companyId = json[SerializationKeys.companyId].string
    currentLat = json[SerializationKeys.currentLat].string
    pemFile = json[SerializationKeys.pemFile].string
    uniqueNumber = json[SerializationKeys.uniqueNumber].string
    rideId = json[SerializationKeys.rideId].string
    amountTransferPending = json[SerializationKeys.amountTransferPending].string
    driverStatusMessage = json[SerializationKeys.driverStatusMessage].string
    phoneVerified = json[SerializationKeys.phoneVerified].string
    googleName = json[SerializationKeys.googleName].string
    lastUpdateDate = json[SerializationKeys.lastUpdateDate].string
    paymentTransfer = json[SerializationKeys.paymentTransfer].string
    userPassword = json[SerializationKeys.userPassword].string
    googleImage = json[SerializationKeys.googleImage].string
    googleMail = json[SerializationKeys.googleMail].string
    totalCashPayment = json[SerializationKeys.totalCashPayment].string
    currentLocation = json[SerializationKeys.currentLocation].string
    walletMoney = json[SerializationKeys.walletMoney].string
    currentLong = json[SerializationKeys.currentLong].string
    cityId = json[SerializationKeys.cityId].string
    carNameArabic = json[SerializationKeys.carNameArabic].string
    cancelledRides = json[SerializationKeys.cancelledRides].string
    reasonId = json[SerializationKeys.reasonId].string
    driverStatusImage = json[SerializationKeys.driverStatusImage].string
    totalPaymentEraned = json[SerializationKeys.totalPaymentEraned].string
    driverImage = json[SerializationKeys.driverImage].string
    registerDate = json[SerializationKeys.registerDate].string
    paymentOptionId = json[SerializationKeys.paymentOptionId].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = rideImage { dictionary[SerializationKeys.rideImage] = value }
    if let value = verificationStatus { dictionary[SerializationKeys.verificationStatus] = value }
    if let value = facebookFirstname { dictionary[SerializationKeys.facebookFirstname] = value }
    if let value = userEmail { dictionary[SerializationKeys.userEmail] = value }
    if let value = googleToken { dictionary[SerializationKeys.googleToken] = value }
    if let value = couponCode { dictionary[SerializationKeys.couponCode] = value }
    if let value = laterTime { dictionary[SerializationKeys.laterTime] = value }
    if let value = pickupLocation { dictionary[SerializationKeys.pickupLocation] = value }
    if let value = pickupLat { dictionary[SerializationKeys.pickupLat] = value }
    if let value = driverToken { dictionary[SerializationKeys.driverToken] = value }
    if let value = driverBankName { dictionary[SerializationKeys.driverBankName] = value }
    if let value = userPhone { dictionary[SerializationKeys.userPhone] = value }
    if let value = carDescription { dictionary[SerializationKeys.carDescription] = value }
    if let value = busy { dictionary[SerializationKeys.busy] = value }
    if let value = dropLong { dictionary[SerializationKeys.dropLong] = value }
    if let value = driverRating { dictionary[SerializationKeys.driverRating] = value }
    if let value = carAdminStatus { dictionary[SerializationKeys.carAdminStatus] = value }
    if let value = cardId { dictionary[SerializationKeys.cardId] = value }
    if let value = driverPassword { dictionary[SerializationKeys.driverPassword] = value }
    if let value = rideMode { dictionary[SerializationKeys.rideMode] = value }
    if let value = rideDate { dictionary[SerializationKeys.rideDate] = value }
    if let value = userRating { dictionary[SerializationKeys.userRating] = value }
    if let value = verfiyDocument { dictionary[SerializationKeys.verfiyDocument] = value }
    if let value = rideAdminStatus { dictionary[SerializationKeys.rideAdminStatus] = value }
    if let value = carTypeNameFrench { dictionary[SerializationKeys.carTypeNameFrench] = value }
    if let value = cartypeImageSize { dictionary[SerializationKeys.cartypeImageSize] = value }
    if let value = pickupLong { dictionary[SerializationKeys.pickupLong] = value }
    if let value = completedRides { dictionary[SerializationKeys.completedRides] = value }
    if let value = companyPayment { dictionary[SerializationKeys.companyPayment] = value }
    if let value = license { dictionary[SerializationKeys.license] = value }
    if let value = detailStatus { dictionary[SerializationKeys.detailStatus] = value }
    if let value = referralCodeSend { dictionary[SerializationKeys.referralCodeSend] = value }
    if let value = carTypeId { dictionary[SerializationKeys.carTypeId] = value }
    if let value = driverPhone { dictionary[SerializationKeys.driverPhone] = value }
    if let value = flag { dictionary[SerializationKeys.flag] = value }
    if let value = userName { dictionary[SerializationKeys.userName] = value }
    if let value = verificationDate { dictionary[SerializationKeys.verificationDate] = value }
    if let value = rcExpire { dictionary[SerializationKeys.rcExpire] = value }
    if let value = rideStatus { dictionary[SerializationKeys.rideStatus] = value }
    if let value = totalCardPayment { dictionary[SerializationKeys.totalCardPayment] = value }
    if let value = googleId { dictionary[SerializationKeys.googleId] = value }
    if let value = userSignupDate { dictionary[SerializationKeys.userSignupDate] = value }
    if let value = driverCategory { dictionary[SerializationKeys.driverCategory] = value }
    if let value = userDelete { dictionary[SerializationKeys.userDelete] = value }
    if let value = cartypeBigImage { dictionary[SerializationKeys.cartypeBigImage] = value }
    if let value = licenseExpire { dictionary[SerializationKeys.licenseExpire] = value }
    if let value = driverEmail { dictionary[SerializationKeys.driverEmail] = value }
    if let value = driverAccountName { dictionary[SerializationKeys.driverAccountName] = value }
    if let value = userSignupType { dictionary[SerializationKeys.userSignupType] = value }
    if let value = lastUpdate { dictionary[SerializationKeys.lastUpdate] = value }
    if let value = dropLat { dictionary[SerializationKeys.dropLat] = value }
    if let value = driverAccountNumber { dictionary[SerializationKeys.driverAccountNumber] = value }
    if let value = facebookMail { dictionary[SerializationKeys.facebookMail] = value }
    if let value = driverAdminStatus { dictionary[SerializationKeys.driverAdminStatus] = value }
    if let value = date { dictionary[SerializationKeys.date] = value }
    if let value = rejectRides { dictionary[SerializationKeys.rejectRides] = value }
    if let value = carTypeName { dictionary[SerializationKeys.carTypeName] = value }
    if let value = driverSignupDate { dictionary[SerializationKeys.driverSignupDate] = value }
    if let value = facebookLastname { dictionary[SerializationKeys.facebookLastname] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = rideTime { dictionary[SerializationKeys.rideTime] = value }
    if let value = referralCode { dictionary[SerializationKeys.referralCode] = value }
    if let value = userType { dictionary[SerializationKeys.userType] = value }
    if let value = facebookId { dictionary[SerializationKeys.facebookId] = value }
    if let value = userId { dictionary[SerializationKeys.userId] = value }
    if let value = rideType { dictionary[SerializationKeys.rideType] = value }
    if let value = deviceId { dictionary[SerializationKeys.deviceId] = value }
    if let value = tokenCreated { dictionary[SerializationKeys.tokenCreated] = value }
    if let value = dropLocation { dictionary[SerializationKeys.dropLocation] = value }
    if let value = insuranceExpire { dictionary[SerializationKeys.insuranceExpire] = value }
    if let value = driverName { dictionary[SerializationKeys.driverName] = value }
    if let value = carLongdescriptionArabic { dictionary[SerializationKeys.carLongdescriptionArabic] = value }
    if let value = driverPayment { dictionary[SerializationKeys.driverPayment] = value }
    if let value = freeRides { dictionary[SerializationKeys.freeRides] = value }
    if let value = totalDocumentNeed { dictionary[SerializationKeys.totalDocumentNeed] = value }
    if let value = carDescriptionArabic { dictionary[SerializationKeys.carDescriptionArabic] = value }
    if let value = userImage { dictionary[SerializationKeys.userImage] = value }
    if let value = paymentStatus { dictionary[SerializationKeys.paymentStatus] = value }
    if let value = facebookToken { dictionary[SerializationKeys.facebookToken] = value }
    if let value = carTypeImage { dictionary[SerializationKeys.carTypeImage] = value }
    if let value = emailVerified { dictionary[SerializationKeys.emailVerified] = value }
    if let value = carNumber { dictionary[SerializationKeys.carNumber] = value }
    if let value = otherDocs { dictionary[SerializationKeys.otherDocs] = value }
    if let value = carLongdescription { dictionary[SerializationKeys.carLongdescription] = value }
    if let value = commission { dictionary[SerializationKeys.commission] = value }
    if let value = passwordCreated { dictionary[SerializationKeys.passwordCreated] = value }
    if let value = carModelId { dictionary[SerializationKeys.carModelId] = value }
    if let value = lastTimeStamp { dictionary[SerializationKeys.lastTimeStamp] = value }
    if let value = driverId { dictionary[SerializationKeys.driverId] = value }
    if let value = rating { dictionary[SerializationKeys.rating] = value }
    if let value = insurance { dictionary[SerializationKeys.insurance] = value }
    if let value = loginLogout { dictionary[SerializationKeys.loginLogout] = value }
    if let value = facebookImage { dictionary[SerializationKeys.facebookImage] = value }
    if let value = onlineOffline { dictionary[SerializationKeys.onlineOffline] = value }
    if let value = ridePlatform { dictionary[SerializationKeys.ridePlatform] = value }
    if let value = laterDate { dictionary[SerializationKeys.laterDate] = value }
    if let value = rc { dictionary[SerializationKeys.rc] = value }
    if let value = companyId { dictionary[SerializationKeys.companyId] = value }
    if let value = currentLat { dictionary[SerializationKeys.currentLat] = value }
    if let value = pemFile { dictionary[SerializationKeys.pemFile] = value }
    if let value = uniqueNumber { dictionary[SerializationKeys.uniqueNumber] = value }
    if let value = rideId { dictionary[SerializationKeys.rideId] = value }
    if let value = amountTransferPending { dictionary[SerializationKeys.amountTransferPending] = value }
    if let value = driverStatusMessage { dictionary[SerializationKeys.driverStatusMessage] = value }
    if let value = phoneVerified { dictionary[SerializationKeys.phoneVerified] = value }
    if let value = googleName { dictionary[SerializationKeys.googleName] = value }
    if let value = lastUpdateDate { dictionary[SerializationKeys.lastUpdateDate] = value }
    if let value = paymentTransfer { dictionary[SerializationKeys.paymentTransfer] = value }
    if let value = userPassword { dictionary[SerializationKeys.userPassword] = value }
    if let value = googleImage { dictionary[SerializationKeys.googleImage] = value }
    if let value = googleMail { dictionary[SerializationKeys.googleMail] = value }
    if let value = totalCashPayment { dictionary[SerializationKeys.totalCashPayment] = value }
    if let value = currentLocation { dictionary[SerializationKeys.currentLocation] = value }
    if let value = walletMoney { dictionary[SerializationKeys.walletMoney] = value }
    if let value = currentLong { dictionary[SerializationKeys.currentLong] = value }
    if let value = cityId { dictionary[SerializationKeys.cityId] = value }
    if let value = carNameArabic { dictionary[SerializationKeys.carNameArabic] = value }
    if let value = cancelledRides { dictionary[SerializationKeys.cancelledRides] = value }
    if let value = reasonId { dictionary[SerializationKeys.reasonId] = value }
    if let value = driverStatusImage { dictionary[SerializationKeys.driverStatusImage] = value }
    if let value = totalPaymentEraned { dictionary[SerializationKeys.totalPaymentEraned] = value }
    if let value = driverImage { dictionary[SerializationKeys.driverImage] = value }
    if let value = registerDate { dictionary[SerializationKeys.registerDate] = value }
    if let value = paymentOptionId { dictionary[SerializationKeys.paymentOptionId] = value }
    return dictionary
  }

}
