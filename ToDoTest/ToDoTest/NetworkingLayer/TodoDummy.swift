//
//  TodoDummy.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 24/11/24.
//

import Foundation

struct TodoDummy: Codable {
    let todos: [Todo]
    let total: Int
    let skip: Int
    let limit: Int
}

struct Todo: Codable {
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}
