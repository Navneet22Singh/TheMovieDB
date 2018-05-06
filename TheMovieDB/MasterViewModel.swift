//
//  MasterViewModel.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation

struct MasterViewModel {
    
    // MARK: Category
    enum Category {
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
        
        // MARK: URL
        var urlString: String {
            return "https://api.themoviedb.org/3/discover/movie?api_key=92902f3b6e447dc1b5ae67621de4db57&sort_by=\(descSortDescriptor)&page=1"
        }
        
        // MARK: Sort Descriptors
        private var sortDescriptor: String {
            switch self {
            case .popular: return "popularrity"
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

    let title: String
    let categories: [Category]
    
    init() {
        title = "Catalog"
        categories = [.popular, .topRated, .revenue, .releaseDate]
    }
}
