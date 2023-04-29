//
//  DataController.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 14/04/23.
//

import Foundation
import CoreData

class RepetitionDataController: ObservableObject {
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

    // REPETITION
    static func addRepetition(number: Double, weigth: Double, trainingCode: String) {
        let repetition = Repetition(context: context)
        repetition.id = UUID()
        repetition.date = Date()
        repetition.number = number
        repetition.weigth = weigth
        repetition.trainingCode = trainingCode
        
        save()
    }
    
    static func find() -> [Repetition] {
        let fetchRequest: NSFetchRequest<Repetition>
        fetchRequest = Repetition.fetchRequest()
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    static func editRepetition(number: Double, weigth: Double, repetitionId: UUID) {
        let fetchRequest: NSFetchRequest<Repetition>
        fetchRequest = Repetition.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(
            format: "id = '\(repetitionId)'"
        )

        do {
            let repetition = try context.fetch(fetchRequest).first
            
            repetition!.number = number
            repetition!.weigth = weigth
            
            save()
        } catch {
            print(error)
        }
    }
    
    static func deleteRepetition(repetitionId: UUID) {
        let fetchRequest = Repetition.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(
            format: "id = '\(repetitionId)'"
        )

        do {
            let repetition = try context.fetch(fetchRequest).first
            context.delete(repetition!)
            
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
