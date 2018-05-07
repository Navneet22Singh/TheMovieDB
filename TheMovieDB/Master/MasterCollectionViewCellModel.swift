//
//  MasterCollectionViewCellModel.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation
import UIKit

class MasterCollectionViewCellModel {
    
    let defaultImage = #imageLiteral(resourceName: "default_image")
    let imagePath: String?
    
    var image: UIImage?
    
    // int
    init(path: String?) {
        imagePath = path
        
        if let key = path as NSString? {
            image = Caching.shared.image(forKey: key)
        } else {
            image = defaultImage
        }
    }
    
    // Cache incoming image
    fileprivate func cacheImage(_ image: UIImage, forKey key: String) {
        Caching.shared.setImage(image, forKey: key as NSString)
    }
    
    // Download image
    func downloadImage(_ serviceController: Fetchable = ServiceController(), completion: @escaping ((Bool) -> ())) {
        guard let path = imagePath else {
            image = defaultImage
            completion(false)
            return
        }
        
        let params = BannerImageParams(path: path)
        serviceController.download(with: params) { [weak self] (image, error) in
            guard let image = image else {
                self?.image = self?.defaultImage
                completion(false)
                return
            }

            self?.cacheImage(image, forKey: path)
            self?.image = image
            completion(true)
        }
    }
}
