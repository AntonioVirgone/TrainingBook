//
//  TrainingDataController.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 25/04/23.
//

import Foundation
import CoreData
import NetworkPackage

class TrainingDataController: ObservableObject {
    let container = NSPersistentContainer(name: "TrainerDataModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func savePost(context: NSManagedObjectContext, filename: String) {
        let posts = getData(filename: filename)
        for scheda in posts {
            saveData(scheda: scheda, context: context)
        }
    }
    
    func saveData(scheda: PostModel, context: NSManagedObjectContext) {
        let post = Scheda(context: context)
        var comments = [Esercizio]()

        for esercizio in scheda.excercises {
            let esercizioEntity = Esercizio(context: context)
            esercizioEntity.code = esercizio.code
            esercizioEntity.ripetizioni = Int16(esercizio.ripetizioni ?? 0)
            esercizioEntity.riposo = Int16(esercizio.riposo ?? 0)
            esercizioEntity.serie = Int16(esercizio.serie ?? 0)
            esercizioEntity.value = esercizio.value
            esercizioEntity.addRepetion = esercizio.addRepetition
            esercizioEntity.addWeigth = esercizio.addWeigth
            comments.append(esercizioEntity)
        }
        post.id = UUID()
        post.title = scheda.title
        post.type = scheda.type
        post.relationship = NSSet.init(array: comments)
        
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("Error in save data")
        }
    }
    
    func getData(filename: String) -> [PostModel] {
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        return NetworkPackage().loadFromJson(file: file)
    }

}
