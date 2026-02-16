//
//  TVShowRepository.swift
//  MovieReader
//
//  Created by Samuel Chavez on 11/02/26.
//

protocol TVShowRepository {
    func fetchTVShows(page: Int) async throws -> PopularTVShowResponse
    func fetchTVShowDetails(id: Int) async throws -> TVShowDetail
}
