//
//  MaterTableViewCellViewModel.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation

struct MaterTableViewCellViewModel {

    let query: String
    let currentPage: Int
    
    var movies: [Movie]? = []
    
    init(query: String, currentPage: Int) {
        self.query = query
        self.currentPage = currentPage
    }
    
    func fetch(_ completion:CompletionBlock) {
        let serviceController = ServiceController()
        let params = MovieParams(query: query, page: currentPage)
        serviceController.fetch(with: params, completion: completion)
    }
}
