//
//  NoteSheetView.swift
//  NoteTakingApp
//
//  Created by Lauren Ducay on 4/18/25.
//

import SwiftUI

struct NoteView: View { //refactor into sheet, "save" button to add sheet, "plus" button to bring sheet up
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var title: String = ""
    @State var content: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                TextField("Title", text: $title)
                    .font(.headline)
                    .padding(.leading, 30)
                    .padding(.top, 50)
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
                    .padding(EdgeInsets(top: 20, leading: 300, bottom: 0, trailing: 0))
                    .shadow(color: Color.pink, radius: 5)
                    
                }
            }
        }
    }
}

#Preview {
    NoteView()
}
