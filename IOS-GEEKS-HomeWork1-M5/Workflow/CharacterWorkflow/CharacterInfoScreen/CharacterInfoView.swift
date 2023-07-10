//
//  CharacterInfoView.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 10/7/23.
//

import UIKit


class CharacterInfoView: CustomView {
    
    lazy var nameLabel = MakeView.shared.makeLabel(
        text: "Rick",
        bgColor: .clear,
        size: Constants.Sizing.text30,
        weight: .bold,
        color: .white
    )
    lazy var characterImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = Constants.Sizing.corner20
        view.clipsToBounds = true
        return view
    }()
    lazy var viewForImage: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = Constants.Sizing.corner15
        return view
    }()
    lazy var infoLabel = MakeView.shared.makeLabel(
        text: "INFO",
        bgColor: .clear,
        weight: .light,
        color: .lightGray
    )
    lazy var viewForInfo: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = Constants.Sizing.corner15
        return view
    }()
    lazy var speciesTypesLabel = MakeView.shared.makeLabel(
        text: "Species",
        size: Constants.Sizing.text20,
        weight: .regular,
        color: .black
    )
    lazy var speciesLabel = MakeView.shared.makeLabel(
        text: "Human",
        bgColor: .clear,
        size: Constants.Sizing.text20,
        weight: .bold,
        color: .black
    )
    lazy var genderTypesLabel = MakeView.shared.makeLabel(
        text: "Gender",
        size: Constants.Sizing.text20,
        weight: .regular,
        color: .black
    )
    lazy var genderLabel = MakeView.shared.makeLabel(
        text: "Male",
        size: Constants.Sizing.text20,
        weight: .bold,
        color: .black
    )
    lazy var statusTypeLabel = MakeView.shared.makeLabel(
        text: "Status",
        size: Constants.Sizing.text20,
        weight: .regular,
        color: .black
    )
    lazy var statusLabel = MakeView.shared.makeLabel(
        text: "Dead",
        size: Constants.Sizing.text20,
        weight: .bold,
        color: .black
    )
    lazy var labelType = MakeView.shared.makeLabel(
        text: "Type",
        size: Constants.Sizing.text20,
        weight: .regular,
        color: .black
    )
    lazy var typeLabel = MakeView.shared.makeLabel(
        text: "Dead",
        size: Constants.Sizing.text20,
        weight: .bold,
        color: .black
    )
    lazy var speciesImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "bird")
        view.tintColor = .black
        return view
    }()
    lazy var genderImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.fill.questionmark")
        view.tintColor = .black
        return view
    }()
    lazy var statusImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "bonjour")
        view.tintColor = .black
        return view
    }()
    lazy var typeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "tropicalstorm")
        view.tintColor = .black
        return view
    }()
    
    lazy var underLine1: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var underLine2: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var underLine3: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
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
        addSubview(nameLabel)
        addSubview(viewForImage)
        viewForImage.addSubview(characterImage)
        addSubview(infoLabel)
        addSubview(viewForInfo)
        
        viewForInfo.addSubview(speciesImage)
        viewForInfo.addSubview(speciesLabel)
        viewForInfo.addSubview(speciesTypesLabel)
        
        viewForInfo.addSubview(genderImage)
        viewForInfo.addSubview(genderLabel)
        viewForInfo.addSubview(genderTypesLabel)
        
        viewForInfo.addSubview(statusImage)
        viewForInfo.addSubview(statusLabel)
        viewForInfo.addSubview(statusTypeLabel)
        
        viewForInfo.addSubview(typeImage)
        viewForInfo.addSubview(typeLabel)
        viewForInfo.addSubview(labelType)
        
        viewForInfo.addSubview(underLine1)
        viewForInfo.addSubview(underLine2)
        viewForInfo.addSubview(underLine3)
    }
    
    override func layoutViews() {
        setupConstraints()
    }
    
    func setupConstraints() {
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        viewForImage.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(35)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(220)
        }
        
        characterImage.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(15)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(viewForImage.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(40)
        }
        
        viewForInfo.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(250)
        }
        
        speciesImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
            make.height.width.equalTo(40)
        }
        
        speciesTypesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(speciesImage.snp.trailing).offset(5)
        }
        
        speciesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        underLine1.snp.makeConstraints { make in
            make.top.equalTo(speciesTypesLabel.snp.bottom).offset(10)
            make.leading.equalTo(speciesTypesLabel.snp.leading)
            make.height.equalTo(1)
            make.trailing.equalToSuperview()
        }
        
        genderImage.snp.makeConstraints { make in
            make.top.equalTo(speciesImage.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.height.width.equalTo(40)
        }
        
        genderTypesLabel.snp.makeConstraints { make in
            make.top.equalTo(genderImage.snp.top).offset(10)
            make.leading.equalTo(genderImage.snp.trailing).offset(5)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(genderImage.snp.top).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        underLine2.snp.makeConstraints { make in
            make.top.equalTo(genderTypesLabel.snp.bottom).offset(10)
            make.leading.equalTo(genderTypesLabel.snp.leading)
            make.height.equalTo(1)
            make.trailing.equalToSuperview()
        }
        
        statusImage.snp.makeConstraints { make in
            make.top.equalTo(genderImage.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.height.width.equalTo(40)
        }
        
        statusTypeLabel.snp.makeConstraints { make in
            make.top.equalTo(statusImage.snp.top).offset(10)
            make.leading.equalTo(statusImage.snp.trailing).offset(5)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(statusImage.snp.top).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        underLine3.snp.makeConstraints { make in
            make.top.equalTo(statusTypeLabel.snp.bottom).offset(10)
            make.leading.equalTo(statusTypeLabel.snp.leading)
            make.height.equalTo(1)
            make.trailing.equalToSuperview()
        }
        
        typeImage.snp.makeConstraints { make in
            make.top.equalTo(statusImage.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.height.width.equalTo(40)
        }
        
        labelType.snp.makeConstraints { make in
            make.top.equalTo(typeImage.snp.top).offset(10)
            make.leading.equalTo(typeImage.snp.trailing).offset(5)
        }
        
        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(typeImage.snp.top).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
