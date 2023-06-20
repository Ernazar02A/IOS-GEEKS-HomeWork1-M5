//
//  CharacterCollectionViewCell.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 20/6/23.
//

import UIKit
import Kingfisher

class CharacterCollectionViewCell: UICollectionViewCell {

    static let reuseID = String(describing: CharacterCollectionViewCell.self)

    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        //view.textColor = .white
        view.text = "morty"
        view.textAlignment = .center
        return view
    }()
    private lazy var genederLabel: UILabel = {
        let view = UILabel()
        //view.textColor = .white
        view.text = "morty"
        view.textAlignment = .center
        return view
    }()
    private lazy var characterImageView: UIImageView = {
        let view = UIImageView()
        view.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        view.image = UIImage(systemName: "person.fill")
        view.backgroundColor = .clear
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var hStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(characterImageView)
        view.addArrangedSubview(vStackView)
        view.distribution = .fillProportionally
        view.axis = .vertical
        return view
    }()
    
    private lazy var vStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(nameLabel)
        view.addArrangedSubview(genederLabel)
        view.distribution = .fillEqually
        view.axis = .vertical
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 25
        
        addSubview(hStackView)
        hStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func display(item: Character) {
        nameLabel.text = item.name
        genederLabel.text = item.gender
        characterImageView.kf.setImage(with: URL(string: item.image))
    }
}
