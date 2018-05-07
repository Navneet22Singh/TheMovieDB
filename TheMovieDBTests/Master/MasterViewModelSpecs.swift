//
//  MasterViewModelSpecs.swift
//  TheMovieDBTests
//
//  Created by Navneet on 5/7/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import TheMovieDB

class MasterViewModelSpecs: QuickSpec {
    
    override func spec() {
        var viewModel: MasterViewModel!
        
        beforeEach() {
            viewModel = MasterViewModel()
        }
        
        describe("Verify view models attributes") {
            context("when intialised", closure: {
                it("should have correct title", closure: {
                    expect(viewModel.title.lowercased()) == "Catalog".lowercased()
                })
                
                it("should have correct number of categories", closure: {
                    expect(viewModel.categories.count) == 4
                })
            })
        }
    }
}
