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

        mainMenuView.irregularVerbsAction = handleIrregularVerbs
        mainMenuView.b1b2Action = handleB1B2
        mainMenuView.c1Action = handleC1
        mainMenuView.professionsAction = handleProfessions
        mainMenuView.adjectivesAction = handleAdjectives
        mainMenuView.bodyAction = handleBody
        mainMenuView.carAction = handleCar
        mainMenuView.itAction = handleIT
        mainMenuView.healthAction = handleHealth
        mainMenuView.legalTermsAction = handleLegalTerms
        mainMenuView.personalQualitiesAction = handlePersonalQualities
        mainMenuView.shapesAction = handleShapes
        mainMenuView.weatherAction = handleWeather
        
        
        mainMenuView.button1Action = handle1Button
        mainMenuView.button2Action = handle2Button
        mainMenuView.button3Action = handle3Button
        mainMenuView.button4Action = handle4Button
        mainMenuView.button5Action = handle5Button
        mainMenuView.button6Action = handle6Button
        mainMenuView.button7Action = handle7Button
        mainMenuView.button8Action = handle8Button
        mainMenuView.button9Action = handle9Button
        mainMenuView.button10Action = handle10Button
        mainMenuView.button11Action = handle11Button
        mainMenuView.button12Action = handle12Button
        mainMenuView.button13Action = handle13Button
        mainMenuView.button14Action = handle14Button
        
        
        self.view.addSubview(mainMenuView)
        mainMenuView.pinToEdges(view: view, safe: false)
    }

    
    fileprivate func handleIrregularVerbs() {
        let irregularVerbsVC = IrregularVerbsVC()
        irregularVerbsVC.title = "Czasowniki"
        irregularVerbsVC.questions = Data.getMoreVerbs()// getProblematicVerbs
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
        learnWordVC.title = "Zawody"
        learnWordVC.questions = Data.getProfessions()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handleAdjectives() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "Przymiotniki"
        learnWordVC.questions = Data.getHardAdjectivesAdvanced()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handleBody() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "Body (ciało)"
        learnWordVC.questions = Data.getBody()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handleCar() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "Car parts (części samochodowe)"
        learnWordVC.questions = Data.getCar()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handleIT() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "Computers and technology"
        learnWordVC.questions = Data.getIT()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handleHealth() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "Health (zdrowie)"
        learnWordVC.questions = Data.getHealth()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }

    fileprivate func handleLegalTerms() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "Legal terms (słownictwo prawnicze)"
        learnWordVC.questions = Data.getLegalTerms()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }

    fileprivate func handlePersonalQualities() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "Personal qualities (cechy charakteru)"
        learnWordVC.questions = Data.getPersonalQualities()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }

    fileprivate func handleShapes() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "Shapes (kształty)"
        learnWordVC.questions = Data.getShapes()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }

    fileprivate func handleWeather() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "Weather (pogoda)"
        learnWordVC.questions = Data.getWeather()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handle1Button() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "1. Animals and insects (zwierzęta i owady)"
        learnWordVC.questions = Data.get1()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handle2Button() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "2. Appliances and technology (urządzenia i technologia)"
        learnWordVC.questions = Data.get2()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handle3Button() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "3. Buildings and institutions (budynki i instytucje)"
        learnWordVC.questions = Data.get3()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handle4Button() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "4. Clothes and accessories (ubrania i akcesoria)"
        learnWordVC.questions = Data.get4()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handle5Button() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "5. Emotions and feelings (emocje i uczucia)"
        learnWordVC.questions = Data.get5()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handle6Button() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "6. Furniture (meble)"
        learnWordVC.questions = Data.get6()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handle7Button() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "7. Geography (geografia)"
        learnWordVC.questions = Data.get7()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handle8Button() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "8. Musical instruments (instrumenty muzyczne)"
        learnWordVC.questions = Data.get8()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handle9Button() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "9. Office and business (biuro i biznes)"
        learnWordVC.questions = Data.get9()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handle10Button() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "10. Science (nauka)"
        learnWordVC.questions = Data.get10()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handle11Button() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "11. Tools (narzędzia)"
        learnWordVC.questions = Data.get11()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handle12Button() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "12. Weapons (bronie)"
        learnWordVC.questions = Data.get12()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handle13Button() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "13. Weight and measures (waga i jednostki miary)"
        learnWordVC.questions = Data.get13()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    fileprivate func handle14Button() {
        let learnWordVC = LearnWordVC()
        learnWordVC.title = "14. Yard (podwórze)"
        learnWordVC.questions = Data.get14()
        navigationController?.pushViewController(learnWordVC, animated: true)
    }
    
    
    
    

}
