//
//  TVShowRepository.swift
//  MovieReader
//
//  Created by Samuel Chavez on 11/02/26.
//

protocol TVShowRepository {
    func fetchTVShows() async throws -> [TVShow]
    func fetchTVShowDetails(id: Int) async throws -> TVShowDetail
}
