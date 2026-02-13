//
//  TVShowDetail.swift
//  MovieReader
//
//  Created by Samuel Chavez on 11/02/26.
//


import Foundation
import Combine

final class TVShowDetailViewModel: ObservableObject {
    @Published var details: TVShowDetail?
    
    var showID: Int = 0
    
    private let getTVShowDetailUseCase: GetTvShowDetailUseCaseProtocol
    
    init(id: Int, getTVShowDetailUseCase: GetTvShowDetailUseCaseProtocol = GetTvShowDetailUseCase()) {
        self.showID = id
        self.getTVShowDetailUseCase = getTVShowDetailUseCase
    }
    
    
    func loadDetails(id: Int) async{
        do {
            let detail = try await getTVShowDetailUseCase.execute(id: id)
            
            await MainActor.run {
                self.details = detail
            }
        } catch {
            print(error)
        }
    }
    
    
    
}
