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
        
        view.dataSource = self
        view.delegate = self
        view.register(
            CharacterCollectionViewCell.self,
            forCellWithReuseIdentifier: CharacterCollectionViewCell.reuseID
        )
        view.backgroundColor = .black
        return view
    }()

    private let rickAndMortyViewModel = RickAndMortyViewModel()
    private var characters: [Character] = []
    
    let refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        view.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesBackButton = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        fetchCharacters()
        
        collectionView.refreshControl = refreshControl
    }

    @objc func refresh(_ sender: UIRefreshControl) {
        refreshControl.endRefreshing()
        fetchCharacters()
    }
    
    private func setup() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    private func fetchCharacters() {
        Task {
            do {
                characters = try await rickAndMortyViewModel.fetchCharacters()
                fetchCharactersFirestore()
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchCharactersFirestore() {
        FirestoreManager.shared.readData(with: .character) { result in
            switch result {
            case .success(let model):
                let characters = RickAndMortyUtility.mapData(data: model)
                self.characters.append(contentsOf: characters)
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

//MARK: - UICollectionViewDataSource

extension RickAndMortyViewController: UICollectionViewDataSource {
    
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
}

//MARK: - UICollectionViewDelegate

extension RickAndMortyViewController: UICollectionViewDelegate {
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let vc = CharacterInfoViewController()
        vc.character = characters[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
}
