//
//  HomeworldViewController.swift
//  starwarsAPI
//
//  Created by Maxim Mitin on 15.08.21.
//

import UIKit

class HomeworldViewController: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    var person: Person!
    let api = HomeworldAPI()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        api.getHomeworld(url: person.homeworldURL) { (homeworld) in
            if let homeworld = homeworld {
                self.setupUI(homewrold: homeworld)
            }
        }
    }

    func setupUI(homewrold: Homeworld) {
        nameLbl.text = homewrold.name
        climateLbl.text = homewrold.climate
        terrainLbl.text = homewrold.terrain
        populationLbl.text = homewrold.population
    }

}
