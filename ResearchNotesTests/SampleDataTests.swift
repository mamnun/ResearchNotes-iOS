//
//  SampleDataTests.swift
//  ResearchNotesTests
//
//  Created by Max Bhuiyan on 31/8/20.
//  Copyright © 2020 Max Bhuiyan. All rights reserved.
//

import XCTest
@testable import ResearchNotes

class SampleDataTests: XCTestCase {
    func testContacts() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(SampleData.contacts.count > 0)
    }

}
