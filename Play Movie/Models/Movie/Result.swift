//
//	Result.swift
//
//	Create by Waqas Ali on 17/4/2019

import Foundation
import Realm
import RealmSwift


class Result: Object {

	@objc dynamic var movie: Movie!
	@objc dynamic var adult: Bool = false
	@objc dynamic var backdropPath: String! = ""
	dynamic var genreIds = List<Int>()
	@objc dynamic var id: Int = 0
	@objc dynamic var originalLanguage: String! = ""
	@objc dynamic var originalTitle: String! = ""
	@objc dynamic var overview: String! = ""
	@objc dynamic var popularity: Float = 0.0
	@objc dynamic var posterPath: String! = ""
	@objc dynamic var releaseDate: String! = ""
	@objc dynamic var title: String! = ""
	@objc dynamic var video: Bool = false
	@objc dynamic var voteAverage: Float = 0.0
	@objc dynamic var voteCount: Int = 0


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	class func fromDictionary(dictionary: [String:Any]) -> Result	{
		let this = Result()

		if let adultValue = dictionary["adult"] as? Bool{
			this.adult = adultValue
		}
		if let backdropPathValue = dictionary["backdrop_path"] as? String{
			this.backdropPath = backdropPathValue
		}
		if let genreIdsArray = dictionary["genre_ids"] as? [Int] {
            let genreIdsItems = List<Int>()
			for value in genreIdsArray {
				genreIdsItems.append(value)
			}
			this.genreIds = genreIdsItems
		}
		if let idValue = dictionary["id"] as? Int{
			this.id = idValue
		}
		if let originalLanguageValue = dictionary["original_language"] as? String{
			this.originalLanguage = originalLanguageValue
		}
		if let originalTitleValue = dictionary["original_title"] as? String{
			this.originalTitle = originalTitleValue
		}
		if let overviewValue = dictionary["overview"] as? String{
			this.overview = overviewValue
		}
		if let popularityValue = dictionary["popularity"] as? Float{
			this.popularity = popularityValue
		}
		if let posterPathValue = dictionary["poster_path"] as? String{
			this.posterPath = posterPathValue
		}
		if let releaseDateValue = dictionary["release_date"] as? String{
			this.releaseDate = releaseDateValue
		}
		if let titleValue = dictionary["title"] as? String{
			this.title = titleValue
		}
		if let videoValue = dictionary["video"] as? Bool{
			this.video = videoValue
		}
		if let voteAverageValue = dictionary["vote_average"] as? Float{
			this.voteAverage = voteAverageValue
		}
		if let voteCountValue = dictionary["vote_count"] as? Int{
			this.voteCount = voteCountValue
		}
		return this
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if movie != nil{
			dictionary["Movie"] = movie.toDictionary()
		}
		dictionary["adult"] = adult
		if backdropPath != nil{
			dictionary["backdrop_path"] = backdropPath
		}
		if genreIds != nil {
			var dictionaryElements = [Int]()
			for i in 0 ..< genreIds.count {
				if let genreIdsElement = genreIds[i] as? Int {
					dictionaryElements.append(genreIdsElement)
				}
			}
			dictionary["genre_ids"] = dictionaryElements
		}
		dictionary["id"] = id
		if originalLanguage != nil{
			dictionary["original_language"] = originalLanguage
		}
		if originalTitle != nil{
			dictionary["original_title"] = originalTitle
		}
		if overview != nil{
			dictionary["overview"] = overview
		}
		dictionary["popularity"] = popularity
		if posterPath != nil{
			dictionary["poster_path"] = posterPath
		}
		if releaseDate != nil{
			dictionary["release_date"] = releaseDate
		}
		if title != nil{
			dictionary["title"] = title
		}
		dictionary["video"] = video
		dictionary["vote_average"] = voteAverage
		dictionary["vote_count"] = voteCount
		return dictionary
	}
}
