//
//  TVShow.swift
//  MovieReader
//
//  Created by Samuel Chavez on 31/01/26.
//


import Foundation

struct TVShow: Codable {
    let id: Int
    let name: String
    let first_air_date: String
    let vote_average: Double
}


struct PopularTVShowResponse: Codable {
    let results: [TVShow]
}

