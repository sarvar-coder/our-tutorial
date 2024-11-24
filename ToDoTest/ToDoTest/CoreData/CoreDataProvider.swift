//
//  CoreDataProvider.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import Foundation
import CoreData

class CoreDataProvider {
    
    static let shared = CoreDataProvider()
    
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    static var preview: CoreDataProvider = {
        
        let manager = CoreDataProvider(inMemory: true)
        let context = manager.viewContext
        
        let todo = TodoItems(context: context)
        todo.todo = "Do the lesson"
        todo.completed = true
        
        
        let todo1 = TodoItems(context: context)
        todo1.todo = "Learn russian"
        todo1.completed = false
        
        do {
           try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        return manager
    }()
    
    init(inMemory: Bool = false) {
        persistentContainer = NSPersistentContainer(name: "TodoModel")
        
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
