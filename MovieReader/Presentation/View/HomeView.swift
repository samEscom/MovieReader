//
//  HomeView.swift
//  MovieReader
//
//  Created by Samuel Chavez on 16/02/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
                    VStack {
                        Text("Bienvenido")
                            .font(.largeTitle)
                            .bold()
                    }
                    .navigationTitle("Home")
                }
    }
}

#Preview {
    HomeView()
}
