//
//  http.swift
//  MovieReader
//
//  Created by Samuel Chavez on 31/01/26.
//


import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}


enum Endpoint {
    case popularShows
    case tvShowDetails(id: Int)
    
    var url: URL {
        let baseURL = "https://api.themoviedb.org/3"
        let apiKey = ""
        
        switch self {
        case .popularShows:
            return URL(string: "\(baseURL)/tv/popular?api_key=\(apiKey)&lenguage=es_ES&page=1")!
        case .tvShowDetails(let id):
            return URL(string: "\(baseURL)/tv/\(id)?api_key=\(apiKey)&lenguage=es_ES")!
        }
        
        
    }
    
    var method: HTTPMethod {
        return .get
    }
}
