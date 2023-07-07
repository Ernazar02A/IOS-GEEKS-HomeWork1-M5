//
//  FirestoreManager.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 6/7/23.
//

import Foundation
import FirebaseFirestore

class FirestoreManager {
    enum Collections: String {
        case character
    }
    
    static let shared = FirestoreManager()
    private let db = Firestore.firestore()
    
    private init() { }
    
    func addData(
        with collection: Collections,
        data: [String: Any]
    ) {
        db.collection(collection.rawValue).addDocument(data: data) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added")
            }
            
        }
    }
    
    func readData(
        with collection: Collections,
        completion: @escaping (Result<[[String: Any]], Error>) -> Void
    ) {
        db.collection(collection.rawValue).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting document: \(err)")
                completion(.failure(err))
            } else {
                let data = querySnapshot!.documents.map { $0.data()}
                completion(.success(data))
            }
        }
    }
}
