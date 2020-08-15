//
//  LearnController.swift
//  EmiApp
//
//  Created by Sebastian Strus on 2019-04-07.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//



import UIKit
import AVFoundation
import SwiftySound

import UIKit

class IrregularVerbsVC: UIViewController, UITextFieldDelegate {

    
    var questions: [LongestQuestion]!
    var gotPrize = false
    var timer = Timer()
    let mySynthesizer = AVSpeechSynthesizer()
    var hintAvailable = true
    var hintsLines: [String] = []
    var time: Int = 0 {
        didSet {
            //secondsLabel.text = "\(seconds)"
            let minutes = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            secondsLabel.text = String(format:"%02i:%02i", minutes, seconds)
            
        }
    }
    
    
    var shuffledQuestions: [LongestQuestion]!
    
    var setUK: Bool = true
    
    var usedHints: Int = 0 {
        didSet {
            missedLabel.text = "Hints: \(usedHints)"
        }
    }
    
    
    var answeredFirst: Bool = false {
        didSet {
            if (answeredSecond && answeredThird) {
                nextButton.isEnabled = answeredFirst ? true : false
                nextButton.alpha = answeredFirst ? 1 : 0.5
            }
        }
    }
    
    var answeredSecond: Bool = false {
        didSet {
            if (answeredFirst && answeredThird) {
                nextButton.isEnabled = answeredSecond ? true : false
                nextButton.alpha = answeredFirst ? 1 : 0.5
            }
        }
    }
    
    var answeredThird: Bool = false {
        didSet {
            if (answeredFirst && answeredSecond) {
                if answeredThird {
                    nextButton.isEnabled = true
                    nextButton.alpha = 1
                    
                    let exampleText = currentQuestion.example
                    let splitExampleText:[String] = exampleText.components(separatedBy: ". ")
                    var newExample = ""
                    for row in splitExampleText {
                        newExample += row
                        newExample += ".\n"
                    }
                    
                    exampleTV.text = String(newExample.dropLast().dropLast())
                    tempTF.becomeFirstResponder()
                }
                else {
                    nextButton.isEnabled = false
                    nextButton.alpha = 0.5
                }
            }

        }
    }
    
    var currentNumber = 0 {
        didSet {
            numberLabel.text = "\(currentNumber + 1)/\(questions.count)"
        }
    }
    
    var currentQuestion: LongestQuestion!
    
    
    
    
    
    
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
    
    let soundButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "sound_icon"), for: .normal)
        button.addTarget(self, action: #selector(handleSound2), for: .touchUpInside)
        return button
    }()
    
    let soundButton3: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "sound_icon"), for: .normal)
        button.addTarget(self, action: #selector(handleSound3), for: .touchUpInside)
        return button
    }()
    
    let usLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "US", attributes: [NSAttributedString.Key.font: AppFonts.NUMBER_FONT!, .foregroundColor: AppColors.ACCENT_PURPLE]))
        label.attributedText = attributedString
        label.textAlignment = NSTextAlignment.center
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
        return label
    }()
    
    fileprivate let hintLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = AppColors.BORDER_RED
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    fileprivate let answerTF: UITextField = {
        let tf = UITextField()
        tf.tag = 1
        tf.textAlignment = .center
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.font = UIFont.systemFont(ofSize: 36)
        tf.placeholder = "infinitive"
        tf.layer.borderWidth = 3
        tf.layer.cornerRadius = 10
        tf.layer.borderColor = AppColors.ACCENT_PURPLE.cgColor
        tf.autocorrectionType = UITextAutocorrectionType.no
        return tf
    }()
    
    fileprivate let answerTF2: UITextField = {
        let tf = UITextField()
        tf.tag = 2
        tf.textAlignment = .center
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.font = UIFont.systemFont(ofSize: 36)
        tf.placeholder = "past simple"
        tf.layer.borderWidth = 3
        tf.layer.cornerRadius = 10
        tf.layer.borderColor = AppColors.ACCENT_PURPLE.cgColor
        tf.autocorrectionType = UITextAutocorrectionType.no
        return tf
    }()
    
    fileprivate let answerTF3: UITextField = {
        let tf = UITextField()
        tf.tag = 3
        tf.textAlignment = .center
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.font = UIFont.systemFont(ofSize: 36)
        tf.placeholder = "past participle"
        tf.layer.borderWidth = 3
        tf.layer.cornerRadius = 10
        tf.layer.borderColor = AppColors.ACCENT_PURPLE.cgColor
        tf.autocorrectionType = UITextAutocorrectionType.no
        return tf
    }()
    
    fileprivate let tempTF: UITextField = {
        let tf = UITextField()
        tf.tag = 4
        tf.placeholder = ""
        return tf
    }()
    
    
    fileprivate let exampleTV: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 30)
        tv.textAlignment = .center
        return tv
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
        answerTF2.delegate = self
        answerTF3.delegate = self
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
            if answerTF.text?.uppercased() == currentQuestion.english1.uppercased() {
                answerTF.layer.borderColor = AppColors.BORDER_GREEN.cgColor
                answeredFirst = true
                handleSound(text: answerTF.text!)
                answerTF2.becomeFirstResponder()
                
                if (currentNumber + 1 >= questions.count) && answeredSecond && answeredSecond {
                    self.timer.invalidate()
                    showMessage("Well done!", withTitle: "Congratulations!")
                    for line in hintsLines {
                        print(line)
                    }
                }
            }
            else {
                answerTF.layer.borderColor = AppColors.BORDER_RED.cgColor
                answerTF.becomeFirstResponder()
            }
        case 2:
            if answerTF2.text?.uppercased() == currentQuestion.english2.uppercased() {
                answerTF2.layer.borderColor = AppColors.BORDER_GREEN.cgColor
                answeredSecond = true
                handleSound(text: answerTF2.text!)
                //answerTF2.resignFirstResponder()
                answerTF3.becomeFirstResponder()
                
                if (currentNumber + 1 >= questions.count) && answeredFirst && answeredThird {
                    self.timer.invalidate()
                    showMessage("Well done!", withTitle: "Congratulations!")
                    for line in hintsLines {
                        print(line)
                    }
                }
            }
            else {
                answerTF2.layer.borderColor = AppColors.BORDER_RED.cgColor
                answerTF2.becomeFirstResponder()
            }
        case 3:
            if answerTF3.text?.uppercased() == currentQuestion.english3.uppercased() {
                answerTF3.layer.borderColor = AppColors.BORDER_GREEN.cgColor
                answeredThird = true
                handleSound(text: answerTF3.text!)
                answerTF3.resignFirstResponder()
                nextButton.isSelected = true
                //nextButton.stat = UIControl.State.focused
                
                if (currentNumber + 1 >= questions.count) && answeredFirst && answeredSecond {
                    self.timer.invalidate()//\(Int(time/60)):\(time - Int(time/60)*60)
                    showMessage("\nYour time: \(secondsLabel.text!),\nYou used \(usedHints) \( usedHints == 1 ? "hint" : "hints").\(usedHints == 0 ? "\nWell done!" : "")", withTitle: "Congratulations!")
                    print("Used hints:")
                    for line in hintsLines {
                        print(line)
                    }
                    print("\n\n")

                    if (usedHints == 0) && (!gotPrize) {
                        gotPrize = !gotPrize
                        createParticles()
                        Sound.play(file: "bravo.mp3")
                    }
                }
                
            }
            else {
                answerTF3.layer.borderColor = AppColors.BORDER_RED.cgColor
                answerTF3.becomeFirstResponder()
            }
        case 4:
            handleNext()
        default:
            print("defult")
        }
        
        return true
    }
    
    
    
    func checkAnswer() {
        
        
        if (currentQuestion.english1.uppercased() == answerTF.text?.uppercased()) {
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
        
        view.addSubview(hintLabel)
        hintLabel.setAnchor(top: questionLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 40)
        
        //view.addSubview(answerTF)
        //answerTF.setAnchor(top: questionLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 70)
        
        let stackView = UIStackView(arrangedSubviews: [answerTF, answerTF2, answerTF3])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        view.addSubview(stackView)
        stackView.setAnchor(top: questionLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 70, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 70)
        
        

        
        let soundStackView = UIStackView(arrangedSubviews: [soundButton1, soundButton2, soundButton3])
        soundStackView.axis = .horizontal
        soundStackView.alignment = .fill
        soundStackView.distribution = .equalSpacing
        view.addSubview(soundStackView)
        soundStackView.setAnchor(top: stackView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 200, paddingBottom: 0, paddingRight: 200, width: 0, height: 100)
        
        soundButton1.setAnchor(width: 70, height: 70)
        soundButton2.setAnchor(width: 70, height: 70)
        soundButton3.setAnchor(width: 70, height: 70)

        numberLabel.text = "1/\(questions.count)"
        
//        let buttonsStackView = UIStackView(arrangedSubviews: [okButton, nextButton])
//        buttonsStackView.axis = .horizontal
//        buttonsStackView.distribution = .fillEqually
//        buttonsStackView.spacing = 140
//
        
        view.addSubview(exampleTV)
        exampleTV.setAnchor(width: 1200, height: 300)
        
        exampleTV.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        exampleTV.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 160).isActive = true
        
        // set first
        questionLabel.text = shuffledQuestions[0].polish
        
        answerTF2.placeholder = "simple past (\(shuffledQuestions[0].english2.split(separator: "/").count))"
        answerTF3.placeholder = "past participle (\(shuffledQuestions[0].english3.split(separator: "/").count))"
        
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
    @objc func handleSound2() {
        handleSound(text: answerTF2.text ?? "")

    }
    @objc func handleSound3() {
        handleSound(text: answerTF3.text ?? "")

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
        if (currentNumber < questions.count - 1) {
            hintLabel.text = ""
            exampleTV.text = ""
            hintAvailable = true
            currentNumber += 1
            questionLabel.text = shuffledQuestions[currentNumber].polish
            currentQuestion = shuffledQuestions[currentNumber]
            
            questionLabel.textColor = AppColors.ACCENT_PURPLE
            answerTF.layer.borderColor = AppColors.ACCENT_PURPLE.cgColor
            answerTF2.layer.borderColor = AppColors.ACCENT_PURPLE.cgColor
            answerTF3.layer.borderColor = AppColors.ACCENT_PURPLE.cgColor
            
            answeredFirst = false
            answeredSecond = false
            answeredThird = false
            
            answerTF.becomeFirstResponder()
            
            answerTF.text = ""
            answerTF2.text = ""
            answerTF3.text = ""
            
            answerTF2.placeholder = "simple past (\(currentQuestion.english2.split(separator: "/").count))"
            answerTF3.placeholder = "past participle (\(currentQuestion.english3.split(separator: "/").count))"
            
            
        } else {
            showMessage("There are no more questions!", withTitle: "Try again!")
        }
        
    }
    
    @objc func handleHint() {
        if hintAvailable {
            usedHints += 1
            hintLabel.text = "\(currentQuestion.english1) \(currentQuestion.english2) \(currentQuestion.english3)"
            //showMessage(nil, withTitle: "\(currentQuestion.english1) \(currentQuestion.english2) \(currentQuestion.english3)")

            hintsLines.append("LongQuestion(polish: \"\(currentQuestion.polish)\", english1: \"\(currentQuestion.english1)\", english2: \"\(currentQuestion.english2)\", english3: \"\(currentQuestion.english3)\"),")
            hintsLines.append("LongQuestion(polish: \"\(currentQuestion.polish)\", english1: \"\(currentQuestion.english1)\", english2: \"\(currentQuestion.english2)\", english3: \"\(currentQuestion.english3)\"),")
            hintAvailable = false
        
        }
        
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


