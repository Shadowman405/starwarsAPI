//
//  PersonAPI.swift
//  starwarsAPI
//
//  Created by Maxim Mitin on 7.08.21.
//

import Foundation

class PersonApi {
    
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
}
