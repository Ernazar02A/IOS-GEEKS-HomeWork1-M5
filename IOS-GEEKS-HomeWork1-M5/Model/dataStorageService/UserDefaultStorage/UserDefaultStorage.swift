//
//  UserDefaultStorage.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 29/6/23.
//

import Foundation


class UserDefaultStorage {
    
    enum UserDefaultType {
        case string
        case int
        case bool
        case double
    }
    
    enum UserDefaultKeys: String {
        case temporarykey
    }
    
    static let shared = UserDefaultStorage()
    private let userDefault = UserDefaults.standard
    
    func save<T: Any>(data: T, key: UserDefaultKeys) {
        userDefault.set(data, forKey: key.rawValue)
    }
    
    func retrieveString(type: UserDefaultType,
                        key: UserDefaultKeys
    ) ->  Any? {
        let data: Any?
        switch type {
        case .string:
            data = userDefault.string(forKey: key.rawValue)
        case .double:
            data = userDefault.double(forKey: key.rawValue)
        case .int:
            data = userDefault.integer(forKey: key.rawValue)
        case .bool:
            data = userDefault.bool(forKey: key.rawValue)
        }
        return data
    }
}
