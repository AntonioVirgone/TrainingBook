//
//  FeatureView.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 26/04/23.
//

import SwiftUI

struct FoodDiaryFeatureView: View {
    let bgAppColor = Color(#colorLiteral(red: 0.1098039216, green: 0.1176470588, blue: 0.1411764706, alpha: 1))
    private let color1 = Color(#colorLiteral(red: 1, green: 0.4901960784, blue: 0.1215686275, alpha: 1))
    private let color5 = Color(#colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1843137255, alpha: 1))
    
    let color2 = Color(#colorLiteral(red: 1, green: 0.5764705882, blue: 0.2745098039, alpha: 1))
    let color3 = Color(#colorLiteral(red: 0.7490196078, green: 0.9176470588, blue: 0.7254901961, alpha: 1))
    let color4 = Color(#colorLiteral(red: 0.6784313725, green: 0.9450980392, blue: 0.9843137255, alpha: 1))
    
    let array = ["hello", "world"]
    
    var body: some View {
        ZStack {
            bgAppColor.edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(Color.orange.opacity(0.4))
                Spacer()
                VStack(spacing: 15) {
                    NavigationLink(destination: MealSelectorView()) {
                        Text("Aggiungi pasto")
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .foregroundColor(.white.opacity(0.4))
                            .frame(width: 300, height: 50)
                            .background(color2.opacity(0.6))
                            .cornerRadius(10)
                            .padding(EdgeInsets(top: 30, leading: 2, bottom: 0, trailing: 2))
                    }
                }
                Spacer()
                List {
                    ForEach(array, id: \.self) { element in
                        VStack(alignment: .leading) {
                            Text("title \(element)")
                            Text("description \(element)")
                        }
                        .foregroundColor(.white.opacity(0.8))
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                        .listRowSeparatorTint(.white)
                        .listRowBackground(color5)
                    }
                }
                .scrollContentBackground(.hidden) // HERE
                .background(bgAppColor)
            }
            .navigationTitle("Diario cibo")
            .font(.title2)
        }
    }
}

struct FoodDiaryFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDiaryFeatureView()
            .preferredColorScheme(.light)
    }
}
