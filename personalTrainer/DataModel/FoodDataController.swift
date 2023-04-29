//
//  FoodDataController.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 27/04/23.
//

import Foundation
import CoreData

class FoodDataController: ObservableObject {
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TrainerDataModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print(error)
            }
        }
        return container
    }()
    
    static func saveFood(name: String, weigth: String) {
        print("save food")
        let food = Food(context: context)
        food.id = UUID()
        food.name = name
        food.weight = weigth
        food.insertDatetime = Date()
        
        save()
    }
    
    static func deleteRepetition(repetitionId: UUID) {
        let fetchRequest = Food.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(
            format: "id = '\(repetitionId)'"
        )

        do {
            let food = try context.fetch(fetchRequest).first
            context.delete(food!)
            
            save()
        } catch {
            print(error)
        }
    }
    
    static func save() {
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("Error in save data")
        }
    }
}
