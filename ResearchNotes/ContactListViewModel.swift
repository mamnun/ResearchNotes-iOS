//
//  ContactListViewModel.swift
//  ResearchNotes
//
//  Created by Max Bhuiyan on 1/9/20.
//  Copyright © 2020 Max Bhuiyan. All rights reserved.
//

import Foundation
import Combine

class ContactListViewModel: ObservableObject {
    @Published var contacts: [Contact]
    
    private var cancellables: [AnyCancellable] = []
    private var nextPage: Int?
    private let contactsService = ContactsWebService()
    
    init(contacts: [Contact] = [], nextPage: Int? = 0) {
        self.contacts = contacts
        self.nextPage = nextPage
    }
    
    func loadMore() {
        guard let nextPage = nextPage else { return }
        contactsService
            .getContacts(page: nextPage, limit: 20)
            //.getContacts()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { subscriber in
                switch subscriber {
                case .failure(let error):
                    // TODO: error handling
                    print(error)
                case .finished:
                    //self.nextPage = nil
                    print("finished")
                }
            }) { [weak self] contacts in
                guard let self = self else { return }
                
                if contacts.count > 0 {
                    self.contacts.append(contentsOf: contacts)
                    self.nextPage = nextPage + 1
                } else {
                    self.nextPage = nil
                }
            }
            .store(in: &cancellables)
    }
}
