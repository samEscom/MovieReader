//
//  TVShowDetail.swift
//  MovieReader
//
//  Created by Samuel Chavez on 31/01/26.
//

import Foundation

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}

struct Network: Codable, Identifiable {
    let id: Int
    let logo_path: String
    let name: String
    let origin_country: String
}

struct Season: Codable, Identifiable {
    let air_date: String?
    let episode_count: Int
    let id: Int
    let name: String
    let overview: String
    let poster_path: String
    let season_number: Int
    let vote_average: Double
}

public struct TVShowDetail: Codable {
    let name: String
    let backdrop_path: String
    let overview: String
    let genres: [Genre]
    let networks: [Network]
    let vote_average: Double
    let seasons:  [Season]
}

