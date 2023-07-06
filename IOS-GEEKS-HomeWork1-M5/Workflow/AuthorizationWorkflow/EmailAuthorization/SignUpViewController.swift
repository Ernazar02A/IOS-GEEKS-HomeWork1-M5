//
//  SignUpViewController.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 3/7/23.
//

import UIKit

class SignUpViewController: UIViewController {

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
    private let signUpLabel = MakeView.shared.makeLabel(
        text: "Регистрация",
        bgColor: .clear,
        cornerRadius: Constants.Sizing.corner20,
        size: Constants.Sizing.text20,
        weight: .medium
    )
    private let  loginLabel = MakeView.shared.makeLabel(
        text: "Эл.почта",
        bgColor: .clear,
        cornerRadius: Constants.Sizing.corner20,
        size: Constants.Sizing.text16,
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
        size: Constants.Sizing.text16,
        weight: .regular,
        alignment: .left
    )
    private let passwordTextField = MakeView.shared.makeTextField(
        placeholder: "111111",
        cornerRadius: Constants.Sizing.corner10
    )
    private let confirmdLabel = MakeView.shared.makeLabel(
        text: "Повторите Пароль",
        bgColor: .clear,
        cornerRadius: Constants.Sizing.corner20,
        size: Constants.Sizing.text16,
        weight: .regular,
        alignment: .left
    )
    private let confirmTextField = MakeView.shared.makeTextField(
        placeholder: "111111",
        cornerRadius: Constants.Sizing.corner10
    )
    private let signUpButton = MakeView.shared.makeButton(
        text: "Sign up",
        bgColor: .black,
        cornerRadius: Constants.Sizing.corner10,
        size: Constants.Sizing.text25,
        weight: .medium,
        color: .white
    )
    private let signInButton = MakeView.shared.makeButton(
        text: "Войти",
        bgColor: .clear,
        size: Constants.Sizing.text18,
        weight: .medium,
        color: .black
    )
    private let errorLabel = MakeView.shared.makeLabel(
        text: "",
        bgColor: .clear,
        size: Constants.Sizing.text16,
        weight: .regular,
        color: .red
    )
    
    private  let auth = AuthorizationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        addConstraints()
    }
    
    private func addView() {
        view.addSubview(backgroundImage)
        view.addSubview(authView)
        authView.addSubview(signUpLabel)
        authView.addSubview(loginLabel)
        authView.addSubview(signUpButton)
        authView.addSubview(emailTextField)
        authView.addSubview(passwordTextField)
        authView.addSubview(passwordLabel)
        authView.addSubview(confirmdLabel)
        authView.addSubview(confirmTextField)
        authView.addSubview(errorLabel)
        authView.addSubview(signInButton)
        signUpButton.addTarget(
            self,
            action: #selector(signUpButtonTapped),
            for: .touchUpInside
        )
        signInButton.addTarget(
            self,
            action: #selector(signInButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc private func signUpButtonTapped(sender: UIButton) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let confirm = confirmTextField.text else {
            return
        }
        let result = auth.checkSignInEndSignUp(
            email: email,
            password: password,
            confirm: confirm
        )
        errorLabel.text = auth.workErrors(error: result)
        guard errorLabel.text == "" else {
            return
        }
        auth.signUpEmail(email: email, password: password) { [weak self]result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(()):
                self.navigationController?.pushViewController(RickAndMortyViewController(), animated: true)
            case .failure(let error):
                if error.localizedDescription == "The email address is already in use by another account." {
                    errorLabel.text = "The email address is already in use by another account."
                } else {
                    errorLabel.text = "Введите email в правильном формате"
                }
                print(error.localizedDescription)
            }
        }
    }
    
    @objc private func signInButtonTapped(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    private func addConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        authView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(420)
        }
        
        signUpLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(15)
            make.top.equalToSuperview().offset(15)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.top.equalTo(signUpLabel.snp.bottom).offset(20)
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
        
        confirmdLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
        }
        
        confirmTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(45)
            make.top.equalTo(confirmdLabel.snp.bottom).offset(5)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(confirmTextField.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(150)
            make.top.equalTo(confirmTextField.snp.bottom).offset(42)
            make.centerX.equalToSuperview()
        }
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
}
