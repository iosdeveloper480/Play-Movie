//
//	TrailerResult.swift
//
//	Create by Waqas Ali on 18/4/2019

import Foundation
import Realm
import RealmSwift

class TrailerResult: Object {

	@objc dynamic var id: String! = ""
	@objc dynamic var iso31661: String! = ""
	@objc dynamic var iso6391: String! = ""
	@objc dynamic var key: String! = ""
	@objc dynamic var name: String! = ""
	@objc dynamic var site: String! = ""
	@objc dynamic var size: Int = 0
	@objc dynamic var type: String! = ""


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	class func fromDictionary(dictionary: [String:Any]) -> TrailerResult {
		let this = TrailerResult()
        
		if let idValue = dictionary["id"] as? String{
			this.id = idValue
		}
		if let iso31661Value = dictionary["iso_3166_1"] as? String{
			this.iso31661 = iso31661Value
		}
		if let iso6391Value = dictionary["iso_639_1"] as? String{
			this.iso6391 = iso6391Value
		}
		if let keyValue = dictionary["key"] as? String{
			this.key = keyValue
		}
		if let nameValue = dictionary["name"] as? String{
			this.name = nameValue
		}
		if let siteValue = dictionary["site"] as? String{
			this.site = siteValue
		}
		if let sizeValue = dictionary["size"] as? Int{
			this.size = sizeValue
		}
		if let typeValue = dictionary["type"] as? String{
			this.type = typeValue
		}
		return this
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		
		if id != nil{
			dictionary["id"] = id
		}
		if iso31661 != nil{
			dictionary["iso_3166_1"] = iso31661
		}
		if iso6391 != nil{
			dictionary["iso_639_1"] = iso6391
		}
		if key != nil{
			dictionary["key"] = key
		}
		if name != nil{
			dictionary["name"] = name
		}
		if site != nil{
			dictionary["site"] = site
		}
		dictionary["size"] = size
		if type != nil{
			dictionary["type"] = type
		}
		return dictionary
	}
}
