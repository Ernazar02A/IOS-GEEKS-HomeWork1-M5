//
//  AddCharacterViewController.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 6/7/23.
//

import UIKit

class AddCharacterViewController: UIViewController {
    
    private lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = Constants.Sizing.corner15
        return view
    }()
    private lazy var nameTextfieldLabel = MakeView.shared.makeLabel(
        text: "Name",
        weight: .medium
    )
    private lazy var speciesTextfieldLabel = MakeView.shared.makeLabel(
        text: "Species",
        weight: .medium
    )
    private lazy var genderTextfieldLabel = MakeView.shared.makeLabel(
        text: "Gender",
        weight: .medium
    )
    private lazy var statusTextfieldLabel = MakeView.shared.makeLabel(
        text: "Status",
        weight: .medium
    )
    private lazy var typeTextfieldLabel = MakeView.shared.makeLabel(
        text: "Type",
        weight: .medium
    )
    private lazy var imageTextfieldLabel = MakeView.shared.makeLabel(
        text: "Image",
        weight: .medium
    )
    private lazy var nameTextfield = MakeView.shared.makeTextField(
        placeholder: "Name",
        cornerRadius: Constants.Sizing.corner10,
        borderWidth: 1
    )
    private lazy var genderTextfield = MakeView.shared.makeTextField(
        placeholder: "Gender",
        cornerRadius: Constants.Sizing.corner10,
        borderWidth: 1
    )
    private lazy var statusTextfield = MakeView.shared.makeTextField(
        placeholder: "Status",
        cornerRadius: Constants.Sizing.corner10,
        borderWidth: 1
    )
    private lazy var typeTextfield = MakeView.shared.makeTextField(
        placeholder: "Type",
        cornerRadius: Constants.Sizing.corner10,
        borderWidth: 1
    )
    private lazy var speciesTextfield = MakeView.shared.makeTextField(
        placeholder: "Species",
        cornerRadius: Constants.Sizing.corner10,
        borderWidth: 1
    )
    private lazy var imageTextfield = MakeView.shared.makeTextField(
        placeholder: "Image",
        cornerRadius: Constants.Sizing.corner10,
        borderWidth: 1
    )
    private lazy var addButton = MakeView.shared.makeButton(
        text: "Add",
        cornerRadius: Constants.Sizing.corner15
    )
    
    let rickAndMortyViewModel = RickAndMortyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @objc private func addButtonTapped() {
        let name = nameTextfield.checkForEmptiness()
        let species = speciesTextfield.checkForEmptiness()
        let gender = genderTextfield.checkForEmptiness()
        let status = statusTextfield.checkForEmptiness()
        let type = typeTextfield.checkForEmptiness()
        let image = imageTextfield.checkForEmptiness()
        if name && species && gender && status && type && image {
            showAlert()
            let character = Character(
                name: nameTextfield.text!,
                status: statusTextfield.text!,
                species: speciesTextfield.text!,
                type: typeTextfield.text!,
                gender: genderTextfield.text!,
                image: imageTextfield.text!
            )
            rickAndMortyViewModel.addNewCharachter(character: character)
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(
            title: nameTextfield.text,
            message: "Персонаж добавлен",
            preferredStyle: .alert
        )
        let action = UIAlertAction(
            title: "Ок",
            style: .default
        ) { action in
            self.nameTextfield.text = ""
            self.speciesTextfield.text = ""
            self.genderTextfield.text = ""
            self.statusTextfield.text = ""
            self.typeTextfield.text = ""
            self.imageTextfield.text = ""
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func setup() {
        view.addSubview(bgView)
        view.addSubview(addButton)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        bgView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(view.frame.size.height / 1.5)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
        
        addButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(150)
            make.top.equalTo(bgView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        bgView.addSubview(nameTextfieldLabel)
        bgView.addSubview(nameTextfield)
        
        nameTextfieldLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        nameTextfield.snp.makeConstraints { make in
            make.top.equalTo(nameTextfieldLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        
        bgView.addSubview(speciesTextfieldLabel)
        bgView.addSubview(speciesTextfield)
        
        speciesTextfieldLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextfield.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        speciesTextfield.snp.makeConstraints { make in
            make.top.equalTo(speciesTextfieldLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        
        bgView.addSubview(genderTextfieldLabel)
        bgView.addSubview(genderTextfield)
        
        genderTextfieldLabel.snp.makeConstraints { make in
            make.top.equalTo(speciesTextfield.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        genderTextfield.snp.makeConstraints { make in
            make.top.equalTo(genderTextfieldLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        
        bgView.addSubview(statusTextfieldLabel)
        bgView.addSubview(statusTextfield)
        
        statusTextfieldLabel.snp.makeConstraints { make in
            make.top.equalTo(genderTextfield.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        statusTextfield.snp.makeConstraints { make in
            make.top.equalTo(statusTextfieldLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        
        bgView.addSubview(imageTextfieldLabel)
        bgView.addSubview(imageTextfield)
        
        imageTextfieldLabel.snp.makeConstraints { make in
            make.top.equalTo(statusTextfield.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        imageTextfield.snp.makeConstraints { make in
            make.top.equalTo(imageTextfieldLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        
        bgView.addSubview(typeTextfieldLabel)
        bgView.addSubview(typeTextfield)
        
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
