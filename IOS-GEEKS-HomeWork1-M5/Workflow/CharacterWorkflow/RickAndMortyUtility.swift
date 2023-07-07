//
//  RickAndMortyUtility.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 6/7/23.
//

import Foundation

enum RickAndMortyUtility {
    static func mapData(data: [[String: Any]]) -> [Character]  {
        data.map {
            let name = $0["name"] as! String
            let status = $0["status"] as! String
            let species = $0["species"] as! String
            let type = $0["type"] as! String
            let gender = $0["gender"] as! String
            let image = $0["image"] as! String
            
            return Character(
                name: name,
                status: status,
                species: species,
                type: type,
                gender: gender,
                image: image
            )
        }
    }
    
    static func mapData(character: Character) -> [String: Any] {
        return [
            "name": character.name,
            "status": character.status,
            "species": character.species,
            "type": character.type,
            "gender": character.gender,
            "image": character.image
        ]
    }
}
