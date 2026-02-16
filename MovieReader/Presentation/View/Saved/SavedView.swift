//
//  SavedView.swift
//  MovieReader
//
//  Created by Samuel Chavez on 16/02/26.
//

import SwiftUI

struct SavedView: View {
    var body: some View {
        NavigationStack {
                    ContentUnavailableView("Sin Guardados", systemImage: "bookmark.slash", description: Text("Aquí aparecerán tus series favoritas."))
                        .navigationTitle("Saved")
                }
    }
}

#Preview {
    SavedView()
}
