//
//  AuthorizationViewModel.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 3/7/23.
//

import Foundation
import FirebaseAuth

class AuthorizationViewModel {
    private let numberAuthService = PhoneNumberAuthorizationService()
    private let emailAuthService = EmailAuthorizationService()
    
    func signInNumber(
        with phoneNumber: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        numberAuthService.signIn(with: phoneNumber, completion: completion)
    }
    
    func signInVerificationCode(
        with verificationCode: String,
        completion: @escaping (Result<User, Error>) -> Void
    ) {
        numberAuthService.signInverificationCode(with: verificationCode, completion: completion)
    }
    
    func signInEmail(
        email: String,
        password: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        emailAuthService.signIn(email: email, password: password, completion: completion)
    }
    
    func signUpEmail(
        email: String,
        password: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        emailAuthService.signUp(email: email, password: password, completion: completion)
    }
}
