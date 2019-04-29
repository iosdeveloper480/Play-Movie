//
//	Movie.swift
//
//	Create by Waqas Ali on 17/4/2019

import Foundation
import Realm
import RealmSwift

class Movie: Object {

	@objc dynamic var page: Int = 0
	dynamic var results = List<Result>()
	@objc dynamic var totalPages: Int = 0
	@objc dynamic var totalResults: Int = 0

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	class func fromDictionary(dictionary: [String:Any]) -> Movie {
		let this = Movie()
		if let pageValue = dictionary["page"] as? Int {
			this.page = pageValue
		}
		if let resultsArray = dictionary["results"] as? [[String:Any]]{
            let resultsItems = List<Result>()
			for dic in resultsArray{
                let value = Result.fromDictionary(dictionary: dic)
				resultsItems.append(value)
			}
			this.results = resultsItems
		}
		if let totalPagesValue = dictionary["total_pages"] as? Int{
			this.totalPages = totalPagesValue
		}
		if let totalResultsValue = dictionary["total_results"] as? Int{
			this.totalResults = totalResultsValue
		}
		return this
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		dictionary["page"] = page
		if results != nil{
			var dictionaryElements = [[String:Any]]()
			for i in 0 ..< results.count {
				if let resultsElement = results[i] as? Result {
					dictionaryElements.append(resultsElement.toDictionary())
				}
			}
			dictionary["results"] = dictionaryElements
		}
		dictionary["total_pages"] = totalPages
		dictionary["total_results"] = totalResults
		return dictionary
	}
}
