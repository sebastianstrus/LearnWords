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
    
    var shuffledQuestions: [Question]!
    
    var setUK: Bool = true
    
    var usedHints: Int = 0 {
        didSet {
            missedLabel.text = "\(usedHints)"
        }
    }
    
    
    var answeredFirst: Bool = false {
        didSet {
            //if (answeredSecond && answeredThird) {
                nextButton.isEnabled = answeredFirst ? true : false
                nextButton.alpha = answeredFirst ? 1 : 0.5
            if answeredFirst {
                tempTF.becomeFirstResponder()
                
                let splitExampleText = currentQuestion.examples
                var newExample = ""
                
                if splitExampleText != nil {
                    for row in splitExampleText! {
                        newExample += row!
                        newExample += "\n"
                    }
                    
                    
                    if splitExampleText!.count > 0 {
                        example1Label.text = splitExampleText?[0]
                        example1Button.alpha = 1
                        copy1Button.alpha = 1
                    }
                    if splitExampleText!.count > 1 {
                        example2Label.text = splitExampleText?[1]
                        example2Button.alpha = 1
                        copy2Button.alpha = 1
                    }
                    if splitExampleText!.count > 2 {
                        example3Label.text = splitExampleText?[2]
                        example3Button.alpha = 1
                        copy3Button.alpha = 1
                    }
                    if splitExampleText!.count > 3 {
                        example4Label.text = splitExampleText?[3]
                        example4Button.alpha = 1
                        copy4Button.alpha = 1
                    }
                }
                
            }
            //}
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
        label.text = "\(0)"
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
        sw.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
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
    
    let soundButton1: BounceButton = {
        let button = BounceButton()
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
    
    
    
    fileprivate let copy1Button: BounceButton = {
        let button = BounceButton()
        button.setImage(UIImage(named: "copy_icon"), for: .normal)
        button.addTarget(self, action: #selector(handleCopy1), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    fileprivate let copy2Button: BounceButton = {
        let button = BounceButton()
        button.setImage(UIImage(named: "copy_icon"), for: .normal)
        button.addTarget(self, action: #selector(handleCopy2), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    fileprivate let copy3Button: BounceButton = {
        let button = BounceButton()
        button.setImage(UIImage(named: "copy_icon"), for: .normal)
        button.addTarget(self, action: #selector(handleCopy3), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    fileprivate let copy4Button: BounceButton = {
        let button = BounceButton()
        button.setImage(UIImage(named: "copy_icon"), for: .normal)
        button.addTarget(self, action: #selector(handleCopy4), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    
    fileprivate let example1Button: BounceButton = {
        let button = BounceButton()
        button.setImage(UIImage(named: "sound_icon"), for: .normal)
        button.addTarget(self, action: #selector(handleExample1Sound), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    fileprivate let example2Button: BounceButton = {
        let button = BounceButton()
        button.setImage(UIImage(named: "sound_icon"), for: .normal)
        button.addTarget(self, action: #selector(handleExample2Sound), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    fileprivate let example3Button: BounceButton = {
        let button = BounceButton()
        button.setImage(UIImage(named: "sound_icon"), for: .normal)
        button.addTarget(self, action: #selector(handleExample3Sound), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    fileprivate let example4Button: BounceButton = {
        let button = BounceButton()
        button.setImage(UIImage(named: "sound_icon"), for: .normal)
        button.addTarget(self, action: #selector(handleExample4Sound), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    
    
    fileprivate let example1Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = AppColors.ACCENT_PURPLE
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    fileprivate let example2Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = AppColors.ACCENT_PURPLE
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    fileprivate let example3Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = AppColors.ACCENT_PURPLE
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    fileprivate let example4Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = AppColors.ACCENT_PURPLE
        label.textAlignment = NSTextAlignment.left
        return label
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
    
    fileprivate let nextButton: BounceButton = {
        let button = BounceButton()
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = AppColors.ACCENT_PURPLE
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    fileprivate let hintButton: BounceButton = {
        let button = BounceButton()
        button.setTitle("Hint", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(AppColors.DARK_RED, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = AppColors.DARK_RED.cgColor
        button.layer.borderWidth =  1
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
            if answerTF.text?.uppercased().replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil) == currentQuestion.english.uppercased().replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil) {
                answerTF.layer.borderColor = AppColors.BORDER_GREEN.cgColor
                answeredFirst = true
                handleSound(text: answerTF.text!)
                //answerTF.resignFirstResponder()
                answerTF.resignFirstResponder()
                nextButton.isSelected = true
                
                if (currentNumber + 1 >= questions.count) {
                    self.timer.invalidate()
                    showMessage("Well done!", withTitle: "Congratulations!")
                    
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
                answerTF.layer.borderColor = AppColors.BORDER_RED.cgColor
                answerTF.becomeFirstResponder()
            }
        case 2:
            handleNext()
        default:
            print("defult")
        }
        
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

        view.addSubview(switchButton)
        switchButton.setAnchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: ukLabel.leadingAnchor, paddingTop: 38, paddingLeft: 0, paddingBottom: 0, paddingRight: 10)
        
        view.addSubview(usLabel)
        usLabel.setAnchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: switchButton.leadingAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 6, width: 80, height: 60)
        
        
        
        
        
        view.addSubview(questionLabel)
        questionLabel.setAnchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 100, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 140)
        
        view.addSubview(hintLabel)
        hintLabel.setAnchor(top: questionLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 40)
        
        view.addSubview(answerTF)
        //answerTF.setAnchor(top: questionLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 70)
        
        let stackView = UIStackView(arrangedSubviews: [answerTF])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        view.addSubview(stackView)
        stackView.setAnchor(top: questionLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 60, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 70)
        
        

        

        view.addSubview(soundButton1)
        soundButton1.setAnchor(top: stackView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 70, height: 70)
        soundButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true


        numberLabel.text = "1/\(questions.count)"
        

        
        
        
        
        view.addSubview(copy1Button)
        copy1Button.setAnchor(top: soundButton1.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 60, height: 60)
        
        view.addSubview(copy2Button)
        copy2Button.setAnchor(top: copy1Button.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 60, height: 60)
        
        view.addSubview(copy3Button)
        copy3Button.setAnchor(top: copy2Button.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 60, height: 60)
        
        view.addSubview(copy4Button)
        copy4Button.setAnchor(top: copy3Button.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 60, height: 60)
        
        
        view.addSubview(example1Button)
        example1Button.setAnchor(top: copy1Button.topAnchor, leading: copy1Button.trailingAnchor, bottom: nil, trailing: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 60, height: 60)
        
        view.addSubview(example2Button)
        example2Button.setAnchor(top: copy2Button.topAnchor, leading: copy2Button.trailingAnchor, bottom: nil, trailing: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 60, height: 60)
        
        view.addSubview(example3Button)
        example3Button.setAnchor(top: copy3Button.topAnchor, leading: copy3Button.trailingAnchor, bottom: nil, trailing: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 60, height: 60)
        
        view.addSubview(example4Button)
        example4Button.setAnchor(top: copy4Button.topAnchor, leading: copy4Button.trailingAnchor, bottom: nil, trailing: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 60, height: 60)
        
        
        view.addSubview(example1Label)
        example1Label.setAnchor(top: example1Button.topAnchor, leading: example1Button.trailingAnchor, bottom: example1Button.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 60)
        
        view.addSubview(example2Label)
        example2Label.setAnchor(top: example2Button.topAnchor, leading: example2Button.trailingAnchor, bottom: example2Button.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 60)
        
        view.addSubview(example3Label)
        example3Label.setAnchor(top: example3Button.topAnchor, leading: example3Button.trailingAnchor, bottom: example3Button.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 60)
        
        view.addSubview(example4Label)
        example4Label.setAnchor(top: example4Button.topAnchor, leading: example4Button.trailingAnchor, bottom: example4Button.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 60)
        
        
        
        
        
        // set first
        questionLabel.text = shuffledQuestions[0].polish
        currentQuestion = shuffledQuestions[0]
        nextButton.isEnabled = false
        nextButton.alpha = 0.5
        
        view.addSubview(hintButton)
        hintButton.setAnchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 90, paddingRight: 20, width: 80, height: 50)
        
        view.addSubview(nextButton)
        nextButton.setAnchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 90, paddingRight: 20, width: 80, height: 50)
        
        view.addSubview(missedLabel)
        missedLabel.setAnchor(top: nil, leading: hintButton.trailingAnchor, bottom: hintButton.bottomAnchor, trailing: nil, paddingTop: 0, paddingLeft: 4, paddingBottom: 0, paddingRight: 0, width: 60, height: 50)
        
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
    
    
    
    @objc func handleExample1Sound() {
        handleSound(text: example1Label.text ?? "")
    }
    @objc func handleExample2Sound() {
        handleSound(text: example2Label.text ?? "")
    }
    @objc func handleExample3Sound() {
        handleSound(text: example3Label.text ?? "")
    }
    @objc func handleExample4Sound() {
        handleSound(text: example4Label.text ?? "")
    }
    
    
    @objc func handleCopy1() {
        UIPasteboard.general.string = example1Label.text
    }
    @objc func handleCopy2() {
        UIPasteboard.general.string = example2Label.text
    }
    @objc func handleCopy3() {
        UIPasteboard.general.string = example3Label.text
    }
    @objc func handleCopy4() {
        UIPasteboard.general.string = example4Label.text
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
    
//    @objc fileprivate func handleNext() {
//
//        setNextQuestion()
//
//    }
    
    
    
    @objc fileprivate func handleNext() {
        if (currentNumber < questions.count - 1) {
            hintLabel.text = ""
            hintAvailable = true
            currentNumber += 1
            questionLabel.text = shuffledQuestions[currentNumber].polish
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
        if hintAvailable {
            usedHints += 1
            hintLabel.text = currentQuestion.english
            print("Question(polish: \"\(currentQuestion.polish)\", english: \"\(currentQuestion.english)\"),")
            hintsLines.append("Question(polish: \"\(currentQuestion.polish)\", english: \"\(currentQuestion.english)\"),")
            hintAvailable = false
        }

        answerTF.becomeFirstResponder()
        
        
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


