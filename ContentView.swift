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
            }
            .navigationTitle(Text("Notes"))
        }
        Button(action: { addNote() }) {
            Image(systemName: "plus")
                .padding()
                .foregroundColor(.white)
                .background(Color.pink.opacity(0.2))
                .clipShape(Circle())
                .shadow(color: Color.pink, radius: 5)
            
        }
        .padding(EdgeInsets(top: 10, leading: 300, bottom: 0, trailing: 0))
        .sheet(isPresented: $isShowingNoteSheet, onDismiss: didDismiss) {
            NoteSheetView()
                .presentationDetents([.fraction(0.7), .large, .medium])
        }
    }
    func addNote() {
        isShowingNoteSheet.toggle()
    }
    func didDismiss() {
        
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
    @State var title: String = ""
    @State var content: String = ""
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                TextField("Title", text: $title)
                    .font(.headline)
                    .padding([.leading, .top], 30)
                Divider()
                    .padding()
                TextField("Content", text: $content)
                    .padding(.leading, 30)
                Spacer()
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Save") {
                        let note = Note(context: managedObjectContext)
                        note.id = UUID()
                        note.title = title
                        note.content = content
                        note.date = Date()
                        try? managedObjectContext.save()
                    }
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.pink.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 300))
                    .shadow(color: Color.pink, radius: 5)
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
