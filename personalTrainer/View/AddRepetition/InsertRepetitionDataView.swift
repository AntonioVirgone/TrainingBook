//
//  InsertRepetitionDataView.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 24/04/23.
//

import SwiftUI

struct InsertRepetitionDataView: View {
    @Environment(\.dismiss) var dismiss

    @State var number: Double = 0
    @State var weigth: Double = 0
    
    var repetitionId = UUID()
    
    let isEditMode: Bool
    let title: String
    let isActiveAddWeight: Bool
    let exerciseCode: String

    var body: some View {
        VStack {
            VStack {
                if isEditMode {
                    Text(title)
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .padding()
                }
                Text("Ripetizioni: \(Int(number))")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                Slider(value: $number, in: 0...60, step: 1)
            }
            if (isActiveAddWeight) {
                VStack {
                    Text("Peso: \(Int(weigth))")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                    Slider(value: $weigth, in: 0...150, step: 1)
                }
            }
            Spacer()
                .frame(height: 30)
            HStack {
                Spacer()
                Button {
                    if isEditMode {
                        RepetitionDataController.editRepetition(number: number, weigth: weigth, repetitionId: repetitionId)
                        dismiss()
                    } else {
                        RepetitionDataController.addRepetition(number: number, weigth: weigth, trainingCode: exerciseCode)
                    }
                } label: {
                    Text("Save")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundColor(color5)
                        .frame(width: 130, height: 50)
                        .background(color1)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))                    
                }
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Text("Close")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundColor(color1)
                        .frame(width: 130, height: 50)
                        .background(color5)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
                    
                }
                Spacer()
            }
            .listRowSeparator(.hidden)
        }
        .navigationTitle(title)
        .font(.title2)
        .foregroundColor(.white)
        .padding()
        .background(bgAppColor)
    }
}

struct InsertRepetitionDataView_Previews: PreviewProvider {
    static var previews: some View {
        InsertRepetitionDataView(isEditMode: true, title: "title", isActiveAddWeight: true, exerciseCode: "code")
    }
}
