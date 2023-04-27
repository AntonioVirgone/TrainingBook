//
//  AddRepetitionView.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 24/04/23.
//

import SwiftUI
import CoreData

struct AddRepetitionView: View {
    @Environment(\.managedObjectContext) var manageObjectContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var repetitions: FetchedResults<Repetition>
    
    @State private var number:Double = 0
    @State private var weigth: Double = 0
    @State private var bgAppColor = Color(#colorLiteral(red: 0.1098039216, green: 0.1176470588, blue: 0.1411764706, alpha: 1))
    
    let colorBar: Color
    let title: String
    let isActiveAddWeight: Bool
    let exerciseCode: String
    let relaxCounter: Int
    
    var body: some View {
        ZStack {
            bgAppColor.edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .frame(height: 0)
                    .background(colorBar.opacity(0.4))
                InsertRepetitionDataView(isEditMode:false, title: title, isActiveAddWeight: isActiveAddWeight, exerciseCode: exerciseCode)
                Spacer()
                    .frame(height: 40)
                RelaxButtonView(counter: relaxCounter)
                Spacer()
                    .frame(height: 40)
                reportList
                Spacer()
                    .frame(height: 40)
                repetitionList
            }
        }
    }
    
    private func deleteRepetition(offsets: IndexSet) {
        _ = withAnimation {
            offsets.map {
                RepetitionDataController().deleteRepetition(repetitionId: repetitions[$0].id!, context: manageObjectContext)
            }
        }
    }
    
    private func countRepetition() -> Int {
        var count = 0
        for repetition in repetitions {
            if exerciseCode == repetition.trainingCode {
                count += 1
            }
        }
        return count
    }
    
    private func calculateMiddleweight() -> Int {
        var middle = 0
        if repetitions.count > 0 {
            for repetition in repetitions {
                if exerciseCode == repetition.trainingCode {
                    middle += Int(repetition.weigth)
                }
            }
            return middle / repetitions.count
        }
        return middle
    }
    
    private func calculateMiddlerepetition() -> Int {
        var middle = 0
        if repetitions.count > 0 {
            for repetition in repetitions {
                if exerciseCode == repetition.trainingCode {
                    middle += Int(repetition.number)
                }
            }
            return middle / repetitions.count
        }
        return middle
    }
    
    private func calculateMiddleexecution() -> Int {
        var middle = 0
        for repetition in repetitions {
            if exerciseCode == repetition.trainingCode {
                middle += 1
            }
        }
        return middle
    }
}

struct AddRepetitionView_Previews: PreviewProvider {
    static var previews: some View {
        AddRepetitionView(colorBar: .red, title: "title", isActiveAddWeight: true, exerciseCode: "code", relaxCounter: 10)
    }
}

extension AddRepetitionView {
    private var reportList: some View {
        VStack {
            Text("Valori medi per \(title)")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(.white)
            HStack {
                ReportCardView(count: calculateMiddleweight(),
                               title: "Peso",
                               textColor: Color.white)
                ReportCardView(count: calculateMiddlerepetition(),
                               title: "Ripetizioni",
                               textColor: Color.white)
                ReportCardView(count: calculateMiddleexecution(),
                               title: "Volte",
                               textColor: Color.white)
            }
        }
    }
    
    private var repetitionList: some View {
        VStack(alignment: .leading) {
            if (countRepetition() > 0) {
                Text("Posts \(countRepetition())")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                List {
                    ForEach(repetitions, id: \.self) { repetition in
                        if exerciseCode == repetition.trainingCode {
                            NavigationLink(destination: EditRepetitionView(title: title, isActiveAddWeight: isActiveAddWeight, repetitionId: repetition.id!, number: Double(repetition.number), weigth: Double(repetition.weigth), colorBar: colorBar)) {
                                PostCardView(profileName: "\(Int(repetition.number)) ripetioni",
                                             datetime: "\(repetition.date!.formatted())",
                                             description: "\(Int(repetition.weigth)) kg")
                                
                            }
                            .listRowSeparator(.hidden)
                            .listRowBackground(bgAppColor)
                        }
                    }
                    .onDelete(perform: deleteRepetition)
                }
                .ignoresSafeArea()
                .scrollContentBackground(.hidden) // HERE
                .background(bgAppColor)
            }
            else {
                Spacer()
            }
        }
    }
}
