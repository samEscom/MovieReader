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
        ZStack{
            if let details = viewModel.details {
                
                let imageUrl = "https://image.tmdb.org/t/p/original/\(details.backdrop_path)"
                
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
                
                VStack{
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
                    Text(details.overview)
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .lineLimit(3) // Para que no sature la pantalla
                                    .padding(.bottom, 40) // Espacio al final de la pantalla
                    
                    
                }
                .padding(.horizontal)
                
            } else {
                Text("Loading...")
                      .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .onAppear {
            Task {
                print(viewModel.showID)
                await viewModel.loadDetails(id: viewModel.showID)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Asegura que el ZStack sea gigante
        .background(Color.black)
    }
}


