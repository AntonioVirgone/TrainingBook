//
//  DataController.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 14/04/23.
//

import Foundation
import CoreData

class RepetitionDataController: ObservableObject {
    let container = NSPersistentContainer(name: "TrainerDataModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }

    // REPETITION
    func addRepetition(number: Double, weigth: Double, trainingCode: String, context: NSManagedObjectContext) {
        let repetition = Repetition(context: context)
        repetition.id = UUID()
        repetition.date = Date()
        repetition.number = number
        repetition.weigth = weigth
        repetition.trainingCode = trainingCode
        
        save(context: context)
    }
    
    func find(context: NSManagedObjectContext) -> [Repetition] {
        let fetchRequest: NSFetchRequest<Repetition>
        fetchRequest = Repetition.fetchRequest()
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func editRepetition(number: Double, weigth: Double, repetitionId: UUID, context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Repetition>
        fetchRequest = Repetition.fetchRequest()
        
        print(repetitionId)

        fetchRequest.predicate = NSPredicate(
            format: "id = '\(repetitionId)'"
        )

        do {
            let repetition = try context.fetch(fetchRequest).first
            
            repetition!.number = number
            repetition!.weigth = weigth
            
            save(context: context)
        } catch {
            print(error)
        }
    }
    
    func deleteRepetition(repetitionId: UUID, context: NSManagedObjectContext) {
        let fetchRequest = Repetition.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(
            format: "id = '\(repetitionId)'"
        )

        do {
            let repetition = try context.fetch(fetchRequest).first
            context.delete(repetition!)
            
            save(context: context)
        } catch {
            print(error)
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("Error in save data")
        }
    }
}
