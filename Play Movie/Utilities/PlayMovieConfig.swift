//
//  PlayMovieConfig.swift
//  PlayMovie
//
//  Created by Waqas Ali on 12/5/16.
//  Copyright © 2016 Dinosoftlabs. All rights reserved.
//
import Foundation

enum AppMode: Int {
    case test = 0, production
}

var appMode: AppMode {
    return AppMode.production
}

struct Url {
    
    static func urlString(_ service: Service) -> String {
        
        var servicePath = ""
        
        switch (service) {

        case .popular:
            servicePath = "popular?api_key=\(apiKey)"
            
        }
        
        return self.baseUrl + "" + servicePath
    }
    
    static var baseUrl: String {
        var baseUrl = ""
        var tail = ""
        switch appMode {
        case .test:
            baseUrl = ""
            tail = ""
        case .production:
			baseUrl = "https://api.themoviedb.org/"
			tail = "3/movie/"
        }
        
        return baseUrl + tail
    }
    
    enum Service {
        case popular
    }
}
