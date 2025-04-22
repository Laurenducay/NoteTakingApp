//
//  ContentView.swift
//  NoteTakingApp
//
//  Created by Lauren Ducay on 4/18/25.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: [ //move to vm
        SortDescriptor(\.date, order: .reverse)
    ]) var notes: FetchedResults<Note>
    @State private var addingNote = false //move to vm
    @Environment(\.dismiss) var dismiss
    @State private var changingTheme = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemPink]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    NoteCellView(notes: _notes)
                }
                VStack {
                    Spacer()
                    addNoteButton
                }
                .navigationTitle(Text("Notes"))
                .navigationDestination(isPresented: $addingNote) {
                    NoteView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .foregroundColor(.pink)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    moreButton
                }
            }
        }
    }
    
    var moreButton: some View {
        Button(action: {
            changingTheme = true
        }) {
            Image(systemName: "ellipsis.circle")
                .padding()
                .foregroundColor(.pink)
            
        }
        .navigationDestination(isPresented: $changingTheme) {
            ThemeSelectorView()
        }
    }
    
    var addNoteButton: some View {
        Button(action: {
            addingNote = true
        }) {
            Image(systemName: "plus")
                .padding()
                .foregroundColor(.white)
                .background(Color.pink.opacity(0.2))
                .clipShape(Circle())
                .shadow(color: Color.pink, radius: 5)
            
        }
        .padding(EdgeInsets(top: 10, leading: 300, bottom: 0, trailing: 0))
    }
}

#Preview {
    ContentView()
}
