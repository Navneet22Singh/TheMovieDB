//
//  MasterTableViewCellViewModel.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation
import UIKit

class MasterTableViewCellViewModel {

    let query: String
    let currentPage: Int
    let cache: NSCache<NSString, UIImage>
    var movies: [Movie] = []
    
    init(query: String, currentPage: Int, cache: NSCache<NSString, UIImage>) {
        self.query = query
        self.currentPage = currentPage
        self.cache = cache
    }
    
    func fetch(_ completion: @escaping ((Bool) -> ())) {
        let serviceController = ServiceController()
        let params = MovieParams(query: query, page: currentPage)
        serviceController.fetch(with: params, completion: { [weak self] (moviesResult, error) in
            guard let movies = moviesResult?.movies else {
                completion(false)
                return
            }
            
            self?.movies.append(contentsOf: movies)
            completion(true)
        })
    }
}
