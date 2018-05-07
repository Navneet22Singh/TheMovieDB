//
//  DetailViewModel.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation
import UIKit

struct DetailViewModel {
    let title = "Details"
    
    let movieName: String?
    let overview: String?
    let rating: String?
    let image: UIImage
    
    // Init
    init(movie: Movie?) {
        movieName = movie?.title
        overview = movie?.overview
        
        if let ratingValue = movie?.rating, ratingValue > 0.0 {
            rating = "\(String(describing: ratingValue)) rating"
        } else {
            rating = "Rating not avaibale"
        }
        
        if let path = movie?.posterPath as NSString? {
            image = Caching.shared.image(forKey: path) ?? #imageLiteral(resourceName: "default_image")
        } else {
            image = #imageLiteral(resourceName: "default_image")
        }
    }
}
