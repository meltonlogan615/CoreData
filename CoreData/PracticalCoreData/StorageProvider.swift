//
//  StorageProvider.swift
//  CoreData
//
//  Created by Logan Melton on 1/16/22.
//

import Foundation
import CoreData

class StorageProvider {
  let persistentContainer: NSPersistentContainer
  
  init() {
    
    // gets passed the Core Data Model file as an argument during initialization, any typos will result in fatal error
    persistentContainer = NSPersistentContainer(name: "CoreDataModel")
    
    // PersistentStores represents CoreData's underlying storage
    persistentContainer.loadPersistentStores(completionHandler: {
      description, error in
      if let error = error {
        fatalError("Core Data store failed to load with error: \(error)")
      }
    })
  }
}
