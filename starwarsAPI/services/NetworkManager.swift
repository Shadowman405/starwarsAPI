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

class PersonApi {
// MARK: - Alamofire reuqests
    
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
    
// MARK: - URL Session methods
    /*
    func getRandomPersonURL(id: Int, completion: @escaping PersonRsponseCompletion) {
        guard let url = URL(string: "\(PERSON_URL)\(id)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                debugPrint(error.debugDescription)
                completion(nil)
                return
            }
            
            guard let data = data else {return}
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String: Any] else {return}
                let person = self.parsePerson(json: json)
                DispatchQueue.main.async {
                    completion(person)
                }
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        task.resume()
    }
    
    private func parsePerson(json: [String: Any]) -> Person {
        let name = json["name"] as? String ?? ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeworld = json["homeworld"] as? String ?? ""
        let films = json["films"] as? [String] ?? [String]()
        let vehicles = json["vehicles"] as? [String] ?? [String]()
        let starships = json["starships"] as? [String] ?? [String]()
        
        let person = Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldURL: homeworld, filmsURL: films, vehicleURL: vehicles, starshipURL: starships)
        return person
    }
 */
}
