//
//  ContentView.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 13/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var balance = "10h"
    
    let bgTitleCardColor = #colorLiteral(red: 1, green: 0.4901960784, blue: 0.1215686275, alpha: 1)
    let bgCardColor = #colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1843137255, alpha: 1)
    let color2 = #colorLiteral(red: 1, green: 0.5764705882, blue: 0.2745098039, alpha: 1)
    let color3 = #colorLiteral(red: 0.7490196078, green: 0.9176470588, blue: 0.7254901961, alpha: 1)
    let color4 = #colorLiteral(red: 0.6784313725, green: 0.9450980392, blue: 0.9843137255, alpha: 1)
    let bgAppColor = Color(#colorLiteral(red: 0.1098039216, green: 0.1176470588, blue: 0.1411764706, alpha: 1))
    
    var body: some View {
        NavigationView {
            ZStack {
                bgAppColor.edgesIgnoringSafeArea(.all)
                VStack {
                    header
                    Spacer().frame(height: 20)
                    trainingCards
                    Spacer().frame(height: 40)
                    featureCards
                    Spacer()
                }
            }
        }
        .accentColor(bgAppColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private var header: some View {
        VStack(alignment: .leading) {
            Text("Hello, Antonio")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.white)
            NavigationLink(destination: ProfileView().toolbarRole(.editor)) {
                HStack {
                    HStack(spacing: 10) {
                        Image("avatar")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .padding(10)
                        VStack(alignment: .leading, spacing: 7) {
                            Text("your balance".uppercased())
                                .font(.system(size: 12, weight: .light, design: .rounded))
                                .foregroundColor(Color(bgTitleCardColor))
                            Text(balance)
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                }
                .padding(10)
                .frame(minWidth: 350, alignment: .leading)
                .background(Color(bgCardColor))
                .cornerRadius(15)
            }
        }
        .padding()
    }
    
    private var trainingCards: some View {
        VStack(alignment: .leading) {
            Text("Achievements")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            HStack {
                TrainingCardView(title: "Scheda A", type: "A", count: "figure.stairs", color: Color(color2))
                TrainingCardView(title: "Scheda B", type: "B", count: "figure.play", color: Color(color3))
                TrainingCardView(title: "Scheda C", type: "C", count: "figure.strengthtraining.traditional", color: Color(color4))
            }
        }
        .frame(minWidth: 350, alignment: .leading)
        .padding(10)
    }
    
    private var featureCards: some View {
        VStack(alignment: .leading) {
            Text("Advanced features")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.white)
            VStack {
                HStack {
                    NavigationLink(destination: FoodDiaryFeatureView().toolbarRole(.editor)) {          FeatureCardView(title: "Diario cibo", count: "frying.pan", description: "", color: Color(bgCardColor))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 8))
                    }
                       
                    
                    FeatureCardView(title: "Diario bici", count: "figure.outdoor.cycle", description: "", color: Color(bgCardColor))
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 5, trailing: 0))
                }
                HStack {
                    FeatureCardView(title: "Diario gioco", count: "playstation.logo", description: "", color: Color(bgCardColor))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 8))
                    FeatureCardView(title: "Diario salute", count: "cross.case", description: "", color: Color(bgCardColor))
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 5, trailing: 0))
                }
            }
        }
    }
}
