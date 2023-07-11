//
//  Character.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 19/6/23.
//

import Foundation

struct CharactersModel: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
}
