//
//  ContentView.swift
//  WeSplit
//
//  Created by Mati on 30/10/2019.
//  Copyright © 2019 devmini. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    var numberOfPeople2 = 2.0
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var peopleCount: Double {
        Double(numberOfPeople + 2)
    }

    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let amountPerPerson = totalAmount / peopleCount
        return amountPerPerson
    }
    
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: ($numberOfPeople)){
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section (header:Text("How much tip do you want to leave?")){
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section (header:Text("Total amount for the check")){
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
                
                Section (header:Text("Amount per person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
            }.navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
