//
//  MainMenuView.swift
//  EmiApp
//
//  Created by Sebastian Strus on 2019-04-07.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//


import UIKit

class MainMenuView: UIView {
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public actions
    var irregularVerbsAction: (() -> Void)?
    var b1b2Action: (() -> Void)?
    var c1Action: (() -> Void)?
    var adjectivesAction: (() -> Void)?
    var professionsAction: (() -> Void)?
    var newLevelAction: (() -> Void)?
    
    var button1Action: (() -> Void)?
    var button2Action: (() -> Void)?
    var button3Action: (() -> Void)?
    var button4Action: (() -> Void)?
    var button5Action: (() -> Void)?
    var button6Action: (() -> Void)?
    var button7Action: (() -> Void)?
    var button8Action: (() -> Void)?
    var button9Action: (() -> Void)?
    var button10Action: (() -> Void)?
    var button11Action: (() -> Void)?
    var button12Action: (() -> Void)?
    var button13Action: (() -> Void)?
    var button14Action: (() -> Void)?
    
    // MARK: - All subviews
    fileprivate let leftContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    fileprivate let rightContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    
    fileprivate var leftButtonsStackView: UIStackView!
    fileprivate var rightButtonsStackView: UIStackView!
    
    fileprivate let irregularVerbsButton: BounceButton = {
        let button = BounceButton(title: "Czasowniki nieregularne (\(Data.getMoreVerbs().count))")
        button.addTarget(self, action: #selector(handleIrregularVerbs), for: .touchUpInside)
        button.layer.borderColor = UIColor.green.cgColor
        return button
    }()
    
    fileprivate let levelB1B2Button: BounceButton = {
        let button = BounceButton(title: "Poziom B1-B2 (\(Data.getB1B2().count))")
        button.addTarget(self, action: #selector(handleB1B2), for: .touchUpInside)
        button.layer.borderColor = UIColor.green.cgColor
        return button
    }()
    
    fileprivate let levelC1Button: BounceButton = {
        let button = BounceButton(title: "Poziom C1 (\(Data.getC1().count))")
        button.addTarget(self, action: #selector(handleC1), for: .touchUpInside)
        button.layer.borderColor = UIColor.green.cgColor
        return button
    }()
    
    fileprivate let professionsButton: BounceButton = {
        let button = BounceButton(title: "Zawody (\(Data.getProfessions().count))")
        button.addTarget(self, action: #selector(handleProfessions), for: .touchUpInside)
        return button
    }()
    
    fileprivate let adjectivesButton: BounceButton = {
        let button = BounceButton(title: "Przymiotniki (\(Data.getHardAdjectivesAdvanced().count))")
        button.addTarget(self, action: #selector(handleAdjectives), for: .touchUpInside)
        button.layer.borderColor = UIColor.orange.cgColor
        return button
    }()
    
    fileprivate let newLevelButton: BounceButton = {
        let button = BounceButton(title: "Nowy poziom")
        button.addTarget(self, action: #selector(handleNewLevel), for: .touchUpInside)
        return button
    }()
    
    
    fileprivate let c1Button: BounceButton = {
        let button = BounceButton(title: "1. Animals and insects (zwierzęta i owady) (\(Data.get1().count))")
        button.addTarget(self, action: #selector(handle1button), for: .touchUpInside)
        return button
    }()
    
    fileprivate let c2Button: BounceButton = {
        let button = BounceButton(title: "2. Appliances and technology (urządzenia i technologia) (\(Data.get2().count))")
        button.addTarget(self, action: #selector(handle2button), for: .touchUpInside)
        button.layer.borderColor = UIColor.green.cgColor
        return button
    }()
    
    fileprivate let c3Button: BounceButton = {
        let button = BounceButton(title: "3. Buildings and institutions (budynki i instytucje) (\(Data.get3().count))")
        button.addTarget(self, action: #selector(handle3button), for: .touchUpInside)
        return button
    }()
    
    fileprivate let c4Button: BounceButton = {
        let button = BounceButton(title: "4. Clothes and accessories (ubrania i akcesoria) (\(Data.get4().count))")
        button.addTarget(self, action: #selector(handle4button), for: .touchUpInside)
        return button
    }()
    
    fileprivate let c5Button: BounceButton = {
        let button = BounceButton(title: "5. Emotions and feelings (emocje i uczucia) (\(Data.get5().count))")
        button.addTarget(self, action: #selector(handle5button), for: .touchUpInside)
        return button
    }()
    
    fileprivate let c6Button: BounceButton = {
        let button = BounceButton(title: "6. Furniture (meble) (\(Data.get6().count))")
        button.addTarget(self, action: #selector(handle6button), for: .touchUpInside)
        return button
    }()
    
    fileprivate let c7Button: BounceButton = {
        let button = BounceButton(title: "7. Geography (geografia) (\(Data.get7().count))")
        button.addTarget(self, action: #selector(handle7button), for: .touchUpInside)
        button.layer.borderColor = UIColor.green.cgColor
        return button
    }()
    
    fileprivate let c8Button: BounceButton = {
        let button = BounceButton(title: "8. Musical instruments (instrumenty muzyczne) (\(Data.get8().count))")
        button.addTarget(self, action: #selector(handle8button), for: .touchUpInside)
        return button
    }()
    
    fileprivate let c9Button: BounceButton = {
        let button = BounceButton(title: "9. Office and business (biuro i biznes) (\(Data.get9().count))")
        button.addTarget(self, action: #selector(handle9button), for: .touchUpInside)
        return button
    }()
    
    fileprivate let c10Button: BounceButton = {
        let button = BounceButton(title: "10. Science (nauka) (\(Data.get10().count))")
        button.addTarget(self, action: #selector(handle10button), for: .touchUpInside)
        return button
    }()
    
    fileprivate let c11Button: BounceButton = {
        let button = BounceButton(title: "11. Tools (narzędzia) (\(Data.get11().count))")
        button.addTarget(self, action: #selector(handle11button), for: .touchUpInside)
        button.layer.borderColor = UIColor.green.cgColor
        return button
    }()
    
    fileprivate let c12Button: BounceButton = {
        let button = BounceButton(title: "12. Weapons (bronie) (\(Data.get12().count))")
        button.addTarget(self, action: #selector(handle12button), for: .touchUpInside)
        button.layer.borderColor = UIColor.green.cgColor
        return button
    }()
    
    fileprivate let c13Button: BounceButton = {
        let button = BounceButton(title: "13. Weight and measures (waga i jednostki miary) (\(Data.get13().count))")
        button.addTarget(self, action: #selector(handle13button), for: .touchUpInside)
        button.layer.borderColor = UIColor.green.cgColor
        return button
    }()
    
    fileprivate let c14Button: BounceButton = {
        let button = BounceButton(title: "14. Yard (podwórze) (\(Data.get14().count))")
        button.addTarget(self, action: #selector(handle14button), for: .touchUpInside)
        button.layer.borderColor = UIColor.green.cgColor
        return button
    }()
    
    // MARK: - private functions
    fileprivate func setup() {
        backgroundColor = UIColor.darkGray
        
        addSubview(leftContainer)
        leftContainer.setAnchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        leftContainer.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
        addSubview(rightContainer)
        rightContainer.setAnchor(top: topAnchor, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        rightContainer.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        

        
        
        
        leftButtonsStackView = createVerticalStackView(views: [irregularVerbsButton, levelB1B2Button, levelC1Button, professionsButton, adjectivesButton, newLevelButton],
                                                   spacing: 10)
            leftContainer.addSubview(leftButtonsStackView)
        
        leftButtonsStackView.setAnchor(width: 280,
                                   height: 340)
        leftButtonsStackView.centerXAnchor.constraint(equalTo: leftContainer.centerXAnchor).isActive = true
        leftButtonsStackView.centerYAnchor.constraint(equalTo: leftContainer.centerYAnchor).isActive = true
        
        
        
        rightButtonsStackView = createVerticalStackView(views: [c1Button, c2Button, c3Button, c4Button, c5Button, c6Button, c7Button, c8Button, c9Button, c10Button, c11Button, c12Button, c13Button, c14Button],
                                                   spacing: 10)
            rightContainer.addSubview(rightButtonsStackView)
        
        rightButtonsStackView.setAnchor(width: 480,
                                   height: 830)
        rightButtonsStackView.centerXAnchor.constraint(equalTo: rightContainer.centerXAnchor).isActive = true
        rightButtonsStackView.centerYAnchor.constraint(equalTo: rightContainer.centerYAnchor).isActive = true
        
        //buttonsStackView.addBackground(color: UIColor.lightGray)
        
    }

    
    
    @objc fileprivate func handleIrregularVerbs() {
        irregularVerbsAction?()
    }
    
    @objc fileprivate func handleB1B2() {
        b1b2Action?()
    }
    
    @objc fileprivate func handleC1() {
        c1Action?()
    }
    
    @objc fileprivate func handleProfessions() {
        professionsAction?()
    }
    
    @objc fileprivate func handleAdjectives() {
        adjectivesAction?()
    }
    
    @objc fileprivate func handleNewLevel() {
        newLevelAction?()
    }
    
    @objc fileprivate func handle1button() {
        button1Action?()
    }
    
    @objc fileprivate func handle2button() {
        button2Action?()
    }
    
    @objc fileprivate func handle3button() {
        button3Action?()
    }
    
    @objc fileprivate func handle4button() {
        button4Action?()
    }
    
    @objc fileprivate func handle5button() {
        button5Action?()
    }
    
    @objc fileprivate func handle6button() {
        button6Action?()
    }
    
    @objc fileprivate func handle7button() {
        button7Action?()
    }
    
    @objc fileprivate func handle8button() {
        button8Action?()
    }
    
    @objc fileprivate func handle9button() {
        button9Action?()
    }
    
    @objc fileprivate func handle10button() {
        button10Action?()
    }
    
    @objc fileprivate func handle11button() {
        button11Action?()
    }
    
    @objc fileprivate func handle12button() {
        button12Action?()
    }
    
    @objc fileprivate func handle13button() {
        button13Action?()
    }
    
    @objc fileprivate func handle14button() {
        button14Action?()
    }
    

    
    
}
