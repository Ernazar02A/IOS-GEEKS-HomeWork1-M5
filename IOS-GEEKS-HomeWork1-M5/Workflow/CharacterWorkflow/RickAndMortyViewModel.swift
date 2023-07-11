//
//  RickAndMortyViewModel.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 27/6/23.
//

import Foundation

class RickAndMortyViewModel {
    private let networkService = NetworkService()
    private let firestoreManager = FirestoreManager.shared
    
    func fetchCharacters() async throws -> [Character] {
        return try await networkService.fetchCharacters()
    }
    
    func addNewCharachter(character: Character) {
        let characters = RickAndMortyUtility.mapData(character: character)
        firestoreManager.addData(with: .character, data: characters)
    }
    
    func addCharachterCoreData(character: Character) {
        DataManager.shared.character(character: character)
    }
}
