//
//  DummyService.swift
//  YouTubeClone
//
//  Created by Sarvar Boltaboyev on 29/11/24.
//

import Foundation
class DummyService {
    
    func fetch(handler: @escaping(Result<[DummyImage], Error>) -> Void) {
        
        guard let url = URL(string: "https://picsum.photos/v2/list") else { return }
        
         URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                print(error.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else { return }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode([DummyImage].self, from: data)
                handler(.success(result))
            } catch {
                handler(.failure(error))
            }
         }.resume()
    }
    
}
