//
//  NoteSheetView.swift
//  NoteTakingApp
//
//  Created by Lauren Ducay on 4/18/25.
//

import SwiftUI

struct NoteView: View { //refactor into sheet, "save" button to add sheet, "plus" button to bring sheet up
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var title: String = "" //move to vm
    @State var content: String = "" //move to vm
    @Environment(\.dismiss) var dismiss
    
    var note: Note?
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                TextField("Title", text: $title)
                    .font(.headline)
                    .padding(.leading, 30)
                    .padding(.top, 50)
                Divider()
                    .padding()
                TextField("Content", text: $content, axis: .vertical)
                    .padding(.leading, 30)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .onAppear {
                if let note = note {
                    title = note.title ?? ""
                    content = note.content ?? ""
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(note == nil ? "Save" : "Update") {
                        if let note = note {
                            note.title = title
                            note.content = content
                            note.date = Date()
                        } else {
                            let newNote = Note(context: managedObjectContext)
                            newNote.id = UUID()
                            newNote.title = title
                            newNote.content = content
                            newNote.date = Date()
                        }
                        try? managedObjectContext.save()
                        dismiss()
                    }
                    .ignoresSafeArea()
                    .padding(9)
                    .foregroundColor(.white)
                    .background(Color.pink.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .shadow(color: Color.pink, radius: 5)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    
                }
            }
        }
    }
}

#Preview {
    NoteView()
}
