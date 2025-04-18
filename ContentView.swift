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
    @State private var isNavigating = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                NoteCellView(notes: _notes)
                
                Button(action: {
                    isNavigating = true
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
            .navigationTitle(Text("Notes"))
            .navigationDestination(isPresented: $isNavigating) {
                NoteView()
            }
        }
    }
    
    func addNote() {
        isShowingNoteSheet.toggle()
    }
    func didDismiss() {
        
    }
}

#Preview {
    ContentView()
}
