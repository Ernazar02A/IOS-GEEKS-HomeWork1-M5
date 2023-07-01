//
//  UserDefaultStorage.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 29/6/23.
//

import Foundation


class UserDefaultStorage {
    
    enum UserDefaultKeys: String {
        case temporarykey
    }
    
    static let shared = UserDefaultStorage()
    private let userDefault = UserDefaults.standard
    
    func save<T: Any>(data: T, key: UserDefaultKeys) {
        userDefault.set(data, forKey: key.rawValue)
    }
    
    func retrieveString( key: UserDefaultKeys) ->  Any? {
        return userDefault.object(forKey: key.rawValue)
    }
}
