//
//  PopularShowView.swift
//  MovieReader
//
//  Created by Samuel Chavez on 11/02/26.
//

import SwiftUI


let columns = [
    GridItem(.flexible(), spacing: 8),
    GridItem(.flexible(), spacing: 8),
    GridItem(.flexible(), spacing: 8)
]

struct PopularShowView: View {
    @StateObject private var viewModel = PopularShowViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 15){
                    ForEach(viewModel.shows, id: \.id) { show in
                        NavigationLink(destination: DetailView(
                            viewModel: TVShowDetailViewModel(id: show.id))) {
                                VStack(alignment: .leading) {
                                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w342/\(show.poster_path)")) { image in
                                        image.resizable()
                                        .aspectRatio(2/3, contentMode: .fill)
                                    } placeholder: {
                                        Color.gray
                                    }
                                    .cornerRadius(12)
                                }
                            }
                    }
                }
            }
        }
        .navigationTitle("Popular Shows")
        .onAppear {
            Task {
                viewModel.loadPopularShows()
            }
        }
    }
}

#Preview {
    PopularShowView()
}
