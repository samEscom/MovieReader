//
//  GetTvShowUseCaseProtocol.swift
//  MovieReader
//
//  Created by Samuel Chavez on 11/02/26.
//
import Foundation

protocol GetPopularTvShowUseCaseProtocol {
    func execute() async throws -> [TVShow]
}


final class GetPopularTvShowUseCase: GetPopularTvShowUseCaseProtocol {
    
    private let repository: TVShowRepository
    
    init(repository: TVShowRepository = TVShowRepositoryImpl()) {
        self.repository = repository
    }
    
    
    func execute() async throws -> [TVShow] {
        try await self.repository.fetchTVShows()
    }
}
