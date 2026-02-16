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
    case popularShows(page: Int = 1)
    case tvShowDetails(id: Int)
    
    var url: URL {
        let url = "https://\(APIConfig.apiURL)/\(APIConfig.apiVersion)"
        
        let apiKey = APIConfig.apiToken
        
        switch self {
        case .popularShows(let page):
            return URL(string: "\(url)/tv/popular?api_key=\(apiKey)&lenguage=es_ES&page=\(page)")!
        case .tvShowDetails(let id):
            return URL(string: "\(url)/tv/\(id)?api_key=\(apiKey)&lenguage=es_ES")!
        }
        
        
    }
    
    var method: HTTPMethod {
        return .get
    }
}
