//
//  EditRepetitionView.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 25/04/23.
//

import SwiftUI

struct EditRepetitionView: View {
    let bgAppColor = Color(#colorLiteral(red: 0.1098039216, green: 0.1176470588, blue: 0.1411764706, alpha: 1))
    let title: String
    let isActiveAddWeight: Bool
    let repetitionId: UUID
    let number: Double
    let weigth: Double
    let colorBar: Color
    
    var body: some View {
        ZStack {
            bgAppColor.edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(colorBar.opacity(0.4))
                Spacer()
                InsertRepetitionDataView(number: number, weigth: weigth, repetitionId: repetitionId, isEditMode: true, title: title, isActiveAddWeight: isActiveAddWeight, exerciseCode: "")
                Spacer()
            }
        }
    }
}

struct EditRepetitionView_Previews: PreviewProvider {
    static var previews: some View {
        EditRepetitionView(title: "title", isActiveAddWeight: true, repetitionId: UUID(), number: 10, weigth: 100, colorBar: .orange)
    }
}
