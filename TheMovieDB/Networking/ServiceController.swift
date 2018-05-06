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

protocol Fetchable {
    func fetch(with params: Buildable, completion: CompletionBlock)
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
                completion?(nil, error)
                return
            }
            
            if let strData = String(data: data, encoding: .utf8) {
                print("Response:\n\(strData)")
            }
            
            let results = try? JSONDecoder().decode(MoviesResult.self, from: data)
            completion?(results, error)
        })
        
        dataTask.resume()
    }
}
