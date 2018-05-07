//
//  ServiceController.swift
//  TheMovieDB
//
//  Created by Navneet on 5/6/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation
import UIKit

typealias CompletionBlock = ((_ results: MoviesResult?, _ error: Error?) -> ())?
typealias DownloadBlock = ((_ image: UIImage?, _ error: Error?) -> ())?

protocol Fetchable {
    func fetch(with params: Buildable, completion: CompletionBlock)
    func download(with params: Buildable, completion: DownloadBlock)
}

// MARK: - ServiceController to handle netwoking
struct ServiceController: Fetchable {
    
    // MARK: - Fetch movie list
    func fetch(with params: Buildable, completion: CompletionBlock) {
        guard let request = params.build() else {
            completion?(nil, nil)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            guard error == nil, let data = data else {
                print(error.debugDescription)
                completion?(nil, error)
                return
            }
            
            let results = try? JSONDecoder().decode(MoviesResult.self, from: data)
            completion?(results, error)
        })
        
        dataTask.resume()
    }
    
    // MARK: - Download image of a movie
    func download(with params: Buildable, completion: DownloadBlock) {
        guard let request = params.build() else {
            completion?(nil, nil)
            return
        }
        
        let downloadTask = URLSession.shared.downloadTask(with: request, completionHandler: { (tempURL, response, error) in
            guard error == nil, let url = tempURL, let data = try? Data(contentsOf: url) else {
                print(error.debugDescription)
                completion?(nil, error)
                return
            }
            
            completion?(UIImage(data: data), nil)
        })
        
        downloadTask.resume()
    }
}
