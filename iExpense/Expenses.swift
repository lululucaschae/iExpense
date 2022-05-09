//
//  Expenses.swift
//  iExpense
//
//  Created by Lucas Chae on 5/6/22.
//

import Foundation

// Whenever "items" array change (SingleExpense added or removed), we will renew instance of Expenses
class Expenses: ObservableObject {
    @Published var expensesArray = [SingleExpense]() {
        
        
        didSet {
            if let encoded = try? JSONEncoder().encode(expensesArray) {
                UserDefaults.standard.set(encoded, forKey: "ExpenseItem")
            }
        }
    }
        
        init() {
            if let savedItems = UserDefaults.standard.data(forKey: "ExpenseItem") {
                if let decodedItems = try? JSONDecoder().decode([SingleExpense].self, from: savedItems) {
                    expensesArray = decodedItems
                    return
                }
            }
            expensesArray = []
        }

    
    
    
}
