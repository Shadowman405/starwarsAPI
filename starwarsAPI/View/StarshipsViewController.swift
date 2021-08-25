//
//  StarshipsViewController.swift
//  starwarsAPI
//
//  Created by Maxim Mitin on 15.08.21.
//

import UIKit

class StarshipsViewController: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passangersLbl: UILabel!
    
    @IBOutlet weak var prevBtnLbl: UIButton!
    @IBOutlet weak var nextBtnLbl: UIButton!
    
    var person: Person!
    let api = StarshipAPI()
    var starships = [String]()
    var currentStarship = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starships = person.starshipURL
        nextBtnLbl.isEnabled = starships.count > 1
        prevBtnLbl.isEnabled = false
        guard let firstStartship = starships.first else {return}
        getStarship(url: firstStartship)
    }
    
    func getStarship(url: String) {
        api.getStarship(url: url) { (starship) in
            if let starship = starship {
                self.setupView(starship: starship)
            }
        }
    }
    
    func setupView(starship: Starship) {
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        makerLbl.text = starship.manufacturer
        costLbl.text = starship.cost
        lengthLbl.text = starship.length
        speedLbl.text = starship.speed
        crewLbl.text = starship.crew
        passangersLbl.text = starship.passengers
    }

    @IBAction func previousBtnClicked(_ sender: Any) {
        currentStarship -= 1
        setupButtonState()
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        currentStarship += 1
        setupButtonState()
    }
    
    func setupButtonState () {
        nextBtnLbl.isEnabled = currentStarship == starships.count - 1 ? false : true
        prevBtnLbl.isEnabled = currentStarship == 0 ? false : true
        
        getStarship(url: starships[currentStarship])
    }
    
}
