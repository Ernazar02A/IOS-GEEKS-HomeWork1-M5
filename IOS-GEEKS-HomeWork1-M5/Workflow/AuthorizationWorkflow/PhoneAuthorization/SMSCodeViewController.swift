//
//  SMSCodeViewController.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 3/7/23.
//

import UIKit

class SMSCodeViewController: UIViewController {

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
    private let chooseLabel = MakeView.shared.makeLabel(
        text: "Введите смс код",
        bgColor: .clear,
        cornerRadius: Constants.Sizing.corner20,
        size: Constants.Sizing.text20,
        weight: .medium
    )
    private let smsCodeTextField = MakeView.shared.makeTextField(
        placeholder: "",
        cornerRadius: Constants.Sizing.corner10
    )
    private let sabmitButton = MakeView.shared.makeButton(
        text: "Submit",
        cornerRadius: Constants.Sizing.corner10,
        size: Constants.Sizing.text25,
        weight: .medium
    )
    
    private let auth = AuthorizationViewModel()
    private let keyChain = KeychainStorage.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        addConstraints()
    }
    
    private func addView() {
        view.addSubview(backgroundImage)
        view.addSubview(authView)
        authView.addSubview(chooseLabel)
        authView.addSubview(sabmitButton)
        authView.addSubview(smsCodeTextField)
        sabmitButton.addTarget(
            self,
            action: #selector(submitButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc private func submitButtonTapped(sender: UIButton) {
        guard let smsCode = smsCodeTextField.text else {
            return
        }
        
        auth.signInVerificationCode(with: smsCode) { [weak self]result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let user):
                print(user)
                let vc = RickAndMortyViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func addConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        authView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(200)
        }
        
        chooseLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(15)
            make.top.equalToSuperview().offset(25)
        }
        
        smsCodeTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(45)
            make.top.equalTo(chooseLabel.snp.bottom).offset(20)
        }
        
        sabmitButton.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(150)
            make.bottom.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }
    }
}
