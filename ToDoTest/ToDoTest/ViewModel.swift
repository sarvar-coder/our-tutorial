//
//  ViewModel.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 25/11/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published private var model = NetworkManager()
    @Published var todos = [Todo]()
    
//    var networkLoaded = true
    init(loaded: Bool = true) {
        if loaded {
            fetchData()
            print("suydv")
        }
    }
    
    private func fetchData() {
       model.fetchTodo { result in
           switch result {
           case .success(let success):
//               DispatchQueue.main.async {
                   self.todos = success.todos
//               }
//               self.networkLoaded = true
           case .failure(let failure):
               print(failure.localizedDescription)
           }
       }
    }
}
