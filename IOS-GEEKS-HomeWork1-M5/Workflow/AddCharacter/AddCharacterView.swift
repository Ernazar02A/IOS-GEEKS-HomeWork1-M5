//
//  AddCharacterView.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 9/7/23.
//

import UIKit

protocol AddCharacterViewDelegate: AnyObject {
    func AddCharacterView(checkTF result: Bool, _ character: Character)
}

class AddCharacterView: CustomView {
    
    weak var delegate: AddCharacterViewDelegate?
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = Constants.Sizing.corner15
        return view
    }()
    lazy var nameTextfieldLabel = MakeView.shared.makeLabel(
        text: "Name",
        weight: .medium
    )
    lazy var speciesTextfieldLabel = MakeView.shared.makeLabel(
        text: "Species",
        weight: .medium
    )
    lazy var genderTextfieldLabel = MakeView.shared.makeLabel(
        text: "Gender",
        weight: .medium
    )
    lazy var statusTextfieldLabel = MakeView.shared.makeLabel(
        text: "Status",
        weight: .medium
    )
    lazy var typeTextfieldLabel = MakeView.shared.makeLabel(
        text: "Type",
        weight: .medium
    )
    lazy var imageTextfieldLabel = MakeView.shared.makeLabel(
        text: "Image",
        weight: .medium
    )
    lazy var nameTextfield = MakeView.shared.makeTextField(
        placeholder: "Name",
        cornerRadius: Constants.Sizing.corner10,
        borderWidth: 1
    )
    lazy var genderTextfield = MakeView.shared.makeTextField(
        placeholder: "Gender",
        cornerRadius: Constants.Sizing.corner10,
        borderWidth: 1
    )
    lazy var statusTextfield = MakeView.shared.makeTextField(
        placeholder: "Status",
        cornerRadius: Constants.Sizing.corner10,
        borderWidth: 1
    )
    lazy var typeTextfield = MakeView.shared.makeTextField(
        placeholder: "Type",
        cornerRadius: Constants.Sizing.corner10,
        borderWidth: 1
    )
    lazy var speciesTextfield = MakeView.shared.makeTextField(
        placeholder: "Species",
        cornerRadius: Constants.Sizing.corner10,
        borderWidth: 1
    )
    lazy var imageTextfield = MakeView.shared.makeTextField(
        placeholder: "Image",
        cornerRadius: Constants.Sizing.corner10,
        borderWidth: 1
    )
    lazy var addButton = MakeView.shared.makeButton(
        text: "Add",
        cornerRadius: Constants.Sizing.corner15
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        layoutViews()
    }
    
    override func setupViews() {
        backgroundColor = UIColor.black
        addSubview(bgView)
        addSubview(addButton)
        addButton.addTarget(self, action: #selector(didTappedAddButton), for: .touchUpInside)
        bgView.addSubview(nameTextfieldLabel)
        bgView.addSubview(nameTextfield)
        bgView.addSubview(speciesTextfieldLabel)
        bgView.addSubview(speciesTextfield)
        bgView.addSubview(genderTextfieldLabel)
        bgView.addSubview(genderTextfield)
        bgView.addSubview(statusTextfieldLabel)
        bgView.addSubview(statusTextfield)
        bgView.addSubview(imageTextfieldLabel)
        bgView.addSubview(imageTextfield)
        bgView.addSubview(typeTextfieldLabel)
        bgView.addSubview(typeTextfield)
    }
    
    override func layoutViews() {
        setupConstraints()
    }
    
    func setupConstraints() {
        
        bgView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-170)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
        
        addButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(150)
            make.top.equalTo(bgView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        nameTextfieldLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        nameTextfield.snp.makeConstraints { make in
            make.top.equalTo(nameTextfieldLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        
        speciesTextfieldLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextfield.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        speciesTextfield.snp.makeConstraints { make in
            make.top.equalTo(speciesTextfieldLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        
        genderTextfieldLabel.snp.makeConstraints { make in
            make.top.equalTo(speciesTextfield.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        genderTextfield.snp.makeConstraints { make in
            make.top.equalTo(genderTextfieldLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        
        statusTextfieldLabel.snp.makeConstraints { make in
            make.top.equalTo(genderTextfield.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        statusTextfield.snp.makeConstraints { make in
            make.top.equalTo(statusTextfieldLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        
        imageTextfieldLabel.snp.makeConstraints { make in
            make.top.equalTo(statusTextfield.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        imageTextfield.snp.makeConstraints { make in
            make.top.equalTo(imageTextfieldLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        
        typeTextfieldLabel.snp.makeConstraints { make in
            make.top.equalTo(imageTextfield.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        typeTextfield.snp.makeConstraints { make in
            make.top.equalTo(typeTextfieldLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
    }
}

extension AddCharacterView {
    @objc func didTappedAddButton(_ sender: UIButton) {
        let name = nameTextfield.checkForEmptiness()
        let species = speciesTextfield.checkForEmptiness()
        let gender = genderTextfield.checkForEmptiness()
        let status = statusTextfield.checkForEmptiness()
        let type = typeTextfield.checkForEmptiness()
        let image = imageTextfield.checkForEmptiness()
        if name && species && gender && status && type && image {
            delegate?.AddCharacterView(checkTF: true, getCharacter())
        } else {
            delegate?.AddCharacterView(checkTF: false, getCharacter())
        }
    }
    
    func getCharacter() -> Character {
        let character = Character(
            name: nameTextfield.text!,
            status: statusTextfield.text!,
            species: speciesTextfield.text!,
            type: typeTextfield.text!,
            gender: genderTextfield.text!,
            image: imageTextfield.text!
        )
       return character
    }
    
    func clearTFiels() {
       nameTextfield.text = ""
       speciesTextfield.text = ""
       genderTextfield.text = ""
       statusTextfield.text = ""
       typeTextfield.text = ""
       imageTextfield.text = ""
    }
}
