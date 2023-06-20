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
    
    func fetchCharacters(
        completion: @escaping
        (Result<[Character], RickAndMortyError>) -> Void
    ) {
        let request = URLRequest(
            url: Constants
                .API
                .baseURL
                .appendingPathComponent("character")
        )
        URLSession.shared.dataTask(
            with: request
        ) { data, response, error in
            guard let data else {
                return
            }
            do {
                let model = try JSONDecoder().decode(
                    Characters.self,
                    from: data
                )
                completion(.success(model.results))
            } catch {
                completion(.failure(.UFO))
            }
        }
        .resume()
    }
}
