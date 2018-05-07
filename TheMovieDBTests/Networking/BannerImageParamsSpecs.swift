//
//  BannerImageParamsSpecs.swift
//  TheMovieDBTests
//
//  Created by Navneet on 5/7/18.
//  Copyright © 2018 Navneet. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import TheMovieDB

class BannerImageParamsSpecs: QuickSpec {
    
    override func spec() {
        var params: BannerImageParams!
        
        beforeEach() {
            params = BannerImageParams(path: "/2DtPSyODKWXluIRV7PVru0SSzja.jpg")
        }
        
        describe("Verify service params") {
            context("when initialized", closure: {
                it("should have correct url string", closure: {
                    expect(params.urlString) == "https://image.tmdb.org/t/p/w500/2DtPSyODKWXluIRV7PVru0SSzja.jpg"
                })
                
                it("should have valid HTTP method type", closure: {
                    expect(params.httpMethod) == HTTPMethod.GET
                })
                
                it("should have valid HTTP time out", closure: {
                    expect(params.httpTimeout) == HTTPTimeout.thirty
                })
            })
        }
    }
}
