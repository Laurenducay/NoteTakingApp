//
//  ThemeSelectorView.swift
//  NoteTakingApp
//
//  Created by Lauren Ducay on 4/22/25.
//

import SwiftUI

struct ThemeSelectorView: View {
    var body: some View {
        List{
            Text("Theme Selector")
            Text("Pink")
            Text("Blue")
            Text("Green")
        }
        .navigationTitle("Themes")
    }
}

#Preview {
    ThemeSelectorView()
}




