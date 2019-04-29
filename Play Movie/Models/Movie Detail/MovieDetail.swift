//
//	MovieDetail.swift
//
//	Create by Waqas Ali on 17/4/2019

import Foundation
import Realm
import RealmSwift

class MovieDetail: Object {

	@objc dynamic var adult: Bool = false
	@objc dynamic var backdropPath: String! = ""
	@objc dynamic var belongsToCollection: String! = ""
	@objc dynamic var budget: Int = 0
	dynamic var genres = List<Genre>()
	@objc dynamic var homepage: String! = ""
	@objc dynamic var id: Int = 0
	@objc dynamic var imdbId: String! = ""
	@objc dynamic var originalLanguage: String! = ""
	@objc dynamic var originalTitle: String! = ""
	@objc dynamic var overview: String! = ""
	@objc dynamic var popularity: Float = 0.0
	@objc dynamic var posterPath: String! = ""
	dynamic var productionCompanies = List<ProductionCompany>()
	dynamic var productionCountries = List<ProductionCountry>()
	@objc dynamic var releaseDate: String! = ""
	@objc dynamic var revenue: Int = 0
	@objc dynamic var runtime: Int = 0
	dynamic var spokenLanguages = List<SpokenLanguage>()
	@objc dynamic var status: String! = ""
	@objc dynamic var tagline: String! = ""
	@objc dynamic var title: String! = ""
	@objc dynamic var video: Bool = false
	@objc dynamic var voteAverage: Float = 0.0
	@objc dynamic var voteCount: Int = 0


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	class func fromDictionary(dictionary: [String:Any]) -> MovieDetail {
		let this = MovieDetail()
		if let adultValue = dictionary["adult"] as? Bool {
			this.adult = adultValue
		}
		if let backdropPathValue = dictionary["backdrop_path"] as? String {
			this.backdropPath = backdropPathValue
		}
		if let belongsToCollectionValue = dictionary["belongs_to_collection"] as? String {
			this.belongsToCollection = belongsToCollectionValue
		}
		if let budgetValue = dictionary["budget"] as? Int{
			this.budget = budgetValue
		}
		if let genresArray = dictionary["genres"] as? [[String:Any]]{
            let genresItems = List<Genre>()
			for dic in genresArray{
                let value = Genre.fromDictionary(dictionary: dic)
				genresItems.append(value)
			}
			this.genres = genresItems
		}
		if let homepageValue = dictionary["homepage"] as? String {
			this.homepage = homepageValue
		}
		if let idValue = dictionary["id"] as? Int {
			this.id = idValue
		}
		if let imdbIdValue = dictionary["imdb_id"] as? String {
			this.imdbId = imdbIdValue
		}
		if let originalLanguageValue = dictionary["original_language"] as? String {
			this.originalLanguage = originalLanguageValue
		}
		if let originalTitleValue = dictionary["original_title"] as? String {
			this.originalTitle = originalTitleValue
		}
		if let overviewValue = dictionary["overview"] as? String {
			this.overview = overviewValue
		}
		if let popularityValue = dictionary["popularity"] as? Float {
			this.popularity = popularityValue
		}
		if let posterPathValue = dictionary["poster_path"] as? String {
			this.posterPath = posterPathValue
		}
		if let productionCompaniesArray = dictionary["production_companies"] as? [[String:Any]]{
            let productionCompaniesItems = List<ProductionCompany>()
			for dic in productionCompaniesArray{
                let value = ProductionCompany.fromDictionary(dictionary: dic)
				productionCompaniesItems.append(value)
			}
			this.productionCompanies = productionCompaniesItems
		}
		if let productionCountriesArray = dictionary["production_countries"] as? [[String:Any]] {
            let productionCountriesItems = List<ProductionCountry>()
			for dic in productionCountriesArray {
				let value = ProductionCountry.fromDictionary(dictionary: dic)
				productionCountriesItems.append(value)
			}
			this.productionCountries = productionCountriesItems
		}
		if let releaseDateValue = dictionary["release_date"] as? String {
			this.releaseDate = releaseDateValue
		}
		if let revenueValue = dictionary["revenue"] as? Int {
			this.revenue = revenueValue
		}
		if let runtimeValue = dictionary["runtime"] as? Int {
			this.runtime = runtimeValue
		}
		if let spokenLanguagesArray = dictionary["spoken_languages"] as? [[String:Any]] {
            let spokenLanguagesItems = List<SpokenLanguage>()
			for dic in spokenLanguagesArray {
				let value = SpokenLanguage.fromDictionary(dictionary: dic)
				spokenLanguagesItems.append(value)
			}
			this.spokenLanguages = spokenLanguagesItems
		}
		if let statusValue = dictionary["status"] as? String {
			this.status = statusValue
		}
		if let taglineValue = dictionary["tagline"] as? String {
			this.tagline = taglineValue
		}
		if let titleValue = dictionary["title"] as? String {
			this.title = titleValue
		}
		if let videoValue = dictionary["video"] as? Bool {
			this.video = videoValue
		}
		if let voteAverageValue = dictionary["vote_average"] as? Float {
			this.voteAverage = voteAverageValue
		}
		if let voteCountValue = dictionary["vote_count"] as? Int {
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
		dictionary["adult"] = adult
		if backdropPath != nil{
			dictionary["backdrop_path"] = backdropPath
		}
		if belongsToCollection != nil{
			dictionary["belongs_to_collection"] = belongsToCollection
		}
		dictionary["budget"] = budget
		if genres != nil{
			var dictionaryElements = [[String:Any]]()
			for i in 0 ..< genres.count {
				if let genresElement = genres[i] as? Genre{
					dictionaryElements.append(genresElement.toDictionary())
				}
			}
			dictionary["genres"] = dictionaryElements
		}
		if homepage != nil{
			dictionary["homepage"] = homepage
		}
		dictionary["id"] = id
		if imdbId != nil{
			dictionary["imdb_id"] = imdbId
		}
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
		if productionCompanies != nil{
			var dictionaryElements = [[String:Any]]()
			for i in 0 ..< productionCompanies.count {
				if let productionCompaniesElement = productionCompanies[i] as? ProductionCompany{
					dictionaryElements.append(productionCompaniesElement.toDictionary())
				}
			}
			dictionary["production_companies"] = dictionaryElements
		}
		if productionCountries != nil{
			var dictionaryElements = [[String:Any]]()
			for i in 0 ..< productionCountries.count {
				if let productionCountriesElement = productionCountries[i] as? ProductionCountry{
					dictionaryElements.append(productionCountriesElement.toDictionary())
				}
			}
			dictionary["production_countries"] = dictionaryElements
		}
		if releaseDate != nil{
			dictionary["release_date"] = releaseDate
		}
		dictionary["revenue"] = revenue
		dictionary["runtime"] = runtime
		if spokenLanguages != nil{
			var dictionaryElements = [[String:Any]]()
			for i in 0 ..< spokenLanguages.count {
				if let spokenLanguagesElement = spokenLanguages[i] as? SpokenLanguage{
					dictionaryElements.append(spokenLanguagesElement.toDictionary())
				}
			}
			dictionary["spoken_languages"] = dictionaryElements
		}
		if status != nil{
			dictionary["status"] = status
		}
		if tagline != nil{
			dictionary["tagline"] = tagline
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
