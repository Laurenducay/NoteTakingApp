//
//  ThemeSelectorView.swift
//  NoteTakingApp
//
//  Created by Lauren Ducay on 4/22/25.
//

import SwiftUI

enum Theme: String, CaseIterable {
    case pink
    case blue
    case green
}

struct ThemeSelectorView: View {
    @State private var selectedTheme: Theme = .pink
    @Environment(\.dismiss) var dismiss
    @State private var hueAngle: Angle = .degrees(0)

    var body: some View {
        
        NavigationStack {
            List{
                Picker("Theme", selection: $selectedTheme) {
                    Text("Pink").tag(Theme.pink)
                    Text("Blue").tag(Theme.blue)
//                    Text("Green").tag(Theme.green)
                }
                    
            }
            .navigationTitle("Themes")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left.circle")
                            .foregroundColor(.pink)
                    }
                }
            }
        }
        .background(Color.gray.opacity(0.2))
    }
}

#Preview {
    ThemeSelectorView()
}

//.hueRotation(hueAngle)
//.onAppear {
//    withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
//        hueAngle = .degrees(25)
//    }
//}


