//
//  TVShowRepositoryImpl.swift
//  MovieReader
//
//  Created by Samuel Chavez on 11/02/26.
//

import Foundation

final class TVShowRepositoryImpl: TVShowRepository {
    
    private let apiClient: ApiClient
    
    init(apiCLient: ApiClient = ApiClient()) {
        self.apiClient = apiCLient
    }
    
    func fetchTVShows() async throws -> [TVShow] {
        let response: PopularTVShowResponse = try await apiClient.request(endpoint: .popularShows)
        return response.results
    }
    
    func fetchTVShowDetails(id: Int) async throws -> TVShowDetail {
        try await apiClient.request(endpoint: .tvShowDetails(id: id))
    }
    
}
