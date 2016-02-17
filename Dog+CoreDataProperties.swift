//
//  Dog+CoreDataProperties.swift
//  Dog_Walk
//
//  Created by durul dalkanat on 2/17/16.
//  Copyright © 2016 durul dalkanat. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Dog {

    @NSManaged var name: String?
    @NSManaged var walks: NSOrderedSet?

}
