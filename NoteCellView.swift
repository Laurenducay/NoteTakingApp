//
//  NoteCellView.swift
//  NoteTakingApp
//
//  Created by Lauren Ducay on 4/18/25.
//

import SwiftUI

struct NoteCellView: View {
    @FetchRequest(sortDescriptors: []) var notes: FetchedResults<Note>
    var body: some View {
        List(notes) { note in
            Text(note.title ?? "No title")
                .foregroundColor(.white)
                .listRowBackground(Color.pink.opacity(0.5))
                .listRowSeparatorTint(Color.pink)
        }
        .scrollContentBackground(.hidden)
        .background(Color.pink.opacity(0.2))
        
    }
}

#Preview {
    NoteCellView()
}
