//
//  TodoDummy.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 24/11/24.
//

import Foundation

struct TodoDummy: Codable {
    let todos: [Todo]
}

struct Todo: Codable, Identifiable {
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}
