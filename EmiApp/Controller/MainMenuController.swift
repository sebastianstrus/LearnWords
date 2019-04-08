//
//  MainMenuController.swift
//  EmiApp
//
//  Created by Sebastian Strus on 2019-04-07.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

class MainMenuController: UIViewController {
    
    fileprivate var mainMenuView: MainMenuView!
    
    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - Private functions
    fileprivate func setupView() {
        self.mainMenuView = MainMenuView()

        mainMenuView.timeAction = handleTime
        mainMenuView.verbsAction = handleVerbs
        mainMenuView.adjectivesAction = handleAdjectives
        mainMenuView.weatherAction = handleWeather
        mainMenuView.usefulAction = handleUseful
        
        self.view.addSubview(mainMenuView)
        mainMenuView.pinToEdges(view: view, safe: false)
    }

    fileprivate func handleTime() {
        let learnController = LearnController()
        learnController.title = "Time"
        learnController.questions = Data.getWeatherWords()
        navigationController?.pushViewController(learnController, animated: true)
    }
    
    fileprivate func handleVerbs() {
        let learnController = LearnController()
        learnController.title = "Verbs"
        learnController.questions = Data.getVerbs()
        navigationController?.pushViewController(learnController, animated: true)
    }
    
    fileprivate func handleAdjectives() {
        let learnController = LearnController()
        learnController.title = "Adjectives"
        learnController.questions = Data.getWeatherWords()
        navigationController?.pushViewController(learnController, animated: true)
    }
    
    fileprivate func handleWeather() {
        let learnController = LearnController()
        learnController.title = "Weather"
        learnController.questions = Data.getWeatherWords()
        navigationController?.pushViewController(learnController, animated: true)
    }
    
    fileprivate func handleUseful() {
        let learnController = LearnController()
        learnController.title = "Useful words"
        learnController.questions = Data.getWeatherWords()
        navigationController?.pushViewController(learnController, animated: true)
    }
    
    

}
