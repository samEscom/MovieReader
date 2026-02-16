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
    let backdrop_path: String?
    let poster_path: String?
}


struct PopularTVShowResponse: Codable {
    let page: Int
    let results: [TVShow]
    let total_pages: Int
    let total_results: Int
}

