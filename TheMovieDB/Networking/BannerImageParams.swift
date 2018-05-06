//
//  BannerImageParams.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation

struct BannerImageParams: Buildable {
    let path: String
    
    private enum BannerImageConstants: String {
        case baseURL = "https://image.tmdb.org/t/p/w500"
        
        var value: String {
            return rawValue
        }
    }
    
    var urlString: String? {
        guard let encodedPath = path.urlEncodedString else {
            return nil
        }
        
        return BannerImageConstants.baseURL.value + "\(encodedPath)"
    }
    
    var httpMethod: HTTPMethod {
        return .GET
    }
    
    var httpTimeout: HTTPTimeout {
        return .thirty
    }
}
