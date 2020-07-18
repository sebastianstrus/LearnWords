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
    var b1b2Action: (() -> Void)?
    var newLevelAction: (() -> Void)?
    var irregularVerbsAction: (() -> Void)?
    var c1Action: (() -> Void)?
    var professionsAction: (() -> Void)?
    
    // MARK: - All subviews
    fileprivate var buttonsStackView: UIStackView!
    
    fileprivate let irregularVerbsButton: BounceButton = {
        let button = BounceButton(title: "Czasowniki nieregularne")
        button.addTarget(self, action: #selector(handleIrregularVerbs), for: .touchUpInside)
        return button
    }()
    
    fileprivate let levelB1B2Button: BounceButton = {
        let button = BounceButton(title: "Poziom B1-B2")
        button.addTarget(self, action: #selector(handleB1B2), for: .touchUpInside)
        return button
    }()
    
    fileprivate let levelC1Button: BounceButton = {
        let button = BounceButton(title: "Poziom C1")
        button.addTarget(self, action: #selector(handleC1), for: .touchUpInside)
        return button
    }()
    
    fileprivate let professionsButton: BounceButton = {
        let button = BounceButton(title: "Zawody")
        button.addTarget(self, action: #selector(handleProfessions), for: .touchUpInside)
        return button
    }()
    
    fileprivate let newLevelButton: BounceButton = {
        let button = BounceButton(title: "Nowy poziom")
        button.addTarget(self, action: #selector(handleNewLevel), for: .touchUpInside)
        return button
    }()
    
    // MARK: - private functions
    fileprivate func setup() {
        backgroundColor = UIColor.darkGray

        
        
        
        buttonsStackView = createVerticalStackView(views: [irregularVerbsButton, levelB1B2Button, levelC1Button, professionsButton, newLevelButton],
                                                   spacing: 20)
        addSubview(buttonsStackView)
        
        buttonsStackView.setAnchor(width: Device.IS_IPHONE ? 240 : 480,
                                   height: 480)
        buttonsStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonsStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
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
    
    @objc fileprivate func handleNewLevel() {
        newLevelAction?()
    }
}
