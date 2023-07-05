//
//  SignInViewController.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 5/7/23.
//

import UIKit

class SignInViewController: UIViewController {

    private let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "AuthbgImage")
        return view
    }()
    private let authView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        view.layer.cornerRadius = Constants.Sizing.corner20
        return view
    }()
    private let signInLabel = MakeView.shared.makeLabel(
        text: "Войти",
        bgColor: .clear,
        cornerRadius: Constants.Sizing.corner20,
        size: 20,
        weight: .medium
    )
    private let loginLabel = MakeView.shared.makeLabel(
        text: "Эл.почта",
        bgColor: .clear,
        cornerRadius: Constants.Sizing.corner20,
        size: 16,
        weight: .regular,
        alignment: .left
    )
    private let emailTextField = MakeView.shared.makeTextField(
        placeholder: "ernazaraibekov2017@gmail.com",
        cornerRadius: Constants.Sizing.corner10,
        text: "ernazaraibekov2017@gmail.com"
    )
    private let passwordLabel = MakeView.shared.makeLabel(
        text: "Пароль",
        bgColor: .clear,
        cornerRadius: Constants.Sizing.corner20,
        size: 16,
        weight: .regular,
        alignment: .left
    )
    private let passwordTextField = MakeView.shared.makeTextField(
        placeholder: "111111",
        cornerRadius: Constants.Sizing.corner10
    )
    private let signInButton = MakeView.shared.makeButton(
        text: "Sign in",
        bgColor: .black,
        cornerRadius: Constants.Sizing.corner10,
        size: 25,
        weight: .medium,
        color: .white
    )
    private let signUpButton = MakeView.shared.makeButton(
        text: "Регистрация",
        bgColor: .clear,
        size: 18,
        weight: .medium,
        color: .black
    )
    
    private let auth = AuthorizationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        addConstraints()
    }
    
    private func addView() {
        view.addSubview(backgroundImage)
        view.addSubview(authView)
        authView.addSubview(signInLabel)
        authView.addSubview(loginLabel)
        authView.addSubview(signInButton)
        authView.addSubview(emailTextField)
        authView.addSubview(passwordLabel)
        authView.addSubview(passwordTextField)
        authView.addSubview(signUpButton)
        
        signInButton.addTarget(
            self,
            action: #selector(signInButtonTapped),
            for: .touchUpInside
        )
        signUpButton.addTarget(
            self,
            action: #selector(signUpButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc private func signInButtonTapped(sender: UIButton) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {
            return
        }
        auth.signInEmail(email: email, password: password) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(()):
                navigationController?.pushViewController(RickAndMortyViewController(), animated: true)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @objc private func signUpButtonTapped(sender: UIButton) {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    private func addConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        authView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(320)
        }
        
        signInLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(15)
            make.top.equalToSuperview().offset(15)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.top.equalTo(signInLabel.snp.bottom).offset(20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(45)
            make.top.equalTo(loginLabel.snp.bottom).offset(5)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(45)
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
        }
        
        signInButton.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(150)
            make.top.equalTo(passwordTextField.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }

}
