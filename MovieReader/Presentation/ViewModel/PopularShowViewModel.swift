//
//  PopularShow.swift
//  MovieReader
//
//  Created by Samuel Chavez on 11/02/26.
//

import Foundation
import Combine

final class PopularShowViewModel: ObservableObject {
    @Published var shows: [TVShow] = []
    private let getPopularTVShowUseCase: GetPopularTvShowUseCaseProtocol
    
    
    init(getPopularTVShowUseCase: GetPopularTvShowUseCaseProtocol = GetPopularTvShowUseCase()) {
        self.getPopularTVShowUseCase = getPopularTVShowUseCase
    }
    
    func loadPopularShows() {
        Task {
            do {
                let shows = try await getPopularTVShowUseCase.execute()
                await MainActor.run {
                    self.shows = shows
                }
            } catch {
                print(error)
            }
        }
    }
    
}
