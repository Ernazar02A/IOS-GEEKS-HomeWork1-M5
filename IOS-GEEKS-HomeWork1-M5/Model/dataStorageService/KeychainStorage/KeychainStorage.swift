//
//  KeychainStorage.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 29/6/23.
//

import Foundation


class KeychainStorage {
    
    enum KeychainError: Error {
        case duplicateEntry
        case unknown(OSStatus)
    }
    
    static let shared = KeychainStorage()

    func save(
        service: String,
        account: String,
        data: Data
    ) throws {
        let query: [String: AnyObject] = [
            kSecValueData as String: data as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else {
            update(
                service: service,
                account: account,
                data: data
            )
            return
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.unknown(status)
        }
        
        print("saved")
    }
    
    func update(
        service: String,
        account: String,
        data: Data
    ) {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject
        ] 
        let attributesToUpdate = [kSecValueData: data] as CFDictionary
        
        SecItemUpdate(query as CFDictionary, attributesToUpdate)
    }
    
    func get(
        service: String,
        account: String
    ) -> Data? {
        let query: [String: AnyObject] = [
            kSecReturnData as String: kCFBooleanTrue,
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecMatchLimit as String: kSecMatchLimitOne
        ] 
        
        var result: AnyObject?
        let status = SecItemCopyMatching(
            query as CFDictionary,
            &result
        )
        
        return result as? Data
    }
    
    func delete(
        service: String,
        account: String
    ) throws {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject
        ]
        
        SecItemDelete(query as CFDictionary)
    }
    
}
