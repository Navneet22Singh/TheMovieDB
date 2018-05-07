//
//  MovieParams.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation

struct MovieParams: Buildable {
    let query: String
    let page: Int
    
    //https://api.themoviedb.org/3/discover/movie?api_key=92902f3b6e447dc1b5ae67621de4db57&language=en-US&sort_by=vote_count.desc&include_adult=false&include_video=false&page=1
    private enum MovieConstants: String {
        case baseURL = "https://api.themoviedb.org/3/discover/movie?"
        case apiKey = "92902f3b6e447dc1b5ae67621de4db57"
        
        var value: String {
            return rawValue
        }
    }
    
    var urlString: String? {
        guard let encodedString = query.urlEncodedString else {
            return nil
        }
        
        
        let baseURL = MovieConstants.baseURL.value + "api_key=\(MovieConstants.apiKey.value)"
        let urlStr = baseURL + "&sort_by=\(encodedString)" + "&page=\(page)"
        return urlStr
    }
    
    var httpMethod: HTTPMethod {
        return .GET
    }
    
    var httpTimeout: HTTPTimeout {
        return .fifteen
    }
}

extension String {
    var urlEncodedString: String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
}


