//
//  SignUpViewController.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 3/7/23.
//

import UIKit

class SignUpViewController: UIViewController {

    private let backgroundImage: UIImageView = MakeView.shared.makeImage(
        type: .named,
        image: "AuthbgImage"
    )
    private lazy var authView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        view.layer.cornerRadius = Constants.Sizing.corner20
        return view
    }()
    private lazy var signUpLabel = MakeView.shared.makeLabel(
        text: "Регистрация",
        bgColor: .clear,
        cornerRadius: Constants.Sizing.corner20,
        size: Constants.Sizing.text20,
        weight: .medium
    )
    private lazy var  loginLabel = MakeView.shared.makeLabel(
        text: "Эл.почта",
        bgColor: .clear,
        cornerRadius: Constants.Sizing.corner20,
        size: Constants.Sizing.text16,
        weight: .regular,
        alignment: .left
    )
    private lazy var emailTextField = MakeView.shared.makeTextField(
        placeholder: "ernazaraibekov2017@gmail.com",
        cornerRadius: Constants.Sizing.corner10,
        text: "ernazaraibekov2017@gmail.com"
    )
    private lazy var passwordLabel = MakeView.shared.makeLabel(
        text: "Пароль",
        bgColor: .clear,
        cornerRadius: Constants.Sizing.corner20,
        size: Constants.Sizing.text16,
        weight: .regular,
        alignment: .left
    )
    private lazy var passwordTextField = MakeView.shared.makeTextField(
        placeholder: "111111",
        cornerRadius: Constants.Sizing.corner10,
        securyText: true
    )
    private lazy var confirmdLabel = MakeView.shared.makeLabel(
        text: "Повторите Пароль",
        bgColor: .clear,
        cornerRadius: Constants.Sizing.corner20,
        size: Constants.Sizing.text16,
        weight: .regular,
        alignment: .left
    )
    private lazy var confirmTextField = MakeView.shared.makeTextField(
        placeholder: "111111",
        cornerRadius: Constants.Sizing.corner10,
        securyText: true
    )
    private lazy var signUpButton = MakeView.shared.makeButton(
        text: "Sign up",
        bgColor: .black,
        cornerRadius: Constants.Sizing.corner10,
        size: Constants.Sizing.text25,
        weight: .medium,
        titleColor: .white
    )
    private lazy var signInButton = MakeView.shared.makeButton(
        text: "Войти",
        bgColor: .clear,
        size: Constants.Sizing.text18,
        weight: .medium,
        titleColor: .black
    )
    private lazy var errorLabel = MakeView.shared.makeLabel(
        text: "",
        bgColor: .clear,
        size: Constants.Sizing.text16,
        weight: .regular,
        color: .red
    )
    private lazy var eyeSecuryPassTFButton = MakeView.shared.makeButton(
        titleColor: .gray,
        image: UIImage(systemName: "eye.slash.fill")
    )
    private lazy var eyeSecuryConfirmTFButton = MakeView.shared.makeButton(
        titleColor: .gray,
        image: UIImage(systemName: "eye.slash.fill")
    )
    
    private let authorizationViewModel = AuthorizationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        addConstraints()
    }
    
    @objc private func eyeSecuryPassTFButtonTapped(sender: UIButton ) {
        passwordTextField.changeSecuryPassword(sender)
    }
    
    @objc private func eyeSecuryConfirmTFButtonTapped(sender: UIButton ) {
        confirmTextField.changeSecuryPassword(sender)
    }
    
    private func addView() {
        view.addSubview(backgroundImage)
        view.addSubview(authView)
        authView.addSubview(signUpLabel)
        authView.addSubview(loginLabel)
        authView.addSubview(signUpButton)
        authView.addSubview(emailTextField)
        authView.addSubview(passwordTextField)
        passwordTextField.addSubview(eyeSecuryPassTFButton)
        eyeSecuryPassTFButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
        }
        authView.addSubview(passwordLabel)
        authView.addSubview(confirmdLabel)
        authView.addSubview(confirmTextField)
        confirmTextField.addSubview(eyeSecuryConfirmTFButton)
        eyeSecuryConfirmTFButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
        }
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
        eyeSecuryPassTFButton.addTarget(
            self,
            action: #selector(eyeSecuryPassTFButtonTapped),
            for: .touchUpInside
        )
        eyeSecuryConfirmTFButton.addTarget(
            self,
            action: #selector(eyeSecuryConfirmTFButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc private func signUpButtonTapped(sender: UIButton) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let confirm = confirmTextField.text else {
            return
        }
        let result = authorizationViewModel.checkSignInEndSignUp(
            email: email,
            password: password,
            confirm: confirm
        )
        errorLabel.text = authorizationViewModel.workErrors(error: result)
        guard errorLabel.text == "" else {
            return
        }
        authorizationViewModel.signUpEmail(email: email, password: password) { [weak self]result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(()):
                let vc = MainTabBarViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false)
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
