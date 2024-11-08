//
//  Country.swift
//  iostask
//
//  Created by Sarvar Boltaboyev on 08/11/24.
//

import Foundation

struct Countries: Codable {
    let next: String
    let countries: [Country]
}

struct Country: Codable {
    let name: String
    let continent: String
    let capital: String
    let population: Int
    let description_small: String
    let description: String
    let image: String
    let country_info: CountryInfo
}

struct CountryInfo: Codable {
    let images: [String]
    let flag: String
}

struct Constants {
    static let url = "https://rawgit.com/NikitaAsabin/799e4502c9fc3e0ea7af439b2dfd88fa/raw/7f5c6c66358501f72fada21e04d75f64474a7888/page1.json"
}
