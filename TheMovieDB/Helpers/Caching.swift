//
//  Caching.swift
//  TheMovieDB
//
//  Created by Navneet on 5/7/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation
import UIKit

class Caching {
    static let shared = Caching()
    
    private let imageCache = NSCache<NSString, UIImage>()
    
    func image(forKey key: NSString) -> UIImage? {
        return imageCache.object(forKey: key)
    }
    
    func setImage(_ image: UIImage, forKey key: NSString) {
        imageCache.setObject(image, forKey: key)
    }
}
