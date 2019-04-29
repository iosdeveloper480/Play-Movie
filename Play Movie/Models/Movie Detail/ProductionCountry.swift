//
//	ProductionCountry.swift
//
//	Create by Waqas Ali on 17/4/2019


import Foundation
import Realm
import RealmSwift

class ProductionCountry: Object {

	@objc dynamic var iso31661: String! = ""
	@objc dynamic var name: String! = ""


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	class func fromDictionary(dictionary: [String:Any]) -> ProductionCountry {
		let this = ProductionCountry()
		
		if let iso31661Value = dictionary["iso_3166_1"] as? String {
			this.iso31661 = iso31661Value
		}
		if let nameValue = dictionary["name"] as? String {
			this.name = nameValue
		}
		return this
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		
		if iso31661 != nil {
			dictionary["iso_3166_1"] = iso31661
		}
		if name != nil {
			dictionary["name"] = name
		}
		return dictionary
	}
}
