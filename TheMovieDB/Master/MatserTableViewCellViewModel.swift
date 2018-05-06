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
    var currentPage: Int = 1
    let cache: NSCache<NSString, UIImage>
    var movies: [Movie] = []
    var totalPages: Int = 1

    init(query: String, currentPage: Int, cache: NSCache<NSString, UIImage>) {
        self.query = query
        self.currentPage = currentPage
        self.cache = cache
    }
    
    func fetch(for page: Int, completion: @escaping ((Bool) -> ())) {
        let serviceController = ServiceController()
        let params = MovieParams(query: query, page: page)
        serviceController.fetch(with: params, completion: { [weak self] (moviesResult, error) in
            guard let moviesResult = moviesResult else {
                completion(false)
                return
            }
            
            self?.totalPages = moviesResult.totalPages
            self?.currentPage = page
            self?.movies.append(contentsOf: moviesResult.movies as [Movie])
            
            completion(true)
        })
    }
}
