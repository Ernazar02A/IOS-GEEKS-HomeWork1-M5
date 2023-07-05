//
//  EmailAuthorizationService.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 4/7/23.
//

import Foundation
import FirebaseAuth

class EmailAuthorizationService: BaseAuthorization {
    
    func signIn(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            } else {
                completion(.success(()))
                self.saveSession()
            }
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            } else {
                completion(.success(()))
                self.saveSession()
            }
        }
    }
}
