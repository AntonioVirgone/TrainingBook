//
//  TrainingRowView.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 25/04/23.
//

import SwiftUI

struct TrainingRowView: View {
    let title: String
    let exerciseCode: String
    let isActiveAddRepetition: Bool
    let isActiveAddWeight: Bool
    let bgAppColor: Color
    let color: Color
    let relaxCounter: Int
    
    let exercize: CommentModel

    var body: some View {
        if (isActiveAddRepetition) {
            navigationRow
        } else {
            standardRow
        }
    }
}

struct TrainingRowView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingRowView(title: "title",
                        exerciseCode: "code",
                        isActiveAddRepetition: true,
                        isActiveAddWeight: true,
                        bgAppColor: Color.red,
                        color: Color.orange,
                        relaxCounter: 10,
                        exercize: CommentModel(code: "",
                                               value: "",
                                               serie: 10,
                                               ripetizioni: 10,
                                               riposo: 10,
                                               addRepetition: true,
                                               addWeigth: true))
    }
}

extension TrainingRowView {
    private var navigationRow: some View {
        NavigationLink(destination: AddRepetitionView(colorBar: color, title: title, isActiveAddWeight: isActiveAddWeight, exerciseCode: exerciseCode, relaxCounter: relaxCounter)) {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.black)
                .font(.system(size: 14))
                .fontWeight(.bold)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(bgAppColor, lineWidth: 0.2)
                )
        }
        .listRowSeparator(.hidden)
        .listRowBackground(color)
    }
    
    private var standardRow: some View {
        Text(title)
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.black)
            .font(.system(size: 14))
            .fontWeight(.bold)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(bgAppColor, lineWidth: 0.2)
            )
            .listRowSeparator(.hidden)
            .listRowBackground(color)
    }
}
