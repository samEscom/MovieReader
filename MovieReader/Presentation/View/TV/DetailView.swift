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
        //ScrollView(.vertical, showsIndicators: false){
        ZStack{
            //VStack{
                if let details = viewModel.details {
                    
                    let imageUrl = "https://image.tmdb.org/t/p/original/\(details.backdrop_path!)"
                    
                   AsyncImage(url: URL(string: imageUrl)){ step in
                        switch step {
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                        case .failure(_):
                            Color.black
                        case .empty:
                            ProgressView()
                        @unknown default:
                            EmptyView()
                        }
                    
                    }
                    .ignoresSafeArea()
                      
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .black.opacity(0.8), .black]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                    
                    VStack(alignment: .leading, spacing: 10){
                        Spacer()
                        Text(details.name)
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.white)
                        HStack {
                            ForEach(details.genres) { genre in
                                Text(genre.name)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                if genre.id != details.genres.last?.id {
                                    Circle()
                                        .frame(width: 4, height: 4)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        Button(action: {
                            // ToDo save to wath
                        }) {
                            Label("Para ver", systemImage: "plus.circle.fill")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                        .padding(.vertical, 10)
                        Text(details.overview)
                            .font(.body)
                            .foregroundColor(.white.opacity(0.9))
                            .fixedSize(horizontal: false, vertical: true)
                        
                    }
                    .padding(.horizontal)
                    VStack(alignment: .leading) {
                                Text("Temporadas")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.leading)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 15) {
                                        ForEach(details.seasons ?? []) { season in
                                            VStack(alignment: .leading) {
                                                // Miniatura de la temporada
                                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(season.poster_path ?? "")")) { img in
                                                    img.resizable().aspectRatio(contentMode: .fill)
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 120, height: 180)
                                                .cornerRadius(8)
                                                
                                                Text("T\(season.season_number)")
                                                    .font(.caption)
                                                    .bold()
                                                    .foregroundColor(.white)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            
                            Spacer(minLength: 50)
                    
                } else {
                    Text("Loading...")
                          .progressViewStyle(CircularProgressViewStyle())
                }
            }
        //}
        .onAppear {
            Task {
                print(viewModel.showID)
                await viewModel.loadDetails(id: viewModel.showID)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}


