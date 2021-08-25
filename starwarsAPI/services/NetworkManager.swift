//
//  PersonAPI.swift
//  starwarsAPI
//
//  Created by Maxim Mitin on 7.08.21.
//

import Foundation
import Alamofire
import SwiftyJSON

let BASE_URL = "https://swapi.dev/api/"
let PERSON_URL = BASE_URL + "people/"

typealias PersonRsponseCompletion = (Person?) -> Void
typealias HomeworldCOmpletion = (Homeworld?) -> Void
typealias VehicleResponseCompletion = (Vehicle?) -> Void
typealias StarshipResponseCompletion = (Starship?) -> Void
typealias FilmResponseCompletion = (Film?) -> Void

//MARK: - Person class

class PersonApi {
    
    func getRandomPersonAlamofire(id: Int, completion: @escaping PersonRsponseCompletion) {
        guard let url = URL(string: "\(PERSON_URL)\(id)") else {return}
        AF.request(url).responseJSON { response in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else {return completion(nil)}
            let jsonDecoder = JSONDecoder()
            do {
                let person = try jsonDecoder.decode(Person.self, from: data)
                completion(person)
            } catch {
                debugPrint(error.localizedDescription)
                return completion(nil)
            }
        }
    }
    
//Parsing SwiftyJson
    private func parsePersonSwifty(json: JSON) -> Person {
        let name = json["name"].stringValue
        let height = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hair = json["hair_color"].stringValue
        let birthYear = json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeworld = json["homeworld"].stringValue
        let films = json["films"].arrayValue.map({$0.stringValue})
        let vehicles = json["vehicles"].arrayValue.map({$0.stringValue})
        let starships = json["starships"].arrayValue.map({$0.stringValue})
        
        let person = Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldURL: homeworld, filmsURL: films, vehicleURL: vehicles, starshipURL: starships)
        return person
    }
}

//MARK: - Homeworld Class

class HomeworldAPI {
    func getHomeworld(url: String, completion: @escaping HomeworldCOmpletion) {
        guard let url = URL(string: url) else {return}
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion (nil)
                return
            }
            guard let data = response.data else {return}
            let jsonDEcoder = JSONDecoder()
            do {
                let homeworld = try jsonDEcoder.decode(Homeworld.self, from: data)
                completion(homeworld)
            } catch {
                debugPrint(error.localizedDescription)
                completion (nil)
            }
        }
    }
}

//MARK: - Vehicle Class

class VehicleAPI{
    func getVehicle(url: String, completion: @escaping VehicleResponseCompletion) {
        guard let url = URL(string: url) else {return}
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion (nil)
                return
            }
            guard let data = response.data else {return}
            let jsonDEcoder = JSONDecoder()
            do {
                let vehicle = try jsonDEcoder.decode(Vehicle.self, from: data)
                completion(vehicle)
            } catch {
                debugPrint(error.localizedDescription)
                completion (nil)
            }
        }
    }
}

//MARK: - Starship class

class StarshipAPI {
    func getStarship(url: String, completion: @escaping StarshipResponseCompletion) {
        guard let url = URL(string: url) else {return}
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else {return}
            let jsonDecoder = JSONDecoder()
            do {
                let vehicle = try jsonDecoder.decode(Starship.self, from: data)
                completion(vehicle)
            }catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}

//MARK: - Film class

class FilmAPI {
    func getFilm (url: String, completion: @escaping FilmResponseCompletion) {
        guard let url = URL(string: url) else {return}
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else {return}
            let jsonDecoder = JSONDecoder()
            do {
                let film = try jsonDecoder.decode(Film.self, from: data)
                completion(film)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
