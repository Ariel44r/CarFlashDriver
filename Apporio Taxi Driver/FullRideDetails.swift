//
//  FullRideDetails.swift
//
//  Created by Nitu on 15/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class FullRideDetails: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFullRideDetailsRideIdKey: String = "ride_id"
	internal let kFullRideDetailsRideTimeKey: String = "ride_time"
	internal let kFullRideDetailsAmountKey: String = "amount"
      internal let kFullRideDetailsRideModeKey: String = "ride_mode"


    // MARK: Properties
	public var rideId: String?
	public var rideTime: String?
	public var amount: String?
    public var ridemode: String?


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
		rideId = json[kFullRideDetailsRideIdKey].string
		rideTime = json[kFullRideDetailsRideTimeKey].string
		amount = json[kFullRideDetailsAmountKey].string
        ridemode = json[kFullRideDetailsRideModeKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if rideId != nil {
			dictionary.updateValue(rideId! as AnyObject, forKey: kFullRideDetailsRideIdKey)
		}
		if rideTime != nil {
			dictionary.updateValue(rideTime! as AnyObject, forKey: kFullRideDetailsRideTimeKey)
		}
		if amount != nil {
			dictionary.updateValue(amount! as AnyObject, forKey: kFullRideDetailsAmountKey)
		}
        if ridemode != nil {
            dictionary.updateValue(ridemode! as AnyObject, forKey: kFullRideDetailsRideModeKey)
        }

        return dictionary
    }

}
