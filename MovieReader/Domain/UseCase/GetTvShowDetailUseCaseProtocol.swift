//
//  GetTvShowDetailUseCaseProtocol.swift
//  MovieReader
//
//  Created by Samuel Chavez on 11/02/26.
//

import Foundation

protocol GetTvShowDetailUseCaseProtocol {
    func execute(id: Int) async throws -> TVShowDetail
}

final class GetTvShowDetailUseCase: GetTvShowDetailUseCaseProtocol {
    private let repository: TVShowRepository
    
    init(repository: TVShowRepository = TVShowRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(id: Int) async throws -> TVShowDetail {
        try await repository.fetchTVShowDetails(id: id)
    }
}
