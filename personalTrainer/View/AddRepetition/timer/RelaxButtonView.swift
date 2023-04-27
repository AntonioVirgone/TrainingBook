//
//  RiposoView.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 26/04/23.
//

import SwiftUI

struct RelaxButtonView: View {
    @State var drawingWidth = false
    
    let counter: Int
    private let color1 = #colorLiteral(red: 1, green: 0.4901960784, blue: 0.1215686275, alpha: 1)
    private let color2 = #colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1843137255, alpha: 1)

    var body: some View {
        VStack(spacing: 0) {
            Button {
                drawingWidth.toggle()
            } label: {
                Text(!drawingWidth ? "Attiva riposo" : "Disattiva riposo")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(Color(color2))
                    .frame(width: 300, height: 25)
                    .background(Color(color1))
                    .cornerRadius(7)
                    .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
            }
            if drawingWidth {
                CounterView(counter: counter)
                    .frame(height: 40)
            }
        }
    }
}

struct RelaxButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RelaxButtonView(counter: 10)
    }
}
