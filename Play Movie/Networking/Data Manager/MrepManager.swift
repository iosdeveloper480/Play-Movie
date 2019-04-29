//
//  BONetManager.swift
//  BeOrganic
//
//  Created by Waqas Ali on 12/30/16.
//  Copyright © 2016 KLARENZ. All rights reserved.
//

import Alamofire
import SwiftyJSON

class PlayMovieManager: NSObject {
    
    // MARK: Public Methods
    
    func requestGET(_ service: Url.Service,
                    parameters: [String: AnyObject]!,
                    authorized: Bool,
                    success: @escaping ((_ response: DataResponse<Any>) -> Void),
                    failure: ((_ error: Error?) -> Void)!) -> Void {
        let urlString: String = Url.urlString(service)
        let request = SessionManager.default.request(urlString, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: authorizationHeadersIf(authorized))
        
        request.responseJSON { (response) -> Void in
            if response.result.isSuccess {
                success(response)
            } else {
                let error = response.result.error
                failure(error)
            }
        }
    }
    
    func requestGET_WithURLEncoding(_ service: Url.Service,
                    parameters: [String: AnyObject]!,
                    userCache: Bool = false,
                    authorized: Bool,
                    success: @escaping ((_ response: DataResponse<Any>) -> Void),
                    failure: ((_ error: Error?) -> Void)!) -> Void {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 500.0 // seconds
        let urlString: String = Url.urlString(service)
        var request: DataRequest?
        if userCache {
            request = SessionManager.default.requestWithCache(urlString, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString), headers: authorizationHeadersIf(authorized))
        }else {
            request = SessionManager.default.request(urlString, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString), headers: authorizationHeadersIf(authorized))
        }
        request?.responseJSON { (response) -> Void in
            if response.result.isSuccess {
                success(response)
            } else {
                let error = response.result.error
                failure(error)
            }
        }
        
    }
    
    func requestGET_WithURLEncoding(withURL urlString: String,
                                    parameters: [String: AnyObject]!,
                                    authorized: Bool,
                                    success: @escaping ((_ response: DataResponse<Any>) -> Void),
                                    failure: ((_ error: Error?) -> Void)!) -> Void {
//        let urlString: String = Url.urlString(service)
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 500.0 // seconds
        let request = SessionManager.default.request(urlString, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString), headers: authorizationHeadersIf(authorized))
        
        request.responseJSON { (response) -> Void in
            if response.result.isSuccess {
                success(response)
            } else {
                let error = response.result.error
                failure(error)
            }
        }
        
    }
    
    func requestGET_WithCustomURLEncoding(_ service: Url.Service,
                                    parameters: [String: AnyObject]!,
                                    authorized: Bool,
                                    success: @escaping ((_ response: DataResponse<Any>) -> Void),
                                    failure: ((_ error: Error?) -> Void)!) -> Void {
        var urlString: String = Url.urlString(service)
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 50000.0 // seconds

		if let parameters = parameters {
			for k in parameters.keys {
				if let list = parameters[k] as? [[String:Any]] {
					for ls in list {
						for k in ls.keys {
							if urlString.last == "?" {
								urlString += String(describing: k) + "=" + String(describing: ls[k]!)
							}else {
								urlString += "&" + String(describing: k) + "=" + String(describing: ls[k]!)
							}
						}
					}
				}else {
					if urlString.last == "?" {
						urlString += "\(k)=\(String(describing: parameters[k]!))"
					}else {
						urlString += "&\(k)=\(String(describing: parameters[k]!))"
					}
				}
			}
		}
        
        let request = SessionManager.default.request(urlString, method: .get, parameters: nil, encoding: URLEncoding(destination: .queryString), headers: authorizationHeadersIf(authorized))
        
        request.responseJSON { (response) -> Void in
            if response.result.isSuccess {
                success(response)
            } else {
                let error = response.result.error
                failure(error)
            }
        }
        
    }
    
    func requestPost(_ service: Url.Service,
                     parameters: [String: AnyObject]!,
                     authorized: Bool,
                     success: @escaping ((_ response: DataResponse<Any>) -> Void),
                     failure: ((_ error: Error?) -> Void)!) -> Void {
        let urlString: String = Url.urlString(service)
        let request = SessionManager.default.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: authorizationHeadersIf(authorized))
        
        request.responseJSON { (response) -> Void in
            if response.result.isSuccess {
                success(response)
            } else {
                let error = response.result.error
                failure(error)
            }
        }
    }
    
    
    func requestPostWithJSON(_ service: Url.Service,
                             parameters: [String: Any]!,
                             authorized: Bool,
                             success: @escaping ((_ response: DataResponse<Any>) -> Void),
                             failure: ((_ error: Error?) -> Void)!) -> Void {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 500.0 // seconds
        let urlString: String = Url.urlString(service)
        let header = authorizationHeadersIf(authorized)
        let request = SessionManager.default.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header)
        request.responseJSON { (response) -> Void in
            if response.result.isSuccess {
                success(response)
            } else {
                let error = response.result.error! as NSError
                failure(error)
            }
        }
    }
    
    // MARK: Private Methods
    
    fileprivate func authorizationHeadersIf(_ authorized:Bool) -> [String: String]? {
        var headers:[String: String]? = nil
        if authorized {
            headers = ["":""]
        }
//        if authorized {headers = ["Authorization": "Bearer somthing"]}
        return headers
    }
}

extension Alamofire.SessionManager {
    @discardableResult
    open func requestWithCache(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)// also you can add URLRequest.CachePolicy here as parameter
        -> DataRequest
    {
        do {
            var urlRequest = try URLRequest(url: url, method: method, headers: headers)
            urlRequest.cachePolicy = .reloadRevalidatingCacheData // <<== Cache disabled
            let encodedURLRequest = try encoding.encode(urlRequest, with: parameters)
            return request(encodedURLRequest)
        } catch {
            // TODO: find a better way to handle error
            print(error)
            return request(URLRequest(url: URL(string: "http://example.com/wrong_request")!))
        }
    }
}
