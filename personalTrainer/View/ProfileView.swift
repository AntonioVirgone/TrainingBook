//
//  ProfileView.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 13/04/23.
//

import SwiftUI
import CoreData

struct ProfileView: View {
    @State var bgAppColor = Color(#colorLiteral(red: 0.1098039216, green: 0.1176470588, blue: 0.1411764706, alpha: 1))
    @FetchRequest(sortDescriptors: []) var posts: FetchedResults<Scheda>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        ZStack {
            bgAppColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(spacing: 25) {
                    HStack(spacing: 15) {
                        Button {
                            TrainingDataController().savePost(context: moc, filename: "scheda_antonio_a.json")
                        } label: {
                            Text("Add Scheda A")
                        }
                        Button {
                            TrainingDataController().savePost(context: moc, filename: "scheda_antonio_b.json")
                        } label: {
                            Text("Add Scheda B")
                        }
                        Button {
                            TrainingDataController().savePost(context: moc, filename: "scheda_antonio_c.json")
                        } label: {
                            Text("Add Scheda C")
                        }
                    }
                    
                    Button {
                        print("read \(posts)")
                    } label: {
                        Text("Read posts")
                    }
                    
                    Button {
                        print("delete")
                        delete(context: moc, objects: posts)
                    } label: {
                        Text("Delete posts")
                    }
                }
                List {
                    ForEach(posts) { post in
                        VStack {
                            Text(post.title ?? "")
                            ForEach(Array(post.relationship! as! Set<Esercizio>), id: \.self) { comment in
                                VStack {
                                    Text(comment.code ?? "")
                                    Text(comment.value ?? "")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func delete(context: NSManagedObjectContext, objects: FetchedResults<Scheda>) {
        // Delete multiple objects
        for object in objects {
            context.delete(object)
        }
        
        // Save the deletions to the persistent store
        //save(context: context)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
