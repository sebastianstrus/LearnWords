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

        mainMenuView.b1b2Action = handleB1B2
        mainMenuView.newLevelAction = handleNewLevel
        mainMenuView.irregularVerbsAction = handleIrregularVerbs
        mainMenuView.c1Action = handleC1
        mainMenuView.professionsAction = handleProfessions
        
        self.view.addSubview(mainMenuView)
        mainMenuView.pinToEdges(view: view, safe: false)
    }

    
    fileprivate func handleIrregularVerbs() {
        let irregularVerbsVC = IrregularVerbsVC()
        irregularVerbsVC.title = "Czasowniki"
        irregularVerbsVC.questions = Data.getHardVerbs()
        navigationController?.pushViewController(irregularVerbsVC, animated: true)
    }
    
    fileprivate func handleB1B2() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "Poziom B1-B2"
        learnWordVC.questions = Data.getB1B2()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handleC1() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "Poziom C1"
        learnWordVC.questions = Data.getC1()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handleProfessions() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "Zawody "
        learnWordVC.questions = Data.getProfessions()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handleNewLevel() {

    }
    
    

}
