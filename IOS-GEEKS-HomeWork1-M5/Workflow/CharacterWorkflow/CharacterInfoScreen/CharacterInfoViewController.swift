//
//  CharacterInfoViewController.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 20/6/23.
//

import UIKit

class CharacterInfoViewController: CustomViewController<CharacterInfoView> {
    
    var character: Character?
    
    override func loadView() {
        super.loadView()
        view = IOS_GEEKS_HomeWork1_M5.CharacterInfoView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        updateInfo()
    }
    
    private func updateInfo() {
        guard let character else {
            return
        }
        customView.characterImage.kf.setImage(with: URL(string: character.image))
        customView.speciesLabel.text = character.species
        customView.nameLabel.text = character.name
        customView.genderLabel.text = character.gender
        customView.typeLabel.text = character.type
        customView.typeLabel.text = character.type
    }
}
