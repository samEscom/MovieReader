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
    var page: Int = 1
    var prevPage: Int = 0
    var totalPage: Int = 1
    
    
    
    private let getPopularTVShowUseCase: GetPopularTvShowUseCaseProtocol
    
    
    init(getPopularTVShowUseCase: GetPopularTvShowUseCaseProtocol = GetPopularTvShowUseCase()) {
        self.getPopularTVShowUseCase = getPopularTVShowUseCase
    }
    
    func load(page: Int) {
        print("Loading page \(page)")
        Task {
            do {
                let shows = try await getPopularTVShowUseCase.execute(page: page)
                await MainActor.run {
                    self.shows = shows.results
                    self.totalPage = shows.total_pages
                }
            } catch {
                print(error)
            }
        }
    }
    
    func nextPage(){
        guard page < totalPage else { return }
        self.page += 1
        self.prevPage = page - 1
        load(page: page)
    }
    
    func previousPage() {
        guard page > 1 else { return }
        self.page -= 1
        self.prevPage = page - 1
        load(page: page)
    }
    
}
