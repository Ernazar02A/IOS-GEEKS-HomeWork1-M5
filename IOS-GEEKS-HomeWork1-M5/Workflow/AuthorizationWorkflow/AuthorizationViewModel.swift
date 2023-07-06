//
//  AuthorizationViewModel.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 3/7/23.
//

import Foundation
import FirebaseAuth

class AuthorizationViewModel {
    
    enum AuthorizationError {
        case shortPaswword
        case empty
        case norm
        case notLike
    }
    
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
    
    func checkSignInEndSignUp(email: String, password: String, confirm: String?) -> AuthorizationError {
        guard let confirm = confirm else {
            return password.count == 0 || email.count == 0 ? .empty : .norm
        }
        if email.count == 0 || password.count == 0 || confirm.count == 0 {
            return .empty
        } else if password.count < 6 {
            return .shortPaswword
        } else if password != confirm {
            return .notLike
        }
        
        return .norm
    }
    
    func workErrors(error: AuthorizationError) -> String {
        switch error {
        case .shortPaswword:
            return "Ваш пароль должен быть не меньше шести символов"
        case .empty:
            return "поля не должны быть пустыми"
        case .norm:
            return ""
        case .notLike:
            return "Пароли не совпадат"
        }
    }
}
