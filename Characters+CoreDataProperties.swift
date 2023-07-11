//
//  Characters+CoreDataProperties.swift
//  
//
//  Created by Ernazar on 10/7/23.
//
//

import Foundation
import CoreData


extension Characters {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Characters> {
        return NSFetchRequest<Characters>(entityName: "Characters")
    }

    @NSManaged public var image: String?
    @NSManaged public var gender: String?
    @NSManaged public var type: String?
    @NSManaged public var species: String?
    @NSManaged public var status: String?
    @NSManaged public var name: String?

}
