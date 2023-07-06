//
//  CharacterInfoViewController.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 20/6/23.
//

import UIKit

class CharacterInfoViewController: UIViewController {
    
    private lazy var nameLabel = MakeView.shared.makeLabel(
        text: "Rick",
        size: Constants.Sizing.text30,
        weight: .bold
    )
    private lazy var characterImage: UIImageView = {
        let view = UIImageView()
        
        view.snp.makeConstraints { make in
            make.width.height.equalTo(200)
        }
        return view
    }()
    private lazy var genderLabel = MakeView.shared.makeLabel(
        text: "Male",
        size: Constants.Sizing.text30,
        weight: .medium,
        color: .white
    )
    private lazy var typeLabel = MakeView.shared.makeLabel(
        text: "Male",
        size: Constants.Sizing.text30,
        weight: .medium,
        color: .white
    )
    
    var character: Character?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setup()
        updateInfo()
    }
    
    private func setup() {
        view.addSubview(characterImage)
        characterImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        updateInfo()
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(characterImage.snp.bottom).offset(50)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        view.addSubview(genderLabel)
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(25)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        view.addSubview(typeLabel)
        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp.bottom).offset(25)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    private func updateInfo() {
        guard let character else {
            return
        }
        characterImage.kf.setImage(with: URL(string: character.image))
        nameLabel.text = "Character name is \(character.name)"
        genderLabel.text = "Character gender is a \(character.gender)"
        if !character.type.isEmpty {
            typeLabel.text = "Character type is a \(character.type)"
        }
    }
}
