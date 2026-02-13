//
//  PopularShowView.swift
//  MovieReader
//
//  Created by Samuel Chavez on 11/02/26.
//

import SwiftUI

struct PopularShowView: View {
    @StateObject private var viewModel = PopularShowViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.shows, id: \.id) { show in
                NavigationLink(destination: DetailView(
                    viewModel: TVShowDetailViewModel(id: show.id))) {
                        Text(show.name)
                    }
            }
            .onAppear {
                Task {
                    viewModel.loadPopularShows()
                }
            }
        }
    }
}

#Preview {
    PopularShowView()
}
