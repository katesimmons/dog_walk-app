//
//  CoreDataStack.swift
//  Dog_Walk
//
//  Created by durul dalkanat on 2/17/16.
//  Copyright © 2016 durul dalkanat. All rights reserved.
//

import CoreData

class CoreDataStack {
    
    //1- Creare a property object model
    let modelName = "Dog Walk"
    
    //2- Second property
    //We are storing the SQlite database in the document directory.
    private lazy var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(
        .DocumentDirectory, inDomains: .UserDomainMask)
        
        return urls[urls.count-1]
    }()
    
    
    //1- NSManagedObjectContext initializer a concurency type enumeration. we initialize this managed context using for MainQueueConcurrency.
    lazy var context: NSManagedObjectContext = {
            
            var managedObjectContext = NSManagedObjectContext(
        concurrencyType: .MainQueueConcurrencyType)
            
            managedObjectContext.persistentStoreCoordinator = self.psc
            return managedObjectContext
    }()
    
    //2- we are creating a managed model.
    private lazy var psc: NSPersistentStoreCoordinator = {
                
                let coordinator = NSPersistentStoreCoordinator(
        managedObjectModel: self.managedObjectModel)
                
                let url = self.applicationDocumentsDirectory
                    .URLByAppendingPathComponent(self.modelName)
                
                do {
                    let options =
                    [NSMigratePersistentStoresAutomaticallyOption : true]
                    
                    // we attach a persisteny store to the store coordinator
                    try coordinator.addPersistentStoreWithType(
                        NSSQLiteStoreType, configuration: nil, URL: url,
                        options: options)
                } catch  {
                        print("Error adding persistent store.")
                }
                
                return coordinator
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
                    
                    let modelURL = NSBundle.mainBundle()
        .URLForResource(self.modelName,
        withExtension: "momd")!
                    return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                    NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                    abort()
            }
        }
    }

}
