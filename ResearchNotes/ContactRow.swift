//
//  ContactRow.swift
//  ResearchNotes
//
//  Created by Max Bhuiyan on 1/9/20.
//  Copyright © 2020 Max Bhuiyan. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContactRow: View {
    var contact: Contact
    
    var body: some View {
        HStack {
            WebImage(url: contact.photo)
                .resizable()
                .placeholder(Image(systemName:"person.crop.circle"))
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .aspectRatio(1, contentMode: .fit)
                .padding()
            Text(contact.fullName)
            Spacer()
        }
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContactRow(contact: SampleData.contacts[0])
            ContactRow(contact: SampleData.contacts[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
