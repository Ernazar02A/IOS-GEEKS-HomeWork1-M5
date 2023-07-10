//
//  NetworkService.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 19/6/23.
//

import Foundation

enum RickAndMortyError: Error {
    case UFO
}

struct NetworkService {
    
    static let shared = NetworkService()
    
    func fetchCharacters() async throws -> [Character] {
        let request = URLRequest(
            url: Constants
                .API
                .baseURL
                .appendingPathComponent("character")
        )
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Characters.self, from: data).results
    }
    
    func fetchCharacters2() async throws -> [Character] {
        let request = URLRequest(
            url: Constants
                .API
                .baseURL
                .appendingPathComponent("character")
        )
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Characters.self, from: data).results
    }
}
