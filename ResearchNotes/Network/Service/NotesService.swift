//
//  NotesService.swift
//  ResearchNotes
//
//  Created by Max Bhuiyan on 1/9/20.
//  Copyright © 2020 Max Bhuiyan. All rights reserved.
//

import Foundation

class NotesService {
    @UserDefaultStorage("contactNotes", default: [:])
    public var notes: [String: String]
    
    func note(for contact: Contact) -> String {
        return notes[contact.id.uuidString] ?? ""
    }
    
    func store(note: String?, for contact: Contact) {
        notes[contact.id.uuidString] = note
    }
}
