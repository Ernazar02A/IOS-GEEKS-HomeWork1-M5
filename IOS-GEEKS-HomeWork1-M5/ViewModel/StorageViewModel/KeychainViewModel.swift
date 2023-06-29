//
//  KeychainViewModel.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 29/6/23.
//

import Foundation


class KeychainViewModel {
    
    private let keychain = KeychainStorage.shared
    
    func keychainSave(
        service: String,
        account: String,
        password: String
    ) {
        do {
            try keychain.save(service: service,
                                     account: account,
                                     password: password.data(using: .utf8) ?? Data()
            )
        } catch {
            print(error)
        }
    }
    
    func keychainUpdatePassword(
        service: String,
        account: String,
        password: String
    ) {
        do {
            try keychain.update(service: service,
                                     account: account,
                                     password: password.data(using: .utf8) ?? Data()
            )
        } catch {
            print(error)
        }
    }
    
    func keychainGetPassword(service: String, account: String) {
        guard let data = keychain.get(
            service: service,
            account: account
        ) else {
            print("Не удалось получить пароль")
            return
        }
        let password = String(decoding: data, as: UTF8.self)
        print(password)
    }
    
    func keychainRemove(service: String, account: String) {
        do {
            try keychain.delete(
                service: service,
                account: account
            )
        } catch {
            print(error)
        }
    }
    
}
