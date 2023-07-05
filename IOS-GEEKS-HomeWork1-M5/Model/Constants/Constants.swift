//
//  Constants.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 19/6/23.
//

import Foundation

enum Constants {
    enum API {
        static let baseURL = URL(string: "https://rickandmortyapi.com/api")!
    }
    enum Authorization {
        static let service = "Authorization"
        static let account = "Session"
    }
    enum Authentification {
        static let service = "Authentification"
        static let account = "PhoneNumber"
    }
    enum Sizing {
        static let corner10 = 10.0
        static let corner20 = 20.0
        static let corner50 = 50.0
    }
}
