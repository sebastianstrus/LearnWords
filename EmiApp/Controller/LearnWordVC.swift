//
//  LearnWordVC.swift
//  EmiApp
//
//  Created by Sebastian Strus on 2019-04-07.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//



import UIKit
import AVFoundation
import SwiftySound

import UIKit

class LearnWordVC: UIViewController, UITextFieldDelegate {

    
    var questions: [Question]!
    var gotPrize = false
    var timer = Timer()
    let mySynthesizer = AVSpeechSynthesizer()
    
    var time: Int = 0 {
        didSet {
            //secondsLabel.text = "\(seconds)"
            let minutes = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            secondsLabel.text = String(format:"%02i:%02i", minutes, seconds)
            
        }
    }
    
    var shuffledQuestions: [Question]!
    
    var setUK: Bool = true
    
    var usedHints: Int = 0 {
        didSet {
            missedLabel.text = "Hints: \(usedHints)"
        }
    }
    
    
    var answeredFirst: Bool = false {
        didSet {
            //if (answeredSecond && answeredThird) {
                nextButton.isEnabled = answeredFirst ? true : false
                nextButton.alpha = answeredFirst ? 1 : 0.5
            if answeredFirst {
                tempTF.becomeFirstResponder()
            }
            //}
        }
    }
    
    /*var answeredSecond: Bool = false {
        didSet {
            if (answeredFirst && answeredThird) {
                nextButton.isEnabled = answeredSecond ? true : false
                nextButton.alpha = answeredFirst ? 1 : 0.5
            }
        }
    }*/
    
    /*var answeredThird: Bool = false {
        didSet {
            if (answeredFirst && answeredSecond) {
                if answeredThird {
                    nextButton.isEnabled = true
                    nextButton.alpha = 1
                    print("becomeFirstResponder")
                    tempTF.becomeFirstResponder()
                }
                else {
                    nextButton.isEnabled = false
                    nextButton.alpha = 0.5
                }
            }

        }
    }*/
    
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
    
    let secondsLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.ACCENT_PURPLE
        label.font = AppFonts.NUMBER_FONT
        label.text = "0:0"
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    let missedLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(r: 180, g: 0, b: 0)
        label.font = AppFonts.NUMBER_FONT
        label.text = "Hints: \(0)"
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    

    
    let ukLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "UK", attributes: [NSAttributedString.Key.font: AppFonts.NUMBER_FONT!, .foregroundColor: AppColors.ACCENT_PURPLE]))
        label.attributedText = attributedString
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    let switchButton: UISwitch = {
        let sw = UISwitch()
        sw.transform = CGAffineTransform(scaleX: 2, y: 2)
        sw.onTintColor = AppColors.ACCENT_PURPLE
        sw.tintColor = AppColors.ACCENT_PURPLE
        sw.thumbTintColor = AppColors.WHITE_GRAY
        sw.backgroundColor = AppColors.ACCENT_PURPLE
        sw.layer.cornerRadius = 16
        sw.clipsToBounds = true
        sw.isOn = true
        sw.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        return sw
    }()
    
    @objc func switchChanged(mySwitch: UISwitch) {
        setUK = mySwitch.isOn
        // Do something
    }
    
    let soundButton1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "sound_icon"), for: .normal)
        button.addTarget(self, action: #selector(handleSound1), for: .touchUpInside)
        return button
    }()
    
    
    let usLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "US", attributes: [NSAttributedString.Key.font: AppFonts.NUMBER_FONT!, .foregroundColor: AppColors.ACCENT_PURPLE]))
        label.attributedText = attributedString
        label.textAlignment = NSTextAlignment.center
        //label.backgroundColor = UIColor.lightGray
        return label
    }()
    
    
    fileprivate let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.font = UIFont.systemFont(ofSize: 48)
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
        tf.tag = 1
        tf.textAlignment = .center
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.font = UIFont.systemFont(ofSize: 36)
        tf.placeholder = "Translate..."
        tf.layer.borderWidth = 3
        tf.layer.cornerRadius = 10
        tf.layer.borderColor = AppColors.ACCENT_PURPLE.cgColor
        tf.autocorrectionType = UITextAutocorrectionType.no
        return tf
    }()
    

    
    fileprivate let tempTF: UITextField = {
        let tf = UITextField()
        tf.tag = 2
        tf.placeholder = ""
        return tf
    }()
    
    fileprivate let okButton: UIButton = {
        let button = BounceButton()
        button.setTitle("Ok", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 60)
        button.backgroundColor = AppColors.ACCENT_PURPLE
        button.layer.cornerRadius = 100
        button.addTarget(self, action: #selector(handleOk), for: .touchUpInside)
        return button
    }()
    
    fileprivate let nextButton: UIButton = {
        let button = BounceButton()
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 60)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = AppColors.ACCENT_PURPLE
        button.layer.cornerRadius = 100
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    fileprivate let hintButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hint", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(AppColors.ACCENT_PURPLE, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleHint), for: .touchUpInside)
        return button
    }()
    
    
    
    
    
    
    
    
    
    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        
        view.backgroundColor = UIColor.gray
        
        shuffledQuestions = questions.shuffled()
        hideKeyboardWhenTappedAround()
        setupView()
        
        
        
        
        
        /*
        let responseUtterance = AVSpeechUtterance(string: "Hey human. It's me, the world")
        responseUtterance.pitchMultiplier = 0.75
        responseUtterance.rate = 0.45
        mySynthesizer.speak(responseUtterance)*/
        answerTF.delegate = self
        tempTF.delegate = self
        
        answerTF.becomeFirstResponder()
    }
    
    @objc func updateTimer() {
        time += 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    // MARK: - UITextFieldDelegate functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
        case 1:
            print("case1")
            if answerTF.text?.uppercased() == currentQuestion.english.uppercased() {
                print("case11")
                answerTF.layer.borderColor = AppColors.BORDER_GREEN.cgColor
                answeredFirst = true
                handleSound(text: answerTF.text!)
                //answerTF.resignFirstResponder()
                answerTF.resignFirstResponder()
                nextButton.isSelected = true
                
                if (currentNumber + 1 >= questions.count) {
                    self.timer.invalidate()
                    showMessage("Well done!", withTitle: "Congratulations!")
                    if (usedHints == 0) && (!gotPrize) {
                        gotPrize = !gotPrize
                        createParticles()
                        Sound.play(file: "bravo.mp3")
                    }
                }
            }
            else {
                answerTF.layer.borderColor = AppColors.BORDER_RED.cgColor
                answerTF.becomeFirstResponder()
            }
        case 2:
            print("case 2")
            setNextQuestion()
        default:
            print("defult")
        }
        
        //print("test textField.tag: \(textField.tag)")
        //textField.resignFirstResponder()
        //checkAnswer()
        return true
    }
    
    
    
    func checkAnswer() {
        
        
        if (currentQuestion.english.uppercased() == answerTF.text?.uppercased()) {
            answerTF.layer.borderColor = AppColors.BORDER_GREEN.cgColor
            answeredFirst = true
            nextButton.alpha = 1
            //handleSoundUK()
        } else {
            answerTF.layer.borderColor = AppColors.BORDER_RED.cgColor
            answerTF.becomeFirstResponder()
        }
    }

    
    fileprivate func setupView() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(numberLabel)
        numberLabel.setAnchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 200, height: 60)
        
        
//        view.addSubview(soundButtonUK)
//        soundButtonUK.setAnchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        
        view.addSubview(ukLabel)
        ukLabel.setAnchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, width: 80, height: 60)
        //ukLabel.centerYAnchor.constraint(equalTo: soundButtonUK.centerYAnchor).isActive = true
        
        view.addSubview(switchButton)
        switchButton.setAnchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: ukLabel.leadingAnchor, paddingTop: 38, paddingLeft: 0, paddingBottom: 0, paddingRight: 30)
        
//        view.addSubview(soundButtonUS)
//        soundButtonUS.setAnchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: switchButton.leadingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 40, width: 100, height: 100)
        
        view.addSubview(usLabel)
        usLabel.setAnchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: switchButton.leadingAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 26, width: 80, height: 60)
        //usLabel.centerYAnchor.constraint(equalTo: soundButtonUS.centerYAnchor).isActive = true
        
        
        
        
        
        view.addSubview(questionLabel)
        questionLabel.setAnchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 100, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 140)
        
        view.addSubview(answerTF)
        //answerTF.setAnchor(top: questionLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 70)
        
        let stackView = UIStackView(arrangedSubviews: [answerTF])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        view.addSubview(stackView)
        stackView.setAnchor(top: questionLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 70)
        
        

        

        view.addSubview(soundButton1)
        soundButton1.setAnchor(top: stackView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 70, height: 70)
        soundButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true


        numberLabel.text = "1/\(questions.count)"
        
        let buttonsStackView = UIStackView(arrangedSubviews: [okButton, nextButton])
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 140
        view.addSubview(buttonsStackView)
        buttonsStackView.setAnchor(width: 540, height: 200)
        buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150).isActive = true
        
        // set first
        questionLabel.text = shuffledQuestions[0].swedish
        currentQuestion = shuffledQuestions[0]
        nextButton.isEnabled = false
        nextButton.alpha = 0.5
        
        view.addSubview(hintButton)
        hintButton.setAnchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 80, paddingRight: 20, width: 100, height: 60)
        
        
        view.addSubview(missedLabel)
        missedLabel.setAnchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 80, paddingRight: 0, width: 250, height: 60)
        
        view.addSubview(secondsLabel)
        secondsLabel.setAnchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 60)
        secondsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(tempTF)
        tempTF.setAnchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 1, height: 1)
        
    }
    
    func handleSound(text: String) {
        //let mySynthesizer = AVSpeechSynthesizer()
        let helloUtterance = AVSpeechUtterance(string: text)
        helloUtterance.voice = AVSpeechSynthesisVoice(language: setUK ? "en-GB" : "en-US")
        helloUtterance.pitchMultiplier = 1.25
        helloUtterance.rate = 0.4
        mySynthesizer.speak(helloUtterance)
    }
    
    @objc func handleSound1() {
        handleSound(text: answerTF.text ?? "")
    }

    
    @objc fileprivate func handleSoundUK(text: String) {
        //let mySynthesizer = AVSpeechSynthesizer()
        let helloUtterance = AVSpeechUtterance(string: text)
        helloUtterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        helloUtterance.pitchMultiplier = 1.25
        helloUtterance.rate = 0.4
        mySynthesizer.speak(helloUtterance)
    }
    
    @objc fileprivate func handleSoundUS(text: String) {
        //let mySynthesizer = AVSpeechSynthesizer()
        let helloUtterance = AVSpeechUtterance(string: text)
        helloUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        helloUtterance.pitchMultiplier = 1.25
        helloUtterance.rate = 0.4
        mySynthesizer.speak(helloUtterance)
    }
    
    @objc fileprivate func handleOk() {
        //checkAnswer()
    }
    
    @objc fileprivate func handleNext() {
        
        setNextQuestion()
        
    }
    
    
    
    func setNextQuestion() {
        if (currentNumber < questions.count - 1) {
            print("currentNumber: \(currentNumber)")
            print("questions.count: \(questions.count)")
            currentNumber += 1
            questionLabel.text = shuffledQuestions[currentNumber].swedish
            currentQuestion = shuffledQuestions[currentNumber]
            
            questionLabel.textColor = AppColors.ACCENT_PURPLE
            answerTF.layer.borderColor = AppColors.ACCENT_PURPLE.cgColor

        
            answeredFirst = false

            
            answerTF.becomeFirstResponder()
            
            answerTF.text = ""

            
        } else {
            showMessage("There are no more questions!", withTitle: "Try again!")
        }
        
    }
    
    @objc func handleHint() {
        usedHints += 1
        showMessage(nil, withTitle: "\(currentQuestion.english)")
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        print("didUpdateFocus")
    }
    
    public func createParticles() {
        let view = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        view.contentMode = UIView.ContentMode.scaleAspectFill
        //view.image = UIImage(named: "landscape")
        self.view.addSubview(view)
        let cloud = CAEmitterLayer()
        cloud.emitterPosition = CGPoint(x: view.center.x, y: -50)
        cloud.emitterShape = CAEmitterLayerEmitterShape.line
        cloud.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        let flake = makeEmitterCell()
        cloud.emitterCells = [flake]
        view.layer.addSublayer(cloud)
    }
    
    func makeEmitterCell() -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.contentsScale = 1.5
        cell.birthRate = 4
        cell.lifetime = 50.0
        cell.velocity = 50
        cell.emissionLongitude = CGFloat.pi
        cell.emissionRange = CGFloat.pi / 4
        cell.spin = 0.5
        cell.spinRange = 1.2
        cell.scaleRange = -0.05
        cell.contents = UIImage(named: "prize")?.cgImage
        return cell
    }
}


