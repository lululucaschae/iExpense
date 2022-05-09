//
//  AddView.swift
//  iExpense
//
//  Created by Lucas Chae on 5/6/22.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
//    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = ""
    @State private var amount = 0.0
    
    
    @ObservedObject var isSheetShowing: SheetController
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) { type in
                        Text("\(type)")
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let newExpense = SingleExpense(name: name, type: type, amount: amount)
                    expenses.expensesArray.append(newExpense)
                    isSheetShowing.isSheetShowing = false
                    // dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses(), isSheetShowing: SheetController())
    }
}
