//
//  DataManager.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 10/7/23.
//

import Foundation
import CoreData

class DataManager {
    
    static let shared = DataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CharacterDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func character(character: Character) {
        let char = Characters(context: persistentContainer.viewContext)
        char.name = character.name
        char.gender = character.gender
        char.image = character.image
        char.species = character.species
        char.status = character.status
        char.type = character.type
        save()
    }
    
    func characters() -> [Characters] {
        let request: NSFetchRequest<Characters> = Characters.fetchRequest()
        var fetchedCharacters: [Characters] = []
        
        do {
            fetchedCharacters = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print(error.localizedDescription)
        }
        return fetchedCharacters
    }
    
    func save () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("❗️Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
