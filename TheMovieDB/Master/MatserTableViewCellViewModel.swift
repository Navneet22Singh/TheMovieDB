//
//  MasterTableViewCellViewModel.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation
import UIKit

struct MasterTableViewCellViewModel {

    let query: String
    let currentPage: Int
    let cache: NSCache<NSString, UIImage>
    var movies: [Movie] = []
    
    init(query: String, currentPage: Int, cache: NSCache<NSString, UIImage>) {
        self.query = query
        self.currentPage = currentPage
        self.cache = cache
    }
    
    func fetch(_ completion:CompletionBlock) {
        let serviceController = ServiceController()
        let params = MovieParams(query: query, page: currentPage)
        serviceController.fetch(with: params, completion: completion)
    }
}
