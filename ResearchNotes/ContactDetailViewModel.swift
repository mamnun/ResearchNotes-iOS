//
//  ContactDetailViewModel.swift
//  ResearchNotes
//
//  Created by Max Bhuiyan on 1/9/20.
//  Copyright © 2020 Max Bhuiyan. All rights reserved.
//

import Foundation
import Combine

class ContactDetailViewModel: ObservableObject {
    @Published var contact: Contact
    @Published var note: String
    
    private let service: NotesService
    private var cancellables: [AnyCancellable] = []
    
    init(contact: Contact, service: NotesService = NotesService()) {
        self.contact = contact
        self.service = service
        note = service.note(for: contact)
        $note.sink { note in
            service.store(note: note, for: contact)
        }
        .store(in: &cancellables)
    }
}
