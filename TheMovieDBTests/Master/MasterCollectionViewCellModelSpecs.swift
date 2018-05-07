//
//  MasterCollectionViewCellModelSpecs.swift
//  TheMovieDBTests
//
//  Created by Navneet on 5/7/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import TheMovieDB

class MasterCollectionViewCellModelSpecs: QuickSpec {
    
    override func spec() {
        var viewModel: MasterCollectionViewCellModel!

        describe("Verify view models attributes") {
            context("when initialized with some poster path", closure: {
                let movie = Movie(title: "Batman", overview: "Sample", rating: 8.7, posterPath: "somevalue")
                beforeEach() {
                    viewModel = MasterCollectionViewCellModel(path: movie.posterPath)
                }

                it("should have correct imagePath", closure: {
                    expect(viewModel.imagePath) == movie.posterPath
                })
            
                it("should not have image", closure: {
                    expect(viewModel.image).to(beNil())
                })
            })
            
            context("when initialized with nil poster path", closure: {
                let movie = Movie(title: "Batman", overview: "Sample", rating: 8.7, posterPath: nil)
                beforeEach() {
                    viewModel = MasterCollectionViewCellModel(path: movie.posterPath)
                }
                
                it("should not have imagePath", closure: {
                    expect(viewModel.imagePath).to(beNil())
                })
                
                it("should have a default image", closure: {
                    expect(viewModel.image == #imageLiteral(resourceName: "default_image")).to(beTruthy())
                })
            })
        }
        
        describe("Verify downloadImage") {
            let movie = Movie(title: "Batman", overview: "Sample", rating: 8.7, posterPath: "somevalue")
            beforeEach() {
                viewModel = MasterCollectionViewCellModel(path: movie.posterPath)
            }

            context("when service fails", closure: {
                it("should have correct output", closure: {
                    let serviceController = MockFailureServiceController()
                    viewModel.downloadImage(serviceController, completion: { success in
                        expect(serviceController.isCalled).toEventually(beTruthy())
                        expect(success).toEventually(beFalsy())
                        expect(viewModel.image == viewModel.defaultImage).toEventually(beTruthy())
                    })
                })
            })
            
            context("when service returns results", closure: {
                it("should have correct output", closure: {
                    let serviceController = MockSuccessServiceController()
                    viewModel.downloadImage(serviceController, completion: { success in
                        expect(serviceController.isCalled).toEventually(beTruthy())
                        expect(success).toEventually(beTruthy())
                        expect(viewModel.image == #imageLiteral(resourceName: "default_image")).toEventually(beTruthy())
                    })
                })
            })
        }
    }
}
