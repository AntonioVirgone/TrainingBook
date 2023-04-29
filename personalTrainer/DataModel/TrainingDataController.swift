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
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TrainerDataModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("error \(error)")
            }
        }
        return container
    }()

    static func savePost(filename: String) {
        let posts = getData(filename: filename)
        for scheda in posts {
            saveData(scheda: scheda)
        }
    }
    
    static func saveData(scheda: PostModel) {
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
    
    static func getData(filename: String) -> [PostModel] {
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        return NetworkPackage().loadFromJson(file: file)
    }
    
    static func delete() {
        do {
            let fetchRequest = Scheda.fetchRequest()
            let colors = try context.fetch(fetchRequest)
            
            // Delete multiple objects
            for object in colors {
                context.delete(object)
            }
        } catch {
            print(error)
        }
    }
    
    static func find() -> [PostModel] {
        let fetchRequest = Scheda.fetchRequest()
        do {
            var array = [PostModel]()
            let schede = try context.fetch(fetchRequest)
            
            for scheda in schede {
                var arrayComment = [CommentModel]()
                for esercizio in scheda.relationship?.allObjects as [Esercizio] {
                    arrayComment.append(CommentModel(code: esercizio.code ?? "",
                                                     value: esercizio.value ?? "",
                                                     serie: Int(esercizio.serie),
                                                     ripetizioni: Int(esercizio.ripetizioni),
                                                     riposo: Int(esercizio.riposo),
                                                     addRepetition: esercizio.addRepetion,
                                                     addWeigth: esercizio.addWeigth))
                }
                array.append(PostModel(title: scheda.title ?? "", type: scheda.type ?? "", excercises: arrayComment))
            }
            
            return array
        } catch {
            print(error)
            return []
        }
    }
}
