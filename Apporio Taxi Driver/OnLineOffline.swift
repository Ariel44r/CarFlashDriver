//
//  OnLineOffline.swift
//
//  Created by Rakesh kumar on 19/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class OnLineOffline: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kOnLineOfflineResultKey: String = "result"
	internal let kOnLineOfflineMsgKey: String = "msg"
    internal let kOnLineOfflineStatuskey: String = "offline"


    // MARK: Properties
	public var result: Int?
	public var msg: String?
     public var offline: Int?


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
		result = json[kOnLineOfflineResultKey].int
		msg = json[kOnLineOfflineMsgKey].string
         offline = json[kOnLineOfflineStatuskey].int

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if result != nil {
			dictionary.updateValue(result! as AnyObject, forKey: kOnLineOfflineResultKey)
		}
		if msg != nil {
			dictionary.updateValue(msg! as AnyObject, forKey: kOnLineOfflineMsgKey)
		}
        if offline != nil {
            dictionary.updateValue(offline! as AnyObject, forKey: kOnLineOfflineStatuskey)
        }

        return dictionary
    }

}
