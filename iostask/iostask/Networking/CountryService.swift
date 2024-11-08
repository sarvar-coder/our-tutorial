//
//  CountryService.swift
//  iostask
//
//  Created by Sarvar Boltaboyev on 08/11/24.
//

import Foundation

func fetchCountries(handler: @escaping(Result<Countries, Error>) -> Void) {
    guard let url = URL(string: Constants.url) else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        DispatchQueue.main.async {
            guard let data = data,
                  error == nil else {
                print("Error HERE")
                return
            }
            
            guard let httpresponse = response as? HTTPURLResponse,
                  (200...399).contains(httpresponse.statusCode) else { 
                print("Response Error")
                return
            } 
            
            do {
                let result = try JSONDecoder().decode(Countries.self, from: data)
                handler(.success(result))
            } catch {
                handler(.failure(error))
            }
        }
    }.resume()
}
