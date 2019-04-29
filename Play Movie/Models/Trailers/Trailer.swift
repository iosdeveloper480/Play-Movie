//
//	Trailer.swift
//
//	Create by Waqas Ali on 18/4/2019

import Foundation
import Realm
import RealmSwift

class Trailer: Object {

	@objc dynamic var id: Int = 0
	dynamic var results = List<TrailerResult>()


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	class func fromDictionary(dictionary: [String:Any]) -> Trailer	{
		let this = Trailer()
		
        if let idValue = dictionary["id"] as? Int {
			this.id = idValue
		}
        
		if let resultsArray = dictionary["results"] as? [[String:Any]] {
            let resultsItems = List<TrailerResult>()
			for dic in resultsArray{
                let value = TrailerResult.fromDictionary(dictionary: dic)
				resultsItems.append(value)
			}
			this.results = resultsItems
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
		if results != nil{
			var dictionaryElements = [[String:Any]]()
			for i in 0 ..< results.count {
				if let resultsElement = results[i] as? TrailerResult {
					dictionaryElements.append(resultsElement.toDictionary())
				}
			}
			dictionary["results"] = dictionaryElements
		}
		return dictionary
	}
}
