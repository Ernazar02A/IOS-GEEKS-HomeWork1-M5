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

    private let rickAndMortyViewModel = RickAndMortyViewModel()
    private var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchCharacters()
        
        //keychainSave(service: "E", account: "Era", password: "2")
        //keychainGetPassword(service: "E", account: "Era")
        //keychainUpdatePassword(service: "E", account: "Era", password: "3")
        //keychainRemove(service: "E", account: "Era")
    }
    
    
    func userDefaultSaveAndGet() {
        print(UserDefaultStorage.shared.retrieveString(type: .string, key: .temporarykey)!)
        UserDefaultStorage.shared.save(data: "White", key: .temporarykey)
        print(UserDefaultStorage.shared.retrieveString(type: .string, key: .temporarykey)!)
        UserDefaultStorage.shared.save(data: "Black", key: .temporarykey)
    }
    
    
    func keychainSave(
        service: String,
        account: String,
        password: String
    ) {
        do {
            try KeychainStorage.shared.save(service: service,
                                     account: account,
                                     password: password.data(using: .utf8) ?? Data()
            )
        } catch {
            print(error)
        }
    }
    
    func keychainUpdatePassword(
        service: String,
        account: String,
        password: String
    ) {
        do {
            try KeychainStorage.shared.update(service: service,
                                     account: account,
                                     password: password.data(using: .utf8) ?? Data()
            )
        } catch {
            print(error)
        }
    }
    
    func keychainGetPassword(service: String, account: String) {
        guard let data = KeychainStorage.shared.get(
            service: service,
            account: account
        ) else {
            print("Не удалось получить пароль")
            return
        }
        let password = String(decoding: data, as: UTF8.self)
        print(password)
    }
    
    func keychainRemove(service: String, account: String) {
        do {
            try KeychainStorage.shared.delete(
                service: service,
                account: account
            )
        } catch {
            print(error)
        }
    }
    
    private func setup() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    private func fetchCharacters() {
        Task {
            do {
                characters = try await rickAndMortyViewModel.fetchCharacters()
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
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
