//
//  RickAndMortyViewModel.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 27/6/23.
//

import Foundation


class RickAndMortyViewModel {
    private let networkService = NetworkService()
    
    func fetchCharacters() async throws -> [Character] {
        return try await networkService.fetchCharacters()
    }
}
