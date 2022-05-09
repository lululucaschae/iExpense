//
//  File.swift
//  iExpense
//
//  Created by Lucas Chae on 5/6/22.
//

import Foundation

struct SingleExpense: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
