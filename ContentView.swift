//
//  ContentView.swift
//  NoteTakingApp
//
//  Created by Lauren Ducay on 4/18/25.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var notes: FetchedResults<Note>
    @State private var isShowingNoteSheet = false //move to vm later on, okay for now
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                NoteCellView(notes: _notes)
                NoteSheetView()
            }
            .navigationTitle(Text("Notes"))
        }
    }
    func addNote() {
        isShowingNoteSheet.toggle()
    }
}

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

struct NoteSheetView: View { //refactor into sheet, "save" button to add sheet, "plus" button to bring sheet up
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        Button(action: {
            let note = Note(context: managedObjectContext)
            note.id = UUID()
            note.title = "New Note"
            try? managedObjectContext.save()
        }) {
            Image(systemName: "plus")
                .padding()
                .foregroundColor(.white)
                .background(Color.pink.opacity(0.2))
                .clipShape(Circle())
                .shadow(color: Color.pink, radius: 5)
            
        }
        .padding(EdgeInsets(top: 0, leading: 300, bottom: 0, trailing: 0))
    }
}

#Preview {
    ContentView()
}
