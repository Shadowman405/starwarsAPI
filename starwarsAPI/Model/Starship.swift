//
//  Starship.swift
//  starwarsAPI
//
//  Created by Maxim Mitin on 22.08.21.
//

import Foundation

struct Starship: Codable {
    var name: String
    var model: String
    var manufacturer: String
    var cost: String
    var length: String
    var speed: String
    var crew: String
    var passengers: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case length
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
    }
}
