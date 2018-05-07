//
//  MockServiceController.swift
//  TheMovieDBTests
//
//  Created by Navneet on 5/7/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation
@testable import TheMovieDB

private class MockError: Error {
    
}

class MockSuccessMoviesServiceControllerWithResults: Fetchable {
    var isCalled = false
    func fetch(with params: Buildable, completion: CompletionBlock) {
        isCalled = true
        
        let movie = Movie(title: "Batman", overview: "Sample", rating: 8.7, posterPath: "somevalue")
        let results = MoviesResult(page: 1, totalPages: 6, totalResults: 100, movies: [movie])
        completion?(results, nil)
    }
    
    func download(with params: Buildable, completion: DownloadBlock) { }
}

class MockSuccessMoviesServiceControllerWithEmptyResults: Fetchable {
    var isCalled = false
    func fetch(with params: Buildable, completion: CompletionBlock) {
        isCalled = true
        
        let results = MoviesResult(page: 1, totalPages: 6, totalResults: 100, movies: [])
        completion?(results, nil)
    }
    
    func download(with params: Buildable, completion: DownloadBlock) { }
}

class MockFailureMoviesServiceController: Fetchable {
    var isCalled = false
    func fetch(with params: Buildable, completion: CompletionBlock) {
        isCalled = true
        completion?(nil, MockError())
    }
    
    func download(with params: Buildable, completion: DownloadBlock) { }
}

class MockSuccessServiceController: Fetchable {
    var isCalled = false
    
    func download(with params: Buildable, completion: DownloadBlock) {
        isCalled = true
        completion?(#imageLiteral(resourceName: "default_image"), nil)
    }
    
    func fetch(with params: Buildable, completion: CompletionBlock) { }
}

class MockFailureServiceController: Fetchable {
    var isCalled = false
    func download(with params: Buildable, completion: DownloadBlock) {
        isCalled = true
        completion?(nil, MockError())
    }
    
    func fetch(with params: Buildable, completion: CompletionBlock) { }
}
