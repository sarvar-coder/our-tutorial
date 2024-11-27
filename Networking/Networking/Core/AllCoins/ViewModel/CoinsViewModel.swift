//
//  CoinsViewModel.swift
//  Networking
//
//  Created by Sarvar Boltaboyev on 25/11/24.
//

import Foundation

class CoinsViewModel: ObservableObject {
    @Published var coin = ""
    @Published var price = ""
    
    init() {
        fetchPrice()
    }
    
    func fetchPrice() {
        guard  let url = URL(string: "https://pro-api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(data!)
        }.resume()
    }
}
