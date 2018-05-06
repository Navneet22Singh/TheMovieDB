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
    let imageCache: NSCache<NSString, UIImage>?
    let imagePath: String?
    
    var image: UIImage?
    
    init(path: String?, cache: NSCache<NSString, UIImage>?) {
        imageCache = cache
        imagePath = path
        
        if let path = path as NSString? {
            image = imageCache?.object(forKey: path)
        } else {
            image = defaultImage
        }
    }
    
    func downloadImage(_ completion: @escaping ((Bool) -> ())) {
        guard let path = imagePath else {
            completion(false)
            return
        }
        
        let params = BannerImageParams(path: path)
        let serviceController = ServiceController()
        serviceController.download(with: params) { [weak self] (image, error) in
            guard let image = image else {
                self?.image = self?.defaultImage
                completion(false)
                return
            }

            self?.imageCache?.setObject(image, forKey: path as NSString)
            self?.image = image
            completion(true)
        }
    }
    
}
