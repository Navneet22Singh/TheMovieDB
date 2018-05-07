//
//  MovieParamsSpecs.swift
//  TheMovieDBTests
//
//  Created by Navneet on 5/7/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import TheMovieDB

class MovieParamsSpecs: QuickSpec {
    
    override func spec() {
        var params: MovieParams!
        
        beforeEach() {
            params = MovieParams(query: "popularity.desc", page: 1)
        }
        
        describe("Verify service params") {
            context("when intialised", closure: {
                it("should have correct url string", closure: {
                    expect(params.urlString) == "https://api.themoviedb.org/3/discover/movie?api_key=92902f3b6e447dc1b5ae67621de4db57&sort_by=popularity.desc&page=1"
                })
                
                it("should have valid HTTP method type", closure: {
                    expect(params.httpMethod) == HTTPMethod.GET
                })
                
                it("should have valid HTTP time out", closure: {
                    expect(params.httpTimeout) == HTTPTimeout.fifteen
                })
            })
        }
    }
}
