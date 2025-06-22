//
//  Model.swift
//  Pagination
//
//  Created by Sarvar Boltaboyev on 21/06/25.
//

import Foundation

struct Photo: Identifiable, Codable, Hashable {
    var id: String
    var author: String
    var width: CGFloat
    var height: CGFloat
    var url: String
    var downloadURLString: String
    
    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURLString = "download_url"
    }
    
    var downloadURL: URL? {
        return URL(string: downloadURLString)
    }
    
    var imageURL: URL? {
        return URL(string: "https://picsum.photos/id/\(id)/256/256.jpg")
    }
}
