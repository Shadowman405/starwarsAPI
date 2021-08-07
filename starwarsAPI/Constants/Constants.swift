//
//  Constants.swift
//  starwarsAPI
//
//  Created by Maxim Mitin on 7.08.21.
//

import Foundation

let BASE_URL = "https://swapi.dev/api/"
let PERSON_URL = BASE_URL + "people/"

typealias PersonRsponseCompletion = (Person?) -> Void
