//
//  NoteEditor.swift
//  ResearchNotes
//
//  Created by Max Bhuiyan on 1/9/20.
//  Copyright © 2020 Max Bhuiyan. All rights reserved.
//

import SwiftUI

struct NoteEditor: View {
    @Binding var note: String
    
    var body: some View {
        TextView(text: $note)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct NoteEditor_Previews: PreviewProvider {
    static var previews: some View {
        let binding = Binding<String>(
            get: { SampleData.note },
        set: { _ in })
        return NoteEditor(note: binding)
    }
}
