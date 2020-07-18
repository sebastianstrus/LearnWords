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

        mainMenuView.b1b2Action = handleTime
        mainMenuView.newLevelAction = handleVerbs
        mainMenuView.irregularVerbsAction = handleAdjectives
        mainMenuView.c1Action = handlePlEn
        mainMenuView.professionsAction = handleUseful
        
        self.view.addSubview(mainMenuView)
        mainMenuView.pinToEdges(view: view, safe: false)
    }

    fileprivate func handleTime() {

    }
    
    fileprivate func handleVerbs() {

    }
    
    fileprivate func handleAdjectives() {
        let learnController = IrregularVerbsVC()
        learnController.title = "Czasowniki"
        learnController.questions = Data.getHardVerbs()
        navigationController?.pushViewController(learnController, animated: true)
    }
    
    fileprivate func handlePlEn() {

    }
    
    fileprivate func handleUseful() {
//        let learnController = LearnController()
//        learnController.title = "Useful words"
//        learnController.questions = Data.getWeatherWords()
//        navigationController?.pushViewController(learnController, animated: true)
    }
    
    

}
