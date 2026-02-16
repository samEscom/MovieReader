//
//  ApiConfig.swift
//  MovieReader
//
//  Created by Samuel Chavez on 15/02/26.
//

import Foundation

enum APIConfig {
    private static var infoDict: [String: Any] {
        Bundle.main.infoDictionary ?? [:]
    }
    
    static var apiURL: String {
        guard let url = infoDict["API_URL"] as? String else {
            fatalError("BASE_URL no encontrada en Config.xcconfig")
        }
        return url
    }
    

    static var apiVersion: String {
        guard let version = infoDict["API_VERSION"] as? String else {
            fatalError("API_VERSION no encontrada en Config.xcconfig")
        }
        return version
    }
    
    
    static var apiToken: String {
        guard let token = infoDict["API_TOKEN"] as? String else {
            fatalError("API_TOKEN no encontrada en Config.xcconfig")
        }
        return token
    }
}
