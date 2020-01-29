//
//  ApiRequest.swift
//  Cats
//
//  Created by Bao Linh on 2020/01/29.
//  Copyright © 2020 Bao Linh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum NetworkError: Error {
    case failure
    case success
}

class ApiRequest {
    
    func facts(completionHandler: @escaping ([String], NetworkError) -> ()) {
        let url = "https://cat-fact.herokuapp.com/facts"
        
        AF.request(url).responseJSON { response in
            guard let data = response.data else {
                completionHandler([], .failure)
                return
            }
            
            let json = try? JSON(data: data)
            let results = json?["all"].arrayValue ?? []
            guard !results.isEmpty else {
                completionHandler([], .failure)
                return
            }
            
            let facts = results.map { $0["text"].stringValue }.prefix(4)
            completionHandler(Array(facts), .success)
        }
    }
    
    func images(completionHandler: @escaping ([URL?], NetworkError) -> ()) {
        let url = "https://api.thecatapi.com/v1/images/search?limit=10"
        let headers: HTTPHeaders = [
            "x-api-key": "5b4ec40c-a41d-4122-85f5-859caff30466"
        ]
        
        AF.request(url, headers: headers).responseJSON { response in
            guard let data = response.data else {
                completionHandler([], .failure)
                return
            }
            
            let json = try? JSON(data: data)
            let results = json?.arrayValue ?? []
            guard !results.isEmpty else {
                completionHandler([], .failure)
                return
            }
            
            let facts = results.map { URL(string: $0["url"].stringValue) }
            completionHandler(Array(facts), .success)
        }
    }
}
