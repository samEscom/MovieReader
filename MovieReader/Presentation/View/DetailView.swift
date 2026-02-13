//
//  DetailView.swift
//  MovieReader
//
//  Created by Samuel Chavez on 11/02/26.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel: TVShowDetailViewModel
    
    init(viewModel: TVShowDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack{
            if let details = viewModel.details {
                Text(details.name)
                    .font(.headline)
                    .padding(.bottom, 20)
                Text(details.overview)
                if !details.genres.isEmpty {
                    Text("Generos")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                    ForEach(details.genres) { genre in
                        Text(genre.name)
                    }
                }
                
            } else {
                Text("Loading...")
                      .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .onAppear {
            Task {
                await viewModel.loadDetails(id: viewModel.showID)
            }
        }
    }
}


