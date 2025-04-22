//
//  ContentView.swift
//  NoteTakingApp
//
//  Created by Lauren Ducay on 4/18/25.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date, order: .reverse)
    ]) var notes: FetchedResults<Note>
    @State private var isNavigating = false
    @Environment(\.dismiss) var dismiss
    
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
                .navigationDestination(isPresented: $isNavigating) {
                    NoteView()
                }
            }
        }
    }
    
    var addNoteButton: some View {
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
    
    func didDismiss() {
        
    }
}

#Preview {
    ContentView()
}
