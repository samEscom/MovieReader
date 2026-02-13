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

public struct TVShowDetail: Codable {
    let name: String
    let overview: String
    let genres: [Genre]
}

