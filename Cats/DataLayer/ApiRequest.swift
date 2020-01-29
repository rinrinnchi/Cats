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
            
            let facts = results.map { $0["text"].stringValue }.prefix(10)
            completionHandler(Array(facts), .success)
        }
    }
}
