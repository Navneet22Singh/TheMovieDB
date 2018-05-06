//
//  MoviesResult.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation

// MARK: - MoviesResult, Movie to store results from the network reponse
public struct MoviesResult: Codable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case movies = "results"
    }
}

struct Movie: Codable {
    let title: String?
    let overview: String?
    let rating: Float?
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case rating = "vote_average"
        case posterPath = "poster_path"
    }
}
