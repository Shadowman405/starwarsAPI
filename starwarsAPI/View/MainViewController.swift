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
    
    
    var personApi = PersonApi()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func randomBtnCLicked(_ sender: Any) {
        let random = Int.random(in: 1...82)
        personApi.getRandomPersonAlamofire(id: random) { (person) in
            if let person = person {
                self.nameLbl.text = person.name
                self.heightLbl.text = person.height
                self.massLbl.text = person.mass
                self.hairLbl.text = person.hair
                self.birthYearLbl.text = person.birthYear
                self.genderLbl.text = person.gender
            }
        }
    }
    
}

