//
//  PostCardView.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 24/04/23.
//

import SwiftUI

struct PostCardView: View {
    let profileName: String
    let datetime: String
    let description: String
    
    let bgColor = Color(#colorLiteral(red: 0.1607843137, green: 0.1607843137, blue: 0.1843137255, alpha: 1))

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 3) {
                    Text(profileName)
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    Text(datetime)
                        .font(.system(size: 10, weight: .bold, design: .rounded))
                        .foregroundColor(.gray)
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                Text(description)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 0))
            }
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
            Spacer()
        }
        .background(bgColor)
        .cornerRadius(15)
    }
}

struct PostCardView_Previews: PreviewProvider {
    static var previews: some View {
        PostCardView(profileName: "Antonio", datetime: "4/24/2023, 6:41 PM", description: "54 kg")
    }
}
