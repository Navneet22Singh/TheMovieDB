//
//  DetailViewModelSpecs.swift
//  TheMovieDBTests
//
//  Created by Navneet on 5/7/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import TheMovieDB

class DetailViewModelSpecs: QuickSpec {
    
    override func spec() {
        var viewModel: DetailViewModel!
        let movie = Movie(title: "Batman", overview: "Sample", rating: 8.7, posterPath: "somevalue")
        
        beforeEach() {
            viewModel = DetailViewModel(movie: movie)
        }
        
        describe("Verify view model's attributes") {
            context("when initialized with poster path", closure: {
                it("should have correct movieName", closure: {
                    expect(viewModel.movieName) == movie.title
                })
                
                it("should have correct overview", closure: {
                    expect(viewModel.overview) == movie.overview
                })
                
                xit("should have correct rating", closure: {
                    expect(viewModel.rating) == movie.title
                })
                
                it("should have image", closure: {
                    expect(viewModel.image == #imageLiteral(resourceName: "default_image")).to(beTruthy())
                })
            })
            
            context("when initialized with nil poster path and rating", closure: {
                beforeEach {
                    let movie = Movie(title: "Batman", overview: "Sample", rating: nil, posterPath: nil)
                    viewModel = DetailViewModel(movie: movie)
                }
                
                it("should have image", closure: {
                    expect(viewModel.image == #imageLiteral(resourceName: "default_image")).to(beTruthy())
                })
                
                it("should have correct rating", closure: {
                    expect(viewModel.rating) == "Rating not avaibale"
                })
            })
        }
    }
}
