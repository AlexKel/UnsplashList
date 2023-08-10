//
//  EndpointTests.swift
//  unsplash-blogTests
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import XCTest
@testable import unsplash_blog

final class EndpointTests: XCTestCase {
    
    func testEndpointComponents() throws {
        let endpoint = Endpoint<Photo>(clientID: "TestClientID", path: UnsplashAPIPaths.photos.rawValue)
        let comps = endpoint.createComponents()
        XCTAssertEqual(comps.scheme, "https")
        XCTAssertEqual(comps.host, "api.unsplash.com")
        XCTAssertEqual(comps.path, "/photos")
        XCTAssertEqual(comps.queryItems, [URLQueryItem(name: "client_id", value: "TestClientID")])
        XCTAssertEqual(comps.url?.absoluteString, "https://api.unsplash.com/photos?client_id=TestClientID")
    }
    
    func testEndpointRequest() throws {
        let endpoint = Endpoint<Photo>(clientID: "TestClientID", path: UnsplashAPIPaths.photos.rawValue)
        let request = endpoint.createRequest()
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(request?.url?.absoluteString, "https://api.unsplash.com/photos?client_id=TestClientID")
    }

}
