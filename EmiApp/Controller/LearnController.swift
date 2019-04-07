//
//  LearnController.swift
//  EmiApp
//
//  Created by Sebastian Strus on 2019-04-07.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//



import UIKit
import AVFoundation

import UIKit

class LearnController: UIViewController, UITextFieldDelegate {
    
    
    var questions: [Question]!
    
    var shuffledQuestions: [Question]!
    
    
    
    
    
    
    
    var answered: Bool = false {
        didSet {
            nextButton.isEnabled = answered ? true : false
            nextButton.alpha = answered ? 1 : 0.5
        }
    }
    
    var currentNumber = 0 {
        didSet {
            numberLabel.text = "\(currentNumber + 1)/\(questions.count)"
        }
    }
    
    var currentQuestion: Question!
    
    
    
    
    
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.ACCENT_PURPLE
        label.font = AppFonts.NUMBER_FONT
        label.text = "1/10"
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    let soundButtonUK: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "sound_icon"), for: .normal)
        button.addTarget(self, action: #selector(handleSoundUK), for: .touchUpInside)
        return button
    }()
    
    let ukLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "UK:", attributes: [NSAttributedString.Key.font: AppFonts.NUMBER_FONT!, .foregroundColor: AppColors.ACCENT_PURPLE]))
        label.attributedText = attributedString
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    
    let soundButtonUS: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "sound_icon"), for: .normal)
        button.addTarget(self, action: #selector(handleSoundUS), for: .touchUpInside)
        return button
    }()
    
    let usLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "US:", attributes: [NSAttributedString.Key.font: AppFonts.NUMBER_FONT!, .foregroundColor: AppColors.ACCENT_PURPLE]))
        label.attributedText = attributedString
        label.textAlignment = NSTextAlignment.center
        //label.backgroundColor = UIColor.lightGray
        return label
    }()
    
    
    fileprivate let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = AppColors.ACCENT_PURPLE

        label.numberOfLines = 2
        label.textAlignment = NSTextAlignment.center
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 1.0, height: 1.0)
        //label.backgroundColor = UIColor.lightGray
        return label
    }()
    
    fileprivate let answerTF: UITextField = {
        let tf = UITextField()
        tf.textAlignment = .center
        tf.font = UIFont.systemFont(ofSize: 18)
        //tf.backgroundColor = UIColor.lightGray
        tf.placeholder = "Your answer"
        tf.layer.borderWidth = 3
        tf.layer.cornerRadius = 10
        tf.layer.borderColor = AppColors.ACCENT_PURPLE.cgColor
        tf.autocorrectionType = UITextAutocorrectionType.no
        return tf
    }()
    
    fileprivate let okButton: UIButton = {
        let button = BounceButton()
        button.setTitle("Ok", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = AppColors.ACCENT_PURPLE
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleOk), for: .touchUpInside)
        return button
    }()
    
    fileprivate let nextButton: UIButton = {
        let button = BounceButton()
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = AppColors.ACCENT_PURPLE
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    fileprivate let hintButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hint", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        button.setTitleColor(AppColors.ACCENT_PURPLE, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleHint), for: .touchUpInside)
        return button
    }()
    
    
    
    
    
    
    
    
    
    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shuffledQuestions = questions.shuffled()
        hideKeyboardWhenTappedAround()
        setupView()
        
        
        
        
        
        /*
        let responseUtterance = AVSpeechUtterance(string: "Hey human. It's me, the world")
        responseUtterance.pitchMultiplier = 0.75
        responseUtterance.rate = 0.45
        mySynthesizer.speak(responseUtterance)*/
        answerTF.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    // MARK: - UITextFieldDelegate functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("test")
        textField.resignFirstResponder()
        checkAnswer()
        return true
    }

    
    fileprivate func setupView() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(numberLabel)
        numberLabel.setAnchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 60, height: 30)
        
        view.addSubview(soundButtonUK)
        soundButtonUK.setAnchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        view.addSubview(ukLabel)
        ukLabel.setAnchor(top: nil, leading: nil, bottom: nil, trailing: soundButtonUK.leadingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: -4, width: 40, height: 30)
        ukLabel.centerYAnchor.constraint(equalTo: soundButtonUK.centerYAnchor).isActive = true
        
        view.addSubview(soundButtonUS)
        soundButtonUS.setAnchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: ukLabel.leadingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 50, height: 50)
        
        view.addSubview(usLabel)
        usLabel.setAnchor(top: nil, leading: nil, bottom: nil, trailing: soundButtonUS.leadingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: -4, width: 40, height: 30)
        usLabel.centerYAnchor.constraint(equalTo: soundButtonUS.centerYAnchor).isActive = true
        
        
        
        
        
        view.addSubview(questionLabel)
        questionLabel.setAnchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 60, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 70)
        
        view.addSubview(answerTF)
        answerTF.setAnchor(top: questionLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 70)
        
        numberLabel.text = "1/\(questions.count)"
        
        let buttonsStackView = UIStackView(arrangedSubviews: [okButton, nextButton])
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 10
        view.addSubview(buttonsStackView)
        buttonsStackView.setAnchor(top: answerTF.bottomAnchor, leading: answerTF.leadingAnchor, bottom: nil, trailing: answerTF.trailingAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        // set first
        questionLabel.text = shuffledQuestions[0].swedish
        currentQuestion = shuffledQuestions[0]
        nextButton.isEnabled = false
        nextButton.alpha = 0.5
        
        view.addSubview(hintButton)
        hintButton.setAnchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 50, height: 30)
        

        
    }
    
    @objc fileprivate func handleSoundUK() {
        let mySynthesizer = AVSpeechSynthesizer()
        let helloUtterance = AVSpeechUtterance(string: answerTF.text!)
        helloUtterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        helloUtterance.pitchMultiplier = 1.25
        helloUtterance.rate = 0.5
        mySynthesizer.speak(helloUtterance)
    }
    
    @objc fileprivate func handleSoundUS() {
        let mySynthesizer = AVSpeechSynthesizer()
        let helloUtterance = AVSpeechUtterance(string: answerTF.text!)
        helloUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        helloUtterance.pitchMultiplier = 1.25
        helloUtterance.rate = 0.5
        mySynthesizer.speak(helloUtterance)
    }
    
    @objc fileprivate func handleOk() {
        checkAnswer()
    }
    
    @objc fileprivate func handleNext() {
        setNextQuestion()
        
    }
    
    func checkAnswer() {
        if (currentQuestion.english.uppercased() == answerTF.text?.uppercased()) {
            answerTF.layer.borderColor = AppColors.BORDER_GREEN.cgColor
            answered = true
            nextButton.alpha = 1
        } else {
            answerTF.layer.borderColor = AppColors.BORDER_RED.cgColor
        }
    }
    
    func setNextQuestion() {
        if (currentNumber < questions.count - 1) {
            print("currentNumber: \(currentNumber)")
            print("questions.count: \(questions.count)")
            currentNumber += 1
            questionLabel.text = shuffledQuestions[currentNumber].swedish
            currentQuestion = shuffledQuestions[currentNumber]
            
            questionLabel.textColor = AppColors.ACCENT_PURPLE
            answerTF.text = ""
            answerTF.layer.borderColor = AppColors.ACCENT_PURPLE.cgColor
            answered = false
        } else {
            showMessage("You are very smart!", withTitle: "Congratulations!")
        }
        
    }
    
    @objc func handleHint() {
        showMessage(currentQuestion.english, withTitle: "Hint :(")
    }
}


