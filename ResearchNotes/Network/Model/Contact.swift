//
//  Contact.swift
//  ResearchNotes
//
//  Created by Max Bhuiyan on 31/8/20.
//  Copyright © 2020 Max Bhuiyan. All rights reserved.
//

import Foundation

struct Contact: Decodable {
    typealias Email = String
    typealias Phone = String
    struct Address: Decodable {
        let country: String
        let state: String
        let city: String
        let street: String
    }
    
    let index: Int
    let contactId: UUID
    let firstName: String
    let lastName: String
    var fullName: String { firstName + " " + lastName }
    let gender: String
    let photo: URL
    let emails: [Email]
    let phones: [Phone]
    let address: Address
}

extension Contact: Identifiable, Equatable {
    var id: UUID { contactId }
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        lhs.id == rhs.id
    }
}


class SampleData {
    static var contacts: [Contact] = {
        let url = Bundle.main.url(forResource: "contacts", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try! decoder.decode([Contact].self, from: data)
    }()
    
    static var note: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam libero nisi, fringilla laoreet ultrices facilisis, ultricies sit amet velit. Aenean dignissim quis enim id tincidunt"
}
