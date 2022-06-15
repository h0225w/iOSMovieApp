// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movieListData = try? newJSONDecoder().decode(MovieListData.self, from: jsonData)

import Foundation

// MARK: - MovieListData
struct MovieListData: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title: String
    let link: String
    let image: String
    let subtitle, pubDate, director, actor: String
    let userRating: String
}
