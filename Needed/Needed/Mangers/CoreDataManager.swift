//
//  CoreDataManager.swift
//  Needed
//
//  Created by Sarvar Boltaboyev on 14/11/24.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    // fake data for preview
    static var preview: CoreDataManager = {
        
        let manager = CoreDataManager(inMemory: true)
        let viewContext = manager.viewContext
        
        let item = TaskItem(context: viewContext)
        item.title = "Core Data"
        item.checked = true
        
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
        return manager
    }()
    
    init(inMemory: Bool = false) {
        persistentContainer = NSPersistentContainer(name: "TaskModel")
        
        if inMemory {
            persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                print(error.localizedDescription)
            }
        }
    }
}
