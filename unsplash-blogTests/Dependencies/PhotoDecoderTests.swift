//
//  PhotoDecoderTests.swift
//  unsplash-blogTests
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import XCTest
@testable import unsplash_blog

final class PhotoDecoderTests: XCTestCase {
    func testPhotoDataDecoding() throws {
        let data = Helper.loadFile(named: "sample_photos")
        
        let photos = try  JSONPhotoDecoder().decode(from: data)
        XCTAssertEqual(photos.count, 3)
        
        for i in 0..<3 {
            XCTAssertEqual(photos[i].id, "\(i)")
            // TODO: Add test for other props
        }
        
        let firstPhoto = photos.first
        
        XCTAssertNotNil(firstPhoto?.createdAt)
        XCTAssertNotNil(firstPhoto?.updatedAt)
        
        let calendar = Calendar.current
        var dateComps = DateComponents(timeZone: .gmt, year: 2023, month: 5, day: 2, hour: 6, minute: 42)
        let expectedCreatedDate = calendar.date(from: dateComps)
        XCTAssertEqual(firstPhoto?.createdAt, expectedCreatedDate)
        
        dateComps = DateComponents(timeZone: .gmt, year: 2023, month: 8, day: 9, hour: 15, minute: 36, second: 43)
        let expectedUpdatedDate = calendar.date(from: dateComps)
        XCTAssertEqual(firstPhoto?.updatedAt, expectedUpdatedDate)
        
        XCTAssertEqual(firstPhoto?.urls.small, "testSmallURL")
        XCTAssertNotNil(firstPhoto?.user)
        
        let user = firstPhoto!.user
        XCTAssertEqual(user.name, "NEOM")
        
        XCTAssertEqual(firstPhoto?.description, "Trojena – The Mountains of NEOM, Saudi Arabia | A unique mountain destination in NEOM, Trojena will offer year-round outdoor skiing and adventure sports.")
    }
}
