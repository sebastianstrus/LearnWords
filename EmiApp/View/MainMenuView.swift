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
    var timeAction: (() -> Void)?
    var verbsAction: (() -> Void)?
    var adjectivesAction: (() -> Void)?
    var plEnAction: (() -> Void)?
    var usefulAction: (() -> Void)?
    
    // MARK: - All subviews
    fileprivate var backgroundImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "background2"))
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    fileprivate var topContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    fileprivate var bottomContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "EmiApp",
                                                                                              attributes: [NSAttributedString.Key.font: AppFonts.TITLE_FONT!, .foregroundColor: UIColor.white]))
        label.attributedText = attributedString
        label.textAlignment = NSTextAlignment.center
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 2.0, height: 2.0)
        return label
    }()
    
    fileprivate let subtitleLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string:  "Learn English", attributes: [NSAttributedString.Key.font: AppFonts.SUBTITLE_FONT!, .foregroundColor: UIColor.white]))
        label.attributedText = attributedString
        label.textAlignment = NSTextAlignment.center
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 2.0, height: 2.0)
        return label
    }()
    
    fileprivate var buttonsStackView: UIStackView!
    
    fileprivate let timeButton: BounceButton = {
        let button = BounceButton(title: "Time")
        button.addTarget(self, action: #selector(handleTime), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    
    fileprivate let verbsButton: BounceButton = {
        let button = BounceButton(title: "Verbs")
        button.addTarget(self, action: #selector(handleVerbs), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    
    fileprivate let adjectivesButton: BounceButton = {
        let button = BounceButton(title: "Czasowniki")
        button.addTarget(self, action: #selector(handleAdjectives), for: .touchUpInside)
        return button
    }()
    
    fileprivate let weatherButton: BounceButton = {
        let button = BounceButton(title: "PL - EN")
        button.addTarget(self, action: #selector(handlePlEn), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    
    fileprivate let usefulButton: BounceButton = {
        let button = BounceButton(title: "Useful words")
        button.addTarget(self, action: #selector(handleUseful), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    
    // MARK: - private functions
    fileprivate func setup() {
        //addSubview(backgroundImageView)
        //backgroundImageView.pinToEdges(view: self, safe: false)
        backgroundColor = UIColor.darkGray

        addSubview(bottomContainer)
        bottomContainer.pinToEdges(view: self, safe: false)
        
        
        
        buttonsStackView = createVerticalStackView(views: [timeButton, verbsButton, adjectivesButton, weatherButton, usefulButton],
                                                   spacing: 20)
        bottomContainer.addSubview(buttonsStackView)
        
        buttonsStackView.setAnchor(width: Device.IS_IPHONE ? 160 : 320,//Device.IS_IPHONE ? 200 : 400,
                                   height: 480)//Device.IS_IPHONE ? 115 : 230)
        buttonsStackView.centerXAnchor.constraint(equalTo: bottomContainer.centerXAnchor).isActive = true
        buttonsStackView.centerYAnchor.constraint(equalTo: bottomContainer.centerYAnchor).isActive = true
        
        //buttonsStackView.addBackground(color: UIColor.lightGray)
        
        titleLabel.alpha = 1//0
        subtitleLabel.alpha = 1//0
        buttonsStackView.alpha = 1//0
    }

    @objc fileprivate func handleTime() {
        timeAction?()
    }
    
    @objc fileprivate func handleVerbs() {
        verbsAction?()
    }
    
    @objc fileprivate func handleAdjectives() {
        adjectivesAction?()
    }
    
    @objc fileprivate func handlePlEn() {
        plEnAction?()
    }
    
    @objc fileprivate func handleUseful() {
        usefulAction?()
    }
}
