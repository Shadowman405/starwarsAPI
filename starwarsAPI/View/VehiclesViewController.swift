//
//  VehiclesViewController.swift
//  starwarsAPI
//
//  Created by Maxim Mitin on 15.08.21.
//

import UIKit

class VehiclesViewController: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manufactererLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var prevBtnLbl: UIButton!
    @IBOutlet weak var nextBtnLbl: UIButton!
    
    
    var person: Person!
    let api = VehicleAPI()
    var vehicles = [String]()
    var currentVehicle = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicleURL
        nextBtnLbl.isEnabled = vehicles.count > 1
        prevBtnLbl.isEnabled = false
        guard let firstvehicle = vehicles.first else {return}
        getVehicle(url: firstvehicle)
    }
    
    func getVehicle(url: String){
        api.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                self.setupView(vehicle: vehicle)
            }
        }
    }

    func setupView(vehicle: Vehicle) {
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        manufactererLbl.text = vehicle.manufacturer
        costLbl.text = vehicle.cost
        lengthLbl.text = vehicle.length
        speedLbl.text = vehicle.speed
        crewLbl.text = vehicle.crew
        passengersLbl.text = vehicle.passengers
    }
    
    @IBAction func previousBtnCLicked(_ sender: Any) {
        currentVehicle -= 1
        setButtonState()
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        currentVehicle += 1
        setButtonState()
    }
    
    func setButtonState() {
        nextBtnLbl.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
        prevBtnLbl.isEnabled = currentVehicle == 0 ? false : true
        
        getVehicle(url: vehicles[currentVehicle])
    }
    
}
