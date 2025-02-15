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
    
    
    
    let sentences: [String] = [
        "Det var en gång, en vacker solig dag, en liten flicka som hette Rödluvan.",
        "Hon lekte utomhus i sin trädgård.",
        "Hon kallades Rödluvan för hon hade en röd luva på sig vart hon än gick.",
        "Just när hon lekte som bäst så ropade hennes mamma: Rödluvan, kan du vara snäll och gå till mormor med den här korgen med mat?",
        "Mormor ligger sjuk i sin säng.",
        "Ja, det gör jag gärna mamma – sa Rödluvan.",
        
        /*"Men gå inte genom skogen och prata inte med främlingar" sa hennes mamma till henne. Så Rödluvan skuttade iväg i sin röda luva och började sin resa till sin mormors hus.

        Det var sannerligen en vacker dag och på vägen stannade Rödluvan för att plocka lite blommor i en glänta och lyssna på fåglarna. Så när hon till sist kom till skogsbrynet började det redan mörkna och rödluvan bestämde sig för att ta en genväg genom skogen så att hon inte skulle komma försent till mormors hus. Rödluvan började gå på stigen genom skogen och när hon kom längre in blev träden större och större och det blev mörkare och mörkare. Hon hörde löv prassla till bredvid henne och plötsligt hoppade en stor varg, med en lång och spetsig nos, ut bakom en buske.

        Han hälsade vänligt på Rödluvan och frågade henne vart hon skulle. "Hej lilla flicka," sa Vargen. "Vad heter du?" Fast hennes mamma hade sagt till henne att inte prata med främlingar svarade hon honom hövligt. "Alla kallar mig Rödluvan." "Nåväl, Rödluvan, vart ska du gå en sådan här vacker dag?" frågade Vargen. "Jag är på väg till min mormors hus på den andra sidan skogen. Hon mår inte så bra och jag har med mig en korg med mat," svarade Rödluvan. "Mmm, maten i korgen ser väldigt god ut. Då är det kanske bäst att du skyndar dig, du vill ju inte låta mormor vänta," sa Vargen med rackartyg i ögonen.

        Rödluvan log och gick snabbt iväg. Vargen såg henne försvinna nerför den slingrande stigen och sa till sig själv. "Jag har en listig plan och jag måste vara snabb så jag kommer till mormors hus så fort som möjligt." Så sprang Vargen iväg in i skogen i en väldig fart.

        En liten stund senare kom Vargen till mormors hus. Han smög fram till stugans dörr och knackade tre gånger. Inifrån hördes mormors röst, "Vem är det som knackar på min dörr?" Vargen förställde sin röst och ropade tillbaks, "Det är bara jag, Rödluvan, som kommit för att besöka dig mormor." "Nå, öppna låset och kom in kära du", svarade mormor.

        Så fort mormor såg att det var Vargen hoppade hon upp från sängen och försökte fly. Han jagade henne runt rummet och när hon skyndade sig för att undkomma, tappade hon sin nattmössa på golvet men lyckades gömma sig i linneskåpet. Med bara en liten stund tillgodo innan Rödluvan kom fram till mormors stuga så tog vargen snabbt på sig mormors nattmössa och kröp ner i mormors säng.

        Så småningom kom Rödluvan fram till mormors hus och hon knackade på dörren. En röst sa, "Rödluvan, är det du? Kom in kära du." Så, hon öppnade dörren och gick in. Mormor låg i sängen, men när Rödluvan närmade sig henne, kunde hon se att hon var riktigt dålig. Hon tittade närmre. Något var inte rätt.
        "Mormor, vilka stora öron du har," sa Rödluvan.
        "Det är för att jag ska kunna höra dig bättre," sa Vargen. "Men mormor, vilka stora ögon du har."
        "Det är för att jag ska kunna se dig bättre," sa Vargen.
        "Men mormor, vilken stor mun du har."
        "Det är för att jag ska kunna äta upp dig," sa Vargen och hoppade upp ur sängen och jagade Rödluvan runt rummet.

        I närheten av mormors stuga stod en skogshuggare och högg träd. Han hörde Rödluvan skrika och sprang för att rädda henne. Han jagade iväg Vargen med sin yxa och Vargen syntes aldrig mera till.

        Rödluvan var i säkerhet men plötsligt kom hon att tänka på sin mormor. "Var är mormor" skrek hon. Hon sprang till stugan och där hittade hon mormor som gömde sig i linneskåpet, trygg och frisk. Aldrig mer störde Vargen dem och de levde lyckliga i alla sina dagar.*/
    ]
    
    

    
    
    
    
    
    
    

    
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
    



    
    
    
    
    
    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        hideKeyboardWhenTappedAround()
        setupView()
        
        
        
        
        
        /*
        let responseUtterance = AVSpeechUtterance(string: "Hey human. It's me, the world")
        responseUtterance.pitchMultiplier = 0.75
        responseUtterance.rate = 0.45
        mySynthesizer.speak(responseUtterance)*/
//        answerTF.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    // MARK: - UITextFieldDelegate functions
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print("test")
//        textField.resignFirstResponder()
//        checkAnswer()
//        return true
//    }

    
    fileprivate func setupView() {
        view.backgroundColor = UIColor.white
        
//        view.addSubview(numberLabel)
        
//        numberLabel.setAnchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 100, height: 30)
        
        view.addSubview(soundButtonUK)
        soundButtonUK.setAnchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
//        view.addSubview(ukLabel)
//        ukLabel.setAnchor(top: nil, leading: nil, bottom: nil, trailing: soundButtonUK.leadingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: -4, width: 40, height: 30)
//        ukLabel.centerYAnchor.constraint(equalTo: soundButtonUK.centerYAnchor).isActive = true
        
//        view.addSubview(soundButtonUS)
//        soundButtonUS.setAnchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: ukLabel.leadingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 50, height: 50)
//        
//        view.addSubview(usLabel)
//        usLabel.setAnchor(top: nil, leading: nil, bottom: nil, trailing: soundButtonUS.leadingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: -4, width: 40, height: 30)
//        usLabel.centerYAnchor.constraint(equalTo: soundButtonUS.centerYAnchor).isActive = true
//        
//        
        
        
        
        view.addSubview(questionLabel)
        
        
        questionLabel.setAnchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 60, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 70)
        
//        view.addSubview(answerTF)
//        
//
//        answerTF.setAnchor(top: questionLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 70)
//        
//        numberLabel.text = "1/\(questions.count)"
//        
//        let buttonsStackView = UIStackView(arrangedSubviews: [okButton, nextButton])
//        buttonsStackView.axis = .horizontal
//        buttonsStackView.distribution = .fillEqually
//        buttonsStackView.spacing = 10
//        view.addSubview(buttonsStackView)
//        buttonsStackView.setAnchor(top: answerTF.bottomAnchor, leading: answerTF.leadingAnchor, bottom: nil, trailing: answerTF.trailingAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
//        
//        // set first
//        questionLabel.text = shuffledQuestions[0].swedish
//        currentQuestion = shuffledQuestions[0]
//        nextButton.isEnabled = false
//        nextButton.alpha = 0.5
//        
//        view.addSubview(hintButton)
//        hintButton.setAnchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 50, height: 30)
//        

        
    }
    
    @objc fileprivate func handleSoundUK() {
        let mySynthesizer = AVSpeechSynthesizer()
        let helloUtterance = AVSpeechUtterance(string: answerTF.text!)
        helloUtterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        helloUtterance.pitchMultiplier = 1.25
        helloUtterance.rate = 0.5
        mySynthesizer.speak(helloUtterance)
    }
    

}


