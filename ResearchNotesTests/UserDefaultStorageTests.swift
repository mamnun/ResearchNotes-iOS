//
//  UserDefaultStorageTests.swift
//  ResearchNotesTests
//
//  Created by Max Bhuiyan on 31/8/20.
//  Copyright © 2020 Max Bhuiyan. All rights reserved.
//

import XCTest
@testable import ResearchNotes

private extension UserDefaults {
    static var test: UserDefaults {
        let userDefaults = UserDefaults(suiteName: "Test")!
        userDefaults.set(["Covid01": "fever"], forKey: "notes")
        return userDefaults
    }
    
    static var empty: UserDefaults { UserDefaults(suiteName: "Empty")! }
}

class UserDefaultStorageTests: XCTestCase {
    struct SUT {
        @UserDefaultStorage("notes", default: [:], userDefaults: UserDefaults.test)
        var note: [String: String]
    }

    func testRead() throws {
        
        let sut = SUT()
        XCTAssertEqual(sut.note["Covid01"], "fever")
    }
    
    func testWrite() {
        var sut = SUT()
        sut.note["Covid02"] = "cough"
        XCTAssertEqual(sut.note["Covid02"], "cough")
    }

}
