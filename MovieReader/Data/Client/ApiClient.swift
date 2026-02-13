//
//  ApiClient.swift
//  MovieReader
//
//  Created by Samuel Chavez on 11/02/26.
//

import Foundation

final class ApiClient {
    func request<T: Decodable>(endpoint: Endpoint) async throws-> T{
        var urlRequest = URLRequest(url: endpoint.url)
        
        urlRequest.httpMethod = endpoint.method.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let  httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
        
}
