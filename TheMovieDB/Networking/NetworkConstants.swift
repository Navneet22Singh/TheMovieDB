//
//  NetworkConstants.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation

// Http request type
enum HTTPMethod: String {
    case GET
    case POST
}

// Http Timeout
enum HTTPTimeout: Int {
    case fifteen = 15
    case thirty = 30
}

