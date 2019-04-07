//
//  Data.swift
//  EmiApp
//
//  Created by Sebastian Strus on 2019-04-07.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import Foundation


class Data {
    
    class func getWeatherWords() -> [Question] {
        return [Question(swedish: "Hur är vädret?", english: "How is the weather?"),
                Question(swedish: "Det är varmt", english: "It is hot"),
                Question(swedish: "Det är kallt", english: "It is cold"),
                Question(swedish: "Det är soligt", english: "It is sunny"),
                Question(swedish: "Den är molnigt", english: "It is cloudy"),
                Question(swedish: "Det är fuktigt", english: "It is humid"),
                Question(swedish: "Det regnar", english: "It is raining"),
                Question(swedish: "Det snöar", english: "It is snowing"),
                Question(swedish: "Det är blåsigt", english: "It is windy"),
                Question(swedish: "Det är otäckt", english: "It is nasty"),
                Question(swedish: "Vilken temperatur är det?", english: "What is the temperature?"),
                Question(swedish: "Det är 24 grader", english: "It is 24 degrees"),
                Question(swedish: "säsong", english: "season"),
                Question(swedish: "vinter", english: "winter"),
                Question(swedish: "sommar", english: "summer"),
                Question(swedish: "vår", english: "spring"),
                Question(swedish: "höst", english: "autumn"),
                Question(swedish: "alltid", english: "always"),
                Question(swedish: "aldrig", english: "never"),
                Question(swedish: "ofta", english: "often"),
                Question(swedish: "sällan", english: "seldom"),
                Question(swedish: "ibland", english: "sometimes"),
                Question(swedish: "vanligtvis", english: "usually"),
        ]
    }
    
    class func getUsefulWords() -> [Question] {
        return [Question(swedish: "Hur är vädret?", english: "How is the weather?"),
                Question(swedish: "Det är varmt", english: "It is hot"),
                Question(swedish: "Det är kallt", english: "It is cold"),
                Question(swedish: "Det är soligt", english: "It is sunny"),
                Question(swedish: "Den är molnigt", english: "It is cloudy"),
                Question(swedish: "Det är fuktigt", english: "It is humid"),
                Question(swedish: "Det regnar", english: "It is raining"),
                Question(swedish: "Det snöar", english: "It is snowing"),
                Question(swedish: "Det är blåsigt", english: "It is windy"),
                Question(swedish: "Det är otäckt", english: "It is nasty"),
                Question(swedish: "Vilken temperatur är det?", english: "What is the temperature?"),
                Question(swedish: "Det är 24 grader", english: "It is 24 degrees"),
                Question(swedish: "säsong", english: "season"),
                Question(swedish: "vinter", english: "winter"),
                Question(swedish: "sommar", english: "summer"),
                Question(swedish: "vår", english: "spring"),
                Question(swedish: "höst", english: "autumn"),
                Question(swedish: "alltid", english: "always"),
                Question(swedish: "aldrig", english: "never"),
                Question(swedish: "ofta", english: "often"),
                Question(swedish: "sällan", english: "seldom"),
                Question(swedish: "ibland", english: "sometimes"),
                Question(swedish: "vanligtvis", english: "usually"),
        ]
    }
}
//  Question(swedish: "AAA", english: "BBB"),
