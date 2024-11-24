//
//  NetworkManager.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 24/11/24.
//

import Foundation
class NetworkManager: ObservableObject {
   static let shared = NetworkManager()
    @Published var todos = [Todo]()
    
   private func fetchTodo(_ handler: @escaping(Result<TodoDummy, Error>) -> Void) {
        
        guard let url = URL(string: "https://dummyjson.com/todos") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error {
                    print(error.localizedDescription)
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else { return }
                
                guard let data = data else { return }
                
                do {
                    let result = try JSONDecoder().decode(TodoDummy.self, from: data)
                    handler(.success(result))
                } catch {
                    handler(.failure(error))
                }
            }
        }
        task.resume()
    }
}
