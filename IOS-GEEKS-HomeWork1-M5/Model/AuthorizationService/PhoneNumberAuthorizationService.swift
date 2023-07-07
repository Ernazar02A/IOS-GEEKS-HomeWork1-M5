//
//  AuthorizationService.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 2/7/23.
//

import UIKit
import FirebaseAuth

class PhoneNumberAuthorizationService: BaseAuthorization {
    
    private let keychain = KeychainStorage.shared
    
    func signIn(
        with phoneNumber: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                // Sign in using the verificationID and the code sent to the user
                if let error = error {
                    print(error)
                    completion(.failure(error))
                }
                let data = Data((verificationID ?? "").utf8)
                
                do {
                    try self.keychain.save(
                        service:
                            Constants
                            .Authorization
                            .service,
                        account:
                            Constants
                            .Authorization
                            .account,
                        data: data
                    )
                } catch {
                    print(error.localizedDescription)
                }
                
                completion(.success(()))
            }
    }
    
    func signInverificationCode(
        with verificationCode: String,
        completion: @escaping (Result<User, Error>) -> Void
    ) {
        guard let data = keychain.get(
            service:
                Constants
                .Authorization
                .service,
            account:
                Constants
                .Authorization
                .account
        ) else {
            return
        }
        
        let verificationID = String(data: data, encoding: .utf8)!
        
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: verificationCode
        )
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error {
                completion(.failure(error))
            }
            guard let user = authResult?.user else {
                return
            }
            print("Our user is: \(user)")
            self.saveSession()
            completion(.success(user))
        }
    }
}
