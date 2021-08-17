//
//  ViewController.swift
//  starwarsAPI
//
//  Created by Maxim Mitin on 7.08.21.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!

//Labels for buttons
    @IBOutlet weak var homeworldLBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    
    
    var personApi = PersonApi()
    private var persons: [Person] = [] // empty array for UserDefaults loading data

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //User Defaults logic (load data, filling empty perons array with data
        //persons = StorageManger.shared.fetchPerons()
        //randomPersFromUserDefaults()
    }

    @IBAction func randomBtnCLicked(_ sender: Any) {
        let random = Int.random(in: 1...82)
        personApi.getRandomPersonAlamofire(id: random) { (person) in
            if let person = person {
                self.setupView(person: person)
                //save to UserDefaults
                //StorageManger.shared.save(person: person)
            }
        }
    }
    
// MARK: - Random person's values at app start
    private func randomPersFromUserDefaults() {
        guard let randomPers = persons.randomElement() else {return}
        nameLbl.text = randomPers.name
        heightLbl.text = randomPers.height
        massLbl.text = randomPers.mass
        hairLbl.text = randomPers.hair
        birthYearLbl.text = randomPers.birthYear
        genderLbl.text = randomPers.gender
    }
    
    func setupView(person: Person) {
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        hairLbl.text = person.hair
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
            
        homeworldLBtn.isEnabled = !person.homeworldURL.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleURL.isEmpty
        starshipsBtn.isEnabled = !person.starshipURL.isEmpty
        filmsBtn.isEnabled = !person.filmsURL.isEmpty
    }
    
// MARK: - Buttons
    
    @IBAction func homeWorldCLicked(_ sender: Any) {
    }
    
    
    @IBAction func vehiclisClicked(_ sender: Any) {
    }
    
    
    @IBAction func startshipsClicked(_ sender: Any) {
    }
    
    
    @IBAction func filmsClicked(_ sender: Any) {
    }
    
}
