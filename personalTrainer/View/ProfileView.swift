//
//  ProfileView.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 13/04/23.
//

import SwiftUI
import CoreData

struct ProfileView: View {

    @State var posts = TrainingDataController.find()

    var body: some View {
        ZStack {
            bgAppColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(spacing: 25) {
                    HStack(spacing: 15) {
                        Button {
                            save(filename: "scheda_antonio_a.json")
                        } label: {
                            Text("Add Scheda A")
                        }
                        Button {
                            save(filename: "scheda_antonio_b.json")
                        } label: {
                            Text("Add Scheda B")
                        }
                        Button {
                            save(filename: "scheda_antonio_c.json")
                        } label: {
                            Text("Add Scheda C")
                        }
                    }
                    
                    Button {
                        delete()
                    } label: {
                        Text("Delete posts")
                    }
                }
                List {
                    ForEach(posts, id: \.self) { post in
                        VStack {
                            Text(post.title)
                            ForEach(post.excercises, id: \.self) { comment in
                                VStack {
                                    Text(comment.code ?? "")
                                    Text(comment.value)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func save(filename: String) {
        TrainingDataController.savePost(filename: filename)
        posts = TrainingDataController.find()
    }
    
    private func delete() {
        TrainingDataController.delete()
        posts = TrainingDataController.find()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
