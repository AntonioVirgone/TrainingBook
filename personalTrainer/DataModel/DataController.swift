//
//  DataController.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 14/04/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
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
    
    func editRepetition(repetition: Repetition, number: Double, weigth: Double, trainingCode: String, context: NSManagedObjectContext) {
        repetition.date = Date()
        repetition.number = number
        repetition.weigth = weigth
        repetition.trainingCode = trainingCode

        save(context: context)
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
    /*
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("Error in save data")
        }
    }
    
    
    
    // USER
    func addUser(username: String, password: String, avatar: String, admin: Bool, context: NSManagedObjectContext) {
        let user = User(context: context)
        user.id = UUID()
        user.username = username
        user.password = password
        user.avatar = avatar
        user.admin = admin
        
        save(context: context)
    }
    
    func editUser(user: User, username: String, password: String, avatar: String, admin: Bool, context: NSManagedObjectContext) {
        user.username = username
        user.password = password
        user.avatar = avatar
        user.admin = admin

        save(context: context)
    }
}

*/
