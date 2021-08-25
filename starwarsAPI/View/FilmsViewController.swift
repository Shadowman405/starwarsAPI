//
//  FilmsViewController.swift
//  starwarsAPI
//
//  Created by Maxim Mitin on 15.08.21.
//

import UIKit

class FilmsViewController: UIViewController, PersonProtocol {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var episdoeLbl: UILabel!
    @IBOutlet weak var crawlLbl: UITextView!
    
    
    @IBOutlet weak var prevBtnLbl: UIButton!
    @IBOutlet weak var nextBtnLbl: UIButton!
    
    var person: Person!
    let api = FilmAPI()
    var films = [String]()
    var currentFilm = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        films = person.filmsURL
        prevBtnLbl.isEnabled = false
        nextBtnLbl.isEnabled = films.count > 1
        guard let firstFilm = films.first else {return}
        getFilm(url: firstFilm)
    }
    
    
    
    func getFilm(url: String) {
        api.getFilm(url: url) { (film) in
            if let film = film {
                self.setupView(film: film)
            }
        }
    }
    
    func setupView(film: Film) {
        titleLbl.text = film.title
        episdoeLbl.text = String(film.episode)
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releasedLbl.text = film.releaseDate
        let stripped = film.crawl.replacingOccurrences(of: "\n", with: " ")
        crawlLbl.text = stripped
    }

    @IBAction func previousBtnClicked(_ sender: Any) {
        currentFilm -= 1
        setupButtonState()
    }
    
    
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        currentFilm += 1
        setupButtonState()
    }
    
    func setupButtonState () {
        nextBtnLbl.isEnabled = currentFilm == films.count - 1 ? false : true
        prevBtnLbl.isEnabled = currentFilm == 0 ? false : true

        getFilm(url: films[currentFilm])
    }
    
}
