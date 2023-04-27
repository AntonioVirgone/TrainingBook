//
//  CounterView.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 26/04/23.
//

import SwiftUI

struct CounterView: View {
    @State var counter: Int
    @State private var isActiveDrarw = false
        
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let bgCounterBarColor = Color(#colorLiteral(red: 1, green: 0.4901960784, blue: 0.1215686275, alpha: 1))
    let bgAppColor = Color(#colorLiteral(red: 0.1098039216, green: 0.1176470588, blue: 0.1411764706, alpha: 1))
    
    var body: some View {
        ZStack {
            bgAppColor.edgesIgnoringSafeArea(.all)
            VStack {
                Text("\(counter) sec")
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .onReceive(timer) { _ in
                        let initCounter = counter
                        
                        if counter > 0 {
                            counter -= 1
                        } else {
                            counter = initCounter
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(bgCounterBarColor.gradient)
                }
                .frame(width: isActiveDrarw ? 300 : 2, height: isActiveDrarw ? 2 : 20, alignment: .leading)
                .animation(.easeInOut(duration: Double(counter)), value: isActiveDrarw)
                .onAppear {
                    isActiveDrarw.toggle()
                }
            }
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(counter: 30)
    }
}
