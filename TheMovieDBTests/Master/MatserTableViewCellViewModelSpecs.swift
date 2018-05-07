//
//  MatserTableViewCellViewModelSpecs.swift
//  TheMovieDBTests
//
//  Created by Navneet on 5/7/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import TheMovieDB

class MatserTableViewCellViewModelSpecs: QuickSpec {
    
    override func spec() {
        var viewModel: MasterTableViewCellViewModel!
        let category = MoviesCategory.popular
        beforeEach() {
            viewModel = MasterTableViewCellViewModel(query: category.descSortDescriptor, currentPage: 1)
        }
        
        describe("Verify view models attributes") {
            context("when initialized", closure: {
                it("should have correct query", closure: {
                    expect(viewModel.query) == category.descSortDescriptor
                })
                
                it("should have correct page number", closure: {
                    expect(viewModel.currentPage) == 1
                })
                
                it("should have correct total pages", closure: {
                    expect(viewModel.totalPages) == 1
                })

                it("should have empty movies array", closure: {
                    expect(viewModel.movies.count) == 0
                })
            })
        }
        
        describe("Verify fetch results") {
            context("when service fails", closure: {
                it("should have correct output", closure: {
                    let serviceController = MockFailureMoviesServiceController()
                    viewModel.fetch(for: 2, serviceController: serviceController, completion: { success in
                        expect(serviceController.isCalled).toEventually(beTruthy())
                        expect(success).toEventually(beFalsy())
                        expect(viewModel.totalPages) == 1
                        expect(viewModel.currentPage) == 1
                    })
                })
            })
            
            context("when service returns an empty results", closure: {
                it("should have correct output", closure: {
                    let serviceController = MockSuccessMoviesServiceControllerWithEmptyResults()
                    viewModel.fetch(for: 2, serviceController: serviceController, completion: { success in
                        expect(serviceController.isCalled).toEventually(beTruthy())
                        expect(success).toEventually(beFalsy())
                        expect(viewModel.totalPages) == 1
                        expect(viewModel.currentPage) == 1
                    })
                })
            })
            
            context("when service returns results", closure: {
                it("should have correct output", closure: {
                    let serviceController = MockSuccessMoviesServiceControllerWithResults()
                    viewModel.fetch(for: 2, serviceController: serviceController, completion: { success in
                        expect(serviceController.isCalled).toEventually(beTruthy())
                        expect(success).toEventually(beTruthy())
                        expect(viewModel.totalPages) == 6
                        expect(viewModel.currentPage) == 2
                    })
                })
            })
        }
    }
}
