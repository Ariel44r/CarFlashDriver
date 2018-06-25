
//
//  Detail.swift
//
//  Created by Nitu on 15/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Detail1: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailRidesKey: String = "rides"
	internal let kDetailAmountKey: String = "amount"
	internal let kDetailDriverIdKey: String = "driver_id"
	internal let kDetailDriverEarningIdKey: String = "driver_earning_id"
	internal let kDetailDateKey: String = "date"


    // MARK: Properties
	public var rides: String?
	public var amount: String?
	public var driverId: String?
	public var driverEarningId: String?
	public var date: String?


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
		rides = json[kDetailRidesKey].string
		amount = json[kDetailAmountKey].string
		driverId = json[kDetailDriverIdKey].string
		driverEarningId = json[kDetailDriverEarningIdKey].string
		date = json[kDetailDateKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if rides != nil {
			dictionary.updateValue(rides! as AnyObject, forKey: kDetailRidesKey)
		}
		if amount != nil {
			dictionary.updateValue(amount! as AnyObject, forKey: kDetailAmountKey)
		}
		if driverId != nil {
			dictionary.updateValue(driverId! as AnyObject, forKey: kDetailDriverIdKey)
		}
		if driverEarningId != nil {
			dictionary.updateValue(driverEarningId! as AnyObject, forKey: kDetailDriverEarningIdKey)
		}
		if date != nil {
			dictionary.updateValue(date! as AnyObject, forKey: kDetailDateKey)
		}

        return dictionary
    }

}
