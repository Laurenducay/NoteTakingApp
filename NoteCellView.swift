//
//  NoteCellView.swift
//  NoteTakingApp
//
//  Created by Lauren Ducay on 4/18/25.
//

import SwiftUI

struct NoteCellView: View {
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date)
    ]) var notes: FetchedResults<Note> //move to vm?
    
    private let noteFormatDate: DateFormatter = { //probably move this to vm as well
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            List(notes) { note in
                NavigationLink(destination: NoteView(note: note)) {
                    VStack(alignment: .leading, spacing: 3) {
                        Text(note.title ?? "No title")
                            .font(.headline)
                        HStack {
                            Text(noteFormatDate.string(from: note.date ?? Date()))
                            Text(note.content ?? "no content")
                                .lineLimit(1)
                        }
                        .font(.subheadline)

                    }
                }
                    .foregroundColor(.white)
                    .listRowBackground(Color.pink.opacity(0.4))
                    .listRowSeparatorTint(Color.pink)
            }
            .scrollContentBackground(.hidden)
            .background(Color.pink.opacity(0.2))
        }
    }
}

#Preview {
    NoteCellView()
}
