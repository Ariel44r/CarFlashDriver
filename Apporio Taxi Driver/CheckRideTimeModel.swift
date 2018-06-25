//
//  CheckRideTimeModel.swift
//
//  Created by Atul Jain on 21/12/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CheckRideTimeModel {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let result = "result"
    static let msg = "msg"
  }

  // MARK: Properties
  public var result: Int?
  public var msg: String?

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
    result = json[SerializationKeys.result].int
    msg = json[SerializationKeys.msg].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = result { dictionary[SerializationKeys.result] = value }
    if let value = msg { dictionary[SerializationKeys.msg] = value }
    return dictionary
  }

}
