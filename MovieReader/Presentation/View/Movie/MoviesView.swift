//
//  MoviesView.swift
//  MovieReader
//
//  Created by Samuel Chavez on 16/02/26.
//

import SwiftUI

struct MoviesView: View {
    var body: some View {
        NavigationStack {
                    ContentUnavailableView("Próximamente", systemImage: "film", description: Text("La sección de películas está en desarrollo."))
                        .navigationTitle("Movies")
                }
    }
}

#Preview {
    MoviesView()
}
