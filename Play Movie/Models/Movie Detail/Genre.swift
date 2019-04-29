//
//	Genre.swift
//
//	Create by Waqas Ali on 17/4/2019


import Foundation
import Realm
import RealmSwift

class Genre: Object {

	@objc dynamic var id: Int = 0
	@objc dynamic var name: String! = ""


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	class func fromDictionary(dictionary: [String:Any]) -> Genre {
		let this = Genre()
        
		if let idValue = dictionary["id"] as? Int {
			this.id = idValue
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
		
		dictionary["id"] = id
		if name != nil {
			dictionary["name"] = name
		}
		return dictionary
	}
}
