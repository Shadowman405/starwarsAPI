//
//  StorageManager.swift
//  starwarsAPI
//
//  Created by Maxim Mitin on 15.08.21.
//

import Foundation

class StorageManger {
    static let shared = StorageManger()
    
    private let userDefaults = UserDefaults.standard
    private let personKey = "person"
    
    private init() {}
    
    func save(person: Person) {
        var persons = fetchPerons()
        persons.append(person)
        guard let data = try? JSONEncoder().encode(persons) else {return}
        userDefaults.set(data , forKey: personKey)
    }
    
    func fetchPerons() -> [Person] {
        guard let data = userDefaults.object(forKey: personKey) as? Data else {return [] }
        guard let persons = try? JSONDecoder().decode([Person].self, from: data) else {return []}
        return persons
    }
    
    func deletePerons(index: Int) {
        var persons = fetchPerons()
        persons.remove(at: index)
        guard let data = try? JSONEncoder().encode(persons) else {return}
        userDefaults.set(data, forKey: personKey)
    }
}
