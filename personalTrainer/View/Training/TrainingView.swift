//
//  TrainingView.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 13/04/23.
//

import SwiftUI
import NetworkPackage

struct TrainingView: View {
    @State var posts = TrainingDataController.find()
    
    let title: String
    let type: String
    let color: Color
    
    var body: some View {
        ZStack {
            bgAppColor.edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(color.opacity(0.4))
                List {
                    ForEach(posts) { post in
                        if (post.type == type) {
                            Section(header: Text(post.title ?? "").foregroundColor(.white)) {
                                ForEach(post.excercises, id: \.self) { comment in
                                    TrainingRowView(title: comment.value ?? "",
                                                    exerciseCode: comment.code ?? "",
                                                    isActiveAddRepetition: comment.addRepetion,
                                                    isActiveAddWeight: comment.addWeigth,
                                                    bgAppColor: bgAppColor,
                                                    color: color,
                                                    relaxCounter: Int(comment.riposo))
                                }
                            }
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                        }
                    }
                }
                .scrollContentBackground(.hidden) // HERE
                .background(bgAppColor)
            }
            .navigationTitle(title)
            .font(.title2)
        }
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView(title: "Scheda", type: "A", color: Color(.gray))
    }
}
