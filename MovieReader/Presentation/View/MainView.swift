//
//  Main.swift
//  MovieReader
//
//  Created by Samuel Chavez on 16/02/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            MoviesView()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
            PopularShowView()
                .tabItem {
                    Label("TV", systemImage: "tv")
                }
            SavedView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark")
                }
        }
        .tint(.red)
    }
}

#Preview {
    MainView()
}
