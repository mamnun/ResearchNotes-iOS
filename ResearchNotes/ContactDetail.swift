//
//  ContactDetail.swift
//  ResearchNotes
//
//  Created by Max Bhuiyan on 1/9/20.
//  Copyright © 2020 Max Bhuiyan. All rights reserved.
//

import SwiftUI

struct ContactDetail: View {
    @ObservedObject var viewModel: ContactDetailViewModel
    @State var showingNoteEditor = false

    
    var body: some View {
        List {
            Section {
                HStack(alignment: .center) {
                    // stupid hack to stackview.distrbution = fillEqual
                    Spacer()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    Image(systemName:"person.crop.circle")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                    Spacer()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                }
            }
            
            Section(header: Text("Name")) {
                Text(viewModel.contact.fullName)
            }
            
            Section(header: Text("Emails")) {
                ForEach(viewModel.contact.emails, id: \.hashValue) { email in
                    Text(email)
                }
            }
            Section(header: Text("Phones")) {
                ForEach(viewModel.contact.phones, id: \.hashValue) { phone in
                    Text(phone)
                }
            }
            Section(header:
                Button(action: {
                    self.showingNoteEditor.toggle()
                }, label: {
                    HStack {
                        Text("Notes")
                            .foregroundColor(Color.black)
                        Spacer()
                        Image(systemName:"square.and.pencil")
                    }
                }
                )
                .sheet(isPresented: $showingNoteEditor) {
                    NavigationView {
                        NoteEditor(note: self.$viewModel.note)
                            .navigationBarTitle(Text((self.viewModel.contact.firstName + "'s note")), displayMode: .inline)
                        .navigationBarItems(trailing:
                            Button("Done") {
                                self.showingNoteEditor.toggle()
                            }
                        )
                    }
                }
            ) {
                Text(viewModel.note)
                    .onTapGesture {
                        self.showingNoteEditor.toggle()
                }
            }
        }
        .navigationBarTitle(Text(viewModel.contact.fullName), displayMode: .inline)
    }
}

struct ContactDetail_Previews: PreviewProvider {
    static var previews: some View {
        let vm = ContactDetailViewModel(contact: SampleData.contacts[2])
        vm.note = SampleData.note
        return ContactDetail(viewModel: vm)
    }
}

