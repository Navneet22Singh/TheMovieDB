//
//  MasterViewModel.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation

// MARK: Category
enum MoviesCategory {
    case popular
    case topRated
    case revenue
    case releaseDate
    
    // MARK: Title
    var title: String {
        switch self {
        case .popular: return "Popular"
        case .topRated: return "Top Rated"
        case .revenue: return "Revenue"
        case .releaseDate: return "Release Date"
        }
    }
    
    // MARK: Sort Descriptors
    private var sortDescriptor: String {
        switch self {
        case .popular: return "popularity"
        case .topRated: return "vote_count"
        case .revenue: return "revenue"
        case .releaseDate: return "release_date"
        }
    }
    
    var descSortDescriptor: String {
        return "\(sortDescriptor).desc"
    }
    
    var ascSortDescriptor: String {
        return "\(sortDescriptor).asc"
    }
}

struct MasterViewModel {
    let title = "Catalog"
    let categories: [MoviesCategory] = [.popular, .topRated, .revenue, .releaseDate]
}
