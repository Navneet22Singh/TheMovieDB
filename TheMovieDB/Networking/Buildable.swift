//
//  Buildable.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation

protocol Buildable {
    
    /// HTTP Method: GET
    var httpMethod: HTTPMethod { get }
    
    /// API Path for the request
    var urlString: String? { get }
}

extension Buildable {
    var httpTimeout: HTTPTimeout {
        return .fifteen
    }
}

extension Buildable {
    /// Builds a URL Request object
    func build() -> URLRequest? {
        guard let urlStr = urlString, let url = URL(string: urlStr) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.timeoutInterval = TimeInterval(httpTimeout.rawValue)
        return request
    }
}
