//
//  Film.swift
//  starwarsAPI
//
//  Created by Maxim Mitin on 22.08.21.
//

import Foundation

struct Film: Codable {
    let title : String
    let episode: Int
    let crawl: String
    let director: String
    let producer: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case episode = "episode_id"
        case crawl = "opening_crawl"
        case director
        case producer
        case releaseDate = "release_date"
    }
}
