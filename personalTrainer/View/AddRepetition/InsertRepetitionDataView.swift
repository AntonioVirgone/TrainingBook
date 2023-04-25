//
//  InsertRepetitionDataView.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 24/04/23.
//

import SwiftUI

struct InsertRepetitionDataView: View {
    @Environment(\.managedObjectContext) var manageObjectContext
    @Environment(\.dismiss) var dismiss

    @State var number: Double = 0
    @State var weigth: Double = 0
    
    private let bgAppColor = Color(#colorLiteral(red: 0.1098039216, green: 0.1176470588, blue: 0.1411764706, alpha: 1))
    private let color1 = #colorLiteral(red: 1, green: 0.4901960784, blue: 0.1215686275, alpha: 1)
    private let color2 = #colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1843137255, alpha: 1)

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
                        DataController().editRepetition(number: number, weigth: weigth, repetitionId: repetitionId, context: manageObjectContext)
                        dismiss()
                    } else {
                        DataController().addRepetition(number: number, weigth: weigth, trainingCode: exerciseCode, context: manageObjectContext)
                    }
                } label: {
                    Text("Save")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundColor(Color(color2))
                        .frame(width: 130, height: 50)
                        .background(Color(color1))
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
                    
                }
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Text("Close")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundColor(Color(color1))
                        .frame(width: 130, height: 50)
                        .background(Color(color2))
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
