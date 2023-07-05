//
//  AuthorizationViewController.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 3/7/23.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    private let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "AuthbgImage")
        return view
    }()
    private let authView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        view.layer.cornerRadius = Constants.Sizing.corner10
        return view
    }()
    private let chooseLabel = MakeView.shared.makeLabel(
        text: "Выберите способ авторизации",
        bgColor: .clear,
        cornerRadius: Constants.Sizing.corner20,
        size: 20,
        weight: .medium
    )
    private let phoneButton = MakeView.shared.makeButton(
        text: "",
        cornerRadius: Constants.Sizing.corner50,
        image: UIImage(named: "phone")
    )
    private let emailButton = MakeView.shared.makeButton(
        text: "",
        bgColor: .clear,
        image: UIImage(named: "email")
    )
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesBackButton = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        addConstraints()
    }
    
    private func addView() {
        view.addSubview(backgroundImage)
        view.addSubview(authView)
        authView.addSubview(chooseLabel)
        authView.addSubview(phoneButton)
        phoneButton.addTarget(
            self,
            action: #selector(phoneButtonTapped),
            for: .touchUpInside
        )
        authView.addSubview(emailButton)
        emailButton.addTarget(
            self,
            action: #selector(emailButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc private func phoneButtonTapped(sender: UIButton) {
        navigationController?.pushViewController(
            PhoneAuthorizationViewController(),
            animated: false
        )
    }
    
    @objc private func emailButtonTapped(sender: UIButton) {
        navigationController?.pushViewController(
            SignInViewController(),
            animated: false
        )
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
        
        emailButton.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.top.equalTo(chooseLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        phoneButton.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.top.equalTo(chooseLabel.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
