//
//  PhoneAuthorizationViewController.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 3/7/23.
//

import UIKit

class PhoneAuthorizationViewController: UIViewController {

    private let backgroundImage: UIImageView = MakeView.shared.makeImage(
        type: .named,
        image: "AuthbgImage"
    )
    private let authView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        view.layer.cornerRadius = Constants.Sizing.corner20
        return view
    }()
    private let chooseLabel = MakeView.shared.makeLabel(
        text: "Введите ваш номер",
        bgColor: .clear,
        cornerRadius: Constants.Sizing.corner20,
        size: Constants.Sizing.text20,
        weight: .medium
    )
    private let phoneTextField = MakeView.shared.makeTextField(
        placeholder: "+996 707 725678",
        cornerRadius: Constants.Sizing.corner10,
        text: "+996707725678"
    )
    private let submitButton = MakeView.shared.makeButton(
        text: "Get Code",
        cornerRadius: Constants.Sizing.corner15,
        size: Constants.Sizing.text25,
        weight: .medium
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
        authView.addSubview(chooseLabel)
        authView.addSubview(submitButton)
        authView.addSubview(phoneTextField)
        submitButton.addTarget(
            self,
            action: #selector(submitButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc private func submitButtonTapped(sender: UIButton) {
        guard let number = phoneTextField.text else {
            return
        }
        auth.signInNumber(with: number) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(()):
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(
                        SMSCodeViewController(),
                        animated: true
                    )
                }
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
        
        phoneTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(45)
            make.top.equalTo(chooseLabel.snp.bottom).offset(20)
        }
        
        submitButton.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(150)
            make.bottom.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }
    }
}
