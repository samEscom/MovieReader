//
//  GetTvShowUseCaseProtocol.swift
//  MovieReader
//
//  Created by Samuel Chavez on 11/02/26.
//
import Foundation

protocol GetPopularTvShowUseCaseProtocol {
    func execute(page: Int) async throws -> PopularTVShowResponse
}


final class GetPopularTvShowUseCase: GetPopularTvShowUseCaseProtocol {
    
    private let repository: TVShowRepository
    
    init(repository: TVShowRepository = TVShowRepositoryImpl()) {
        self.repository = repository
    }
    
    
    func execute(page: Int) async throws -> PopularTVShowResponse {
        try await self.repository.fetchTVShows(page: page)
    }
}
