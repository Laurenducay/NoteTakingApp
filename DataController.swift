//
//  DataController.swift
//  NoteTakingApp
//
//  Created by Lauren Ducay on 4/18/25.
//
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "NoteTakingAppDataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
