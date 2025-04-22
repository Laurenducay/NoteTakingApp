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
    @Environment(\.managedObjectContext) var managedObjectContext
    
    private let noteFormatDate: DateFormatter = { //probably move this to vm as well
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    @State var navigate = false
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(notes) { note in
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
                .onDelete(perform: deleteNote)
            }
            .scrollContentBackground(.hidden)
            .background(LinearGradient(gradient:
                                    Gradient(colors:
                                                    [
                                                        Color.pink.opacity(0.1), Color.pink.opacity(0.7), Color.pink.opacity(0.4)
                                                    ]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing
                                      ))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .foregroundColor(.pink)
                }
            }
        }
    }
    func deleteNote(at offsets: IndexSet) {
        for offset in offsets {
            let note = notes[offset]
            managedObjectContext.delete(note)
        }
        try? managedObjectContext.save()
    }
}

#Preview {
    NoteCellView()
}
