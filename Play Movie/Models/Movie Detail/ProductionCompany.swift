//
//	ProductionCompany.swift
//
//	Create by Waqas Ali on 17/4/2019

import Foundation
import Realm
import RealmSwift

class ProductionCompany: Object {

	@objc dynamic var id: Int = 0
	@objc dynamic var logoPath: String! = ""
	@objc dynamic var name: String! = ""
	@objc dynamic var originCountry: String! = ""


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	class func fromDictionary(dictionary: [String:Any]) -> ProductionCompany {
		let this = ProductionCompany()
		
		if let idValue = dictionary["id"] as? Int {
			this.id = idValue
		}
		if let logoPathValue = dictionary["logo_path"] as? String {
			this.logoPath = logoPathValue
		}
		if let nameValue = dictionary["name"] as? String {
			this.name = nameValue
		}
		if let originCountryValue = dictionary["origin_country"] as? String {
			this.originCountry = originCountryValue
		}
		return this
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		
		dictionary["id"] = id
		if logoPath != nil {
			dictionary["logo_path"] = logoPath
		}
		if name != nil {
			dictionary["name"] = name
		}
		if originCountry != nil {
			dictionary["origin_country"] = originCountry
		}
		return dictionary
	}
}
