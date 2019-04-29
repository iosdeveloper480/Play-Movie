//
//  UserLoader.swift
//  PlayMovie
//
//  Created by Waqas Ali on 04/04/19.
//  Copyright © 2019 Jamisofttech. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieLoader {
    //MARK:-
    var alamofire = PlayMovieManager()
    
    func getMoviesList(parameters: [String: AnyObject]?,
                       successBlock success:@escaping ((_ movies: Movie)-> Void),
                       failureBlock failure:@escaping ((_ error: Error)-> Void)) {
        self.alamofire.requestGET_WithCustomURLEncoding(.popular, parameters: parameters, authorized: false, success: { (response) in
            self.parseMoviesList(response.result.value as! Dictionary, successBlock: success, failureBlock: failure)
        }) { (error) in
            failure(error!)
        }
    }
    
    private func parseMoviesList(_ response: [String: AnyObject],
                                 successBlock success:((_ movies: Movie)-> Void),
                                 failureBlock failure:((_ error: Error)-> Void)) {
        let movie: Movie?
        let json = JSON(response)

        if let status_code = json["status_code"].intValue as? Int {
            if status_code == 7 {
                failure(NSError(errorMessage: json["status_message"].stringValue))
                return
            }
        }
        
//        if json["success"].bool != nil {
//            failure(NSError(errorMessage: json["status_message"].stringValue))
//            return
//        }
        
        movie = Movie.fromDictionary(dictionary: json.dictionaryObject!)
        success(movie!)
    }
    
    
    func getMovieDetail(movie: Result,
                       successBlock success:@escaping ((_ movieDetail: MovieDetail)-> Void),
                       failureBlock failure:@escaping ((_ error: Error)-> Void)) {
        
        let urlString = baseUrl + "\(movie.id)?api_key=\(apiKey)"
        
        self.alamofire.requestGET_WithURLEncoding(withURL: urlString, parameters: nil, authorized: false, success: { (response) in
            self.parseMovieDetail(response.result.value as! Dictionary, successBlock: success, failureBlock: failure)
        }) { (error) in
            failure(error!)
        }
    }
    
    private func parseMovieDetail(_ response: [String: AnyObject],
                                 successBlock success:((_ movieDetail: MovieDetail)-> Void),
                                 failureBlock failure:((_ error: Error)-> Void)) {
        let movie: MovieDetail?
        let json = JSON(response)
        
        if let status_code = json["status_code"].intValue as? Int {
            if status_code == 7 {
                failure(NSError(errorMessage: json["status_message"].stringValue))
                return
            }
        }
        
        movie = MovieDetail.fromDictionary(dictionary: json.dictionaryObject!)
        success(movie!)
    }
    
    func getTrailers(movie: Result,
                        successBlock success:@escaping ((_ trailer: Trailer)-> Void),
                        failureBlock failure:@escaping ((_ error: Error)-> Void)) {
        
        let urlString = baseUrl + "\(movie.id)/videos?api_key=\(apiKey)"
        
        self.alamofire.requestGET_WithURLEncoding(withURL: urlString, parameters: nil, authorized: false, success: { (response) in
            self.parseTrailers(response.result.value as! Dictionary, successBlock: success, failureBlock: failure)
        }) { (error) in
            failure(error!)
        }
    }
    
    private func parseTrailers(_ response: [String: AnyObject],
                                  successBlock success:((_ trailer: Trailer)-> Void),
                                  failureBlock failure:((_ error: Error)-> Void)) {
        let movie: Trailer?
        let json = JSON(response)
        
        if let status_code = json["status_code"].intValue as? Int {
            if status_code == 7 {
                failure(NSError(errorMessage: json["status_message"].stringValue))
                return
            }
        }
        
        movie = Trailer.fromDictionary(dictionary: json.dictionaryObject!)
        success(movie!)
    }
}
