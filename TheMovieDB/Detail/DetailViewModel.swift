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
    
    let imageCache: NSCache<NSString, UIImage>
    
    init(movie: Movie?, cache: NSCache<NSString, UIImage>) {
        imageCache = cache
        movieName = movie?.title
        overview = movie?.overview
        
        rating = "\(String(describing: movie?.rating ?? 0)) rating"
        
        if let path = movie?.posterPath as NSString? {
            image = imageCache.object(forKey: path) ?? #imageLiteral(resourceName: "default_image")
        } else {
            image = #imageLiteral(resourceName: "default_image")
        }
    }
}
