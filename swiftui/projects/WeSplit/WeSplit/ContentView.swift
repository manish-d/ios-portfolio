//
//  ContentView.swift
//  WeSplit
//
//  Created by Manish on 05/06/20.
//  Copyright © 2020 manish. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 30, 0]
    
    var totalAndPerPerson: (Double, Double) {
        let peopleCount = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(amount) ?? 0
        
        let tipValue = orderAmount/100 * tipSelection
        let grandTotal = tipValue + orderAmount
        let totalPerPerson = grandTotal / peopleCount
        
        return (totalPerPerson, grandTotal)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter Bill Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    
//                    Picker("Number of people", selection: $numberOfPeople) {
//                        ForEach(2 ..< 100) {
//                            Text("\($0) people")
//                        }
//                    }
                    
                    TextField("Number of people", text: $numberOfPeople)
                }
                
                Section(header: Text("Tip Percentage")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Grand Total")) {
                    Text("\(totalAndPerPerson.1, specifier: "%.2f")")
                }
                
                Section(header: Text("Total per person")) {
                    Text("\(totalAndPerPerson.0, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
