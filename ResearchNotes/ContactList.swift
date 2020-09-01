//
//  ContactList.swift
//  ResearchNotes
//
//  Created by Max Bhuiyan on 1/9/20.
//  Copyright © 2020 Max Bhuiyan. All rights reserved.
//

import SwiftUI

struct ContactList: View {
    @ObservedObject var viewModel = ContactListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.contacts) { contact in
                NavigationLink(destination: ContactDetail(viewModel: ContactDetailViewModel(contact: contact))) {
                    ContactRow(contact: contact)
                        .onAppear {
                            //if this is the last row, load more
                            if contact == self.viewModel.contacts.last {
                                self.viewModel.loadMore()
                            }
                        }
                        .frame(height: 70)
                }
            }
            .listRowInsets(EdgeInsets())
            .navigationBarTitle(Text("Contacts(\(viewModel.contacts.count))"), displayMode: .inline)
        }
        .onAppear {
            self.viewModel.loadMore()
        }
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactList(viewModel: ContactListViewModel(contacts: SampleData.contacts, nextPage: nil))
    }
}
