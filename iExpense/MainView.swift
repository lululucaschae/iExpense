//
//  MainView.swift
//  iExpense
//
//  Created by Lucas Chae on 5/6/22.
//

import SwiftUI


struct MainView: View {
    
    // Create an instance of myExpenses, basiclaly an array of expenses
    @StateObject var myExpenses = Expenses()
    
//    @State private var isAddViewShowing = false
    
    @StateObject var sheetState = SheetController()
    
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(myExpenses.expensesArray) {expense in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(expense.name)
                                .font(.headline)
                            Text(expense.type)
                        }
                        Spacer()
                        
                        Text(expense.amount, format:.currency(code: "USD"))
                        
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    sheetState.isSheetShowing = true
                    // isAddViewShowing = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $sheetState.isSheetShowing) {
                AddView(expenses: myExpenses, isSheetShowing: sheetState)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        myExpenses.expensesArray.remove(atOffsets: offsets)
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
