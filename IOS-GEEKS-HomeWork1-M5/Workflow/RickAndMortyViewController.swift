//
//  ViewController.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 17/6/23.
//

import UIKit
import SnapKit

class RickAndMortyViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: view.frame.width / 2.5, height: 150)
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        view.delegate = self
        view.dataSource = self
        view.register(
            CharacterCollectionViewCell.self,
            forCellWithReuseIdentifier: CharacterCollectionViewCell.reuseID
        )
        view.backgroundColor = .black
        return view
    }()

    private let networkService = NetworkService()
    private var characters: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchCharacters()
    }
    private func setup() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    private func fetchCharacters() {
        networkService.fetchCharacters { [weak self] result in
            guard let self else {
                return
            }
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.characters = model
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}

//MARK: - UICollectionViewDataSource && UICollectionViewDelegate

extension RickAndMortyViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return characters.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacterCollectionViewCell.reuseID,
            for: indexPath
        ) as! CharacterCollectionViewCell
        let model = characters[indexPath.item]
        cell.display(item: model)
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath)
    {
        let vc = CharacterInfoViewController()
        vc.character = characters[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
}
