//
//  Person.swift
//  starwarsAPI
//
//  Created by Maxim Mitin on 7.08.21.
//

import Foundation

struct Person: Codable {
    let name: String
    let height: String
    let mass: String
    let hair: String
    let birthYear: String
    let gender: String
    let homeworldURL: String
    let filmsURL: [String]
    let vehicleURL: [String]
    let starshipURL: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hair = "hair_color"
        case birthYear = "birth_year"
        case gender
        case homeworldURL = "homeworld"
        case filmsURL = "films"
        case vehicleURL = "vehicles"
        case starshipURL = "starships"
    }
}
