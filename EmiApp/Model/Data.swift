//
//  Data.swift
//  EmiApp
//
//  Created by Sebastian Strus on 2019-04-07.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import Foundation


class Data {
    
    
    class func getLongestQuestions() -> [LongestQuestion] {
        return [
            
            
        ]
    }
    
    class func daysOfTheWeek() -> [Question] {
        return [
            
        ]
    }
    
    
    class func getMonthsAndSeasons() -> [Question] {
        return [
            Question(polish: "styczeń", english: "der Januar"),
            Question(polish: "luty", english: "der Februar"),
            Question(polish: "marzec", english: "der März"),
            Question(polish: "kwiecień", english: "der April"),
            Question(polish: "maj", english: "der Mai"),
            Question(polish: "czerwiec", english: "der Juni"),
            Question(polish: "lipiec", english: "der Juli"),
            Question(polish: "sierpień", english: "der August"),
            Question(polish: "wrzesień", english: "der September"),
            Question(polish: "październik", english: "der Oktober"),
            Question(polish: "listopad", english: "der November"),
            Question(polish: "grudzień", english: "der Dezember"),
            Question(polish: "w grudniu", english: "im Dezember"),
            
            Question(polish: "wiosna", english: "der Frühling"),
            Question(polish: "lato", english: "der Sommer"),
            Question(polish: "jesień", english: "der Herbst"),
            Question(polish: "zima", english: "der Winter"),
            
            Question(polish: "wiosną", english: "im Frühling"),
            Question(polish: "latem", english: "im Sommer"),
            Question(polish: "jesienią", english: "im Herbst"),
            Question(polish: "zimą", english: "im Winter"),
            
        ]
    }
    /*
     Zeitangaben – określenia czasu
     Der Monat – miesiąc
     Anfang des Monats – na początku miesiąca
     Das Jahr – rok
     Die Woche – tydzień
     Ende der Woche – koniec tygodnia
     Der Anfang – początek
     Das Ende – koniec
     
     */
    
    // https://www.ang.pl/slownictwo/zawody-po-angielsku
    class func getTime() -> [Question] {
        return [
            Question(polish: "określenia czasu", english: "Zeitangaben"),
            Question(polish: "miesiąc", english: "Der Monat"),
            Question(polish: "na początku miesiąca", english: "Anfang des Monats"),
            Question(polish: "rok", english: "Das Jahr"),
            Question(polish: "tydzień", english: "Die Woche"),
            Question(polish: "koniec tygodnia", english: "Ende der Woche"),
            Question(polish: "początek", english: "Der Anfang"),
            Question(polish: "Das Ende", english: "koniec"),
            
            Question(polish: "rano", english: "am Montag"),
            Question(polish: "do południa", english: "am Vormittag"),
            Question(polish: "po południu", english: "am Nachmittag"),
            Question(polish: "wieczorem", english: "am Abend"),
            Question(polish: "w nocy", english: "in der Nacht"),
            Question(polish: "o północy", english: "um Mitternacht"),
            Question(polish: "w ciagu dnia", english: "am Tag "),
            Question(polish: "nocami", english: "nachts"),
            Question(polish: "dzisiaj", english: "heute"),
            Question(polish: "wczoraj", english: "gestern"),
            Question(polish: "jutro", english: "morgen"),
            Question(polish: "przedwczoraj", english: "vorgestern"),
            Question(polish: "pojutrze", english: "übermorgen"),
            Question(polish: "za pięć dni", english: "in fünf Tagen"),
            Question(polish: "w ostatnim tygodniu", english: "letzte Woche"),
            Question(polish: "w ten piątek", english: "diesel Freitag"),
            Question(polish: "w następnym miesiącu", english: "nächsten Monat"),
            Question(polish: "od poniedziałku do piątku", english: "von Montag bis Freitag"),
            Question(polish: "von acht bis zehn Uhr", english: "od ósmej do dziesiątej"),
            Question(polish: "niedawno", english: "kürzlich"),
            Question(polish: "natychmiast", english: "sofort"),
            Question(polish: "wkrótce", english: "bald"),
            Question(polish: "dziesięć minut za późno", english: "zehn Minuten zu spät"),
            Question(polish: "od kiedy?", english: "ab wann?"),
            Question(polish: "od godziny drugiej", english: "Ab zwei Uhr"),
            Question(polish: "od poniedziałku", english: "Ab Montag"),
            Question(polish: "jak często?", english: "Wie oft?"),
            Question(polish: "prawie zawsze", english: "fast immer"),
            Question(polish: "często", english: "oft"),
            Question(polish: "czasami", english: "manchmal"),
            Question(polish: "rzadko", english: "selten"),
            Question(polish: "nigdy", english: "nie"),
            Question(polish: "O której godzinie?", english: "Um wieviel Uhr?"),
            Question(polish: "Która jest godzina?", english: "Wie spät ist es? "),
            Question(polish: "Jest...", english: "Es ist…"),
            Question(polish: "o dziesiątej", english: "um zehn Uhr"),
            Question(polish: "za dziesięć trzecia", english: "um zehn vor drei "),
            Question(polish: "dziesięć po trzeciej", english: "um zehn nach drei"),
            Question(polish: "punktualnie o szóstej", english: "Punkt sechs"),
            Question(polish: "około godziny jedenastej", english: "gegen elf Uhr"),
            Question(polish: "za kwadrans", english: "in einer Viertelstunde"),
            Question(polish: "wpół", english: "halb"),
            Question(polish: "w przyszłości", english: "in der Zukunft"),
            Question(polish: "od teraz", english: "von nun an"),
            Question(polish: "dawno temu", english: "vor langer Zeit"),
            Question(polish: "AAAAAAAAAA", english: "BBBBBBBBBB"),
            Question(polish: "AAAAAAAAAA", english: "BBBBBBBBBB"),
            Question(polish: "AAAAAAAAAA", english: "BBBBBBBBBB"),
            Question(polish: "AAAAAAAAAA", english: "BBBBBBBBBB"),
            Question(polish: "AAAAAAAAAA", english: "BBBBBBBBBB"),
            Question(polish: "AAAAAAAAAA", english: "BBBBBBBBBB"),
            Question(polish: "AAAAAAAAAA", english: "BBBBBBBBBB"),
            Question(polish: "AAAAAAAAAA", english: "BBBBBBBBBB"),
            Question(polish: "AAAAAAAAAA", english: "BBBBBBBBBB"),
            ]
    }
    

    // Question(polish: "AAAAAAAAAA", english: "BBBBBBBBBB"),
    class func getSomeAdjectives() -> [Question] {
        return [
            Question(polish: "bliski", english: "nah"),
            Question(polish: "brudny", english: "schmutzig"),
            Question(polish: "chłodny", english: "kühl"),
            Question(polish: "cichy", english: "leise"),
            Question(polish: "ciemny", english: "dunkel"),
            Question(polish: "ciepły", english: "warm"),
            Question(polish: "ciężki", english: "schwer"),
            Question(polish: "czysty (pure)", english: "rein"),
            Question(polish: "czysty", english: "sauber"),
            Question(polish: "daleki", english: "weit"),
            Question(polish: "długi", english: "lang"),
            Question(polish: "dobry", english: "gut"),
            Question(polish: "drogi", english: "teuer"),
            Question(polish: "duży", english: "groß"),
            Question(polish: "głęboki", english: "tief"),
            Question(polish: "głośny", english: "laut"),
            Question(polish: "głupi", english: "dumm"),
            Question(polish: "gorący", english: "heiß"),
            Question(polish: "jasny", english: "hell"),
            Question(polish: "krótki", english: "kurz"),
            Question(polish: "lekki", english: "leicht"),
            Question(polish: "łatwy", english: "einfach"),
            Question(polish: "mały", english: "klein"),
            Question(polish: "mądry", english: "klug"),
            Question(polish: "młody", english: "jung"),
            Question(polish: "niski", english: "niedrig"),
            Question(polish: "nowy", english: "neu"),
            Question(polish: "ostry", english: "scharf"),
            Question(polish: "piękny", english: "hübsch"),
            Question(polish: "pionowy", english: "senkrecht"),
            Question(polish: "poziomy", english: "waagerecht"),
            Question(polish: "silny", english: "stark"),
            Question(polish: "słaby", english: "schwach"),
            Question(polish: "smaczny", english: "lecker"),
            Question(polish: "stary", english: "alt"),
            Question(polish: "szeroki", english: "breit"),
            Question(polish: "tani", english: "billig"),
            Question(polish: "trudny", english: "schwierig"),
            Question(polish: "wielki", english: "riesig"),
            Question(polish: "wolny (powolny)", english: "langsam"),
            Question(polish: "wysoki", english: "hoch"),
            Question(polish: "zimny", english: "kalt"),
            Question(polish: "zły (ktoś)", english: "böse"),
            Question(polish: "zły (coś)", english: "schlecht"),
            Question(polish: "spokojny", english: "ruhig"),
            Question(polish: "zmeczony", english: "müde"),
                        
            // kolory
            Question(polish: "niebieski", english: "blau"),
            Question(polish: "czerwony", english: "rot"),
            Question(polish: "czarny", english: "schwarz"),
            Question(polish: "biały (weiß)", english: "weiß"),
            Question(polish: "różowy", english: "rosa"),
            Question(polish: "zielony (grün)", english: "grün"),
            Question(polish: "żółty", english: "gelb"),
            Question(polish: "szary", english: "grau"),
            Question(polish: "pomarańczowy", english: "orange"),
            Question(polish: "brązowy", english: "braun"),
            Question(polish: "kolorowy", english: "bunt"),
        ]
    }
    
    class func getModalVerbs() -> [Question] {
        return [
            Question(polish: "mieć pozwolenie", english: "dürfen"),
            Question(polish: "mieć powinność", english: "sollen"),
            Question(polish: "móc, umieć, potrafić", english: "können"),
            Question(polish: "musieć", english: "müssen"),
            Question(polish: "lubić, pragnąć", english: "mögen"),
            Question(polish: "chcieć", english: "wollen"),
            
        ]
    }
    
    class func getStuffAtHome() -> [Question] {
        return [
            Question(polish: "sofa", english: "das Sofa"),
            Question(polish: "tapczan", english: "die Couch"),
            Question(polish: "tapczan", english: "der Sessel"),
            Question(polish: "krzesło", english: "der Stuhl"),
            Question(polish: "stół", english: "der Tisch"),
            Question(polish: "regał", english: "das Regal"),
            Question(polish: "lampa", english: "die Lampe"),
            Question(polish: "poduszka", english: "das Kissen"),
            Question(polish: "firana", english: "die Gardine"),
            Question(polish: "zasłona", english: "der Vorhang"),
            Question(polish: "drzwi", english: "die Tür"),
            Question(polish: "telewizor", english: "der Fernseher"),
            Question(polish: "radio", english: "das Radio"),
            Question(polish: "lodówka", english: "der Kühlschrank"),
            Question(polish: "zmywarka", english: "die Spülmaschine"),
            Question(polish: "zmywak", english: "der Aufwaschtisch"),
            Question(polish: "kran", english: "der Hahn"),
            Question(polish: "pralka", english: "die Waschmaschine"),
            Question(polish: "prysznic", english: "die Brause"),
            Question(polish: "wanna", english: "die Badewanne"),
            Question(polish: "dywan", english: "der Teppich"),
            Question(polish: "kwiaty", english: "die Blumen"),
            Question(polish: "łóżko", english: "das Bett"),
            Question(polish: "zegar", english: "die Uhr"),
        ]
    }
    

    class func getIT() -> [Question] {
        return [
            
        ]
    }
    
    class func getHealth() -> [Question] {
        return [
            
        ]
    }
    
    class func getLegalTerms() -> [Question] {
        return [
            
        ]
    }
    
    class func getPersonalQualities() -> [Question] {
        return [
            
        ]
    }
    
    class func getShapes() -> [Question] {
        return [
            
        ]
    }
    
    class func getGerman() -> [Question] {
        return [
            
            
            // dni tygodnia
//            Question(polish: "poniedziałek", english: "der Montag"),
//            Question(polish: "wtorek", english: "der Dienstag"),
//            Question(polish: "środa", english: "der Mittwoch"),
//            Question(polish: "czwartek", english: "der Donnerstag"),
//            Question(polish: "piątek", english: "der Freitag"),
//            Question(polish: "sobota", english: "der Samstag"),
//            Question(polish: "niedziela", english: "der Sonntag"),
            
            // most used
//            Question(polish: "zgoda", english: "Abgemacht"),
//            Question(polish: " wieczór", english: "der Abend"),
//            Question(polish: "kolacja", english: "Abendessen"),
//            Question(polish: "jednak, ale,ależ", english: "aber"),
//            Question(polish: "odjazd", english: "Abfahrt"),
//            Question(polish: "adres", english: "Adresse"),
//            Question(polish: "alkohol", english: "Alkohol"),
//            Question(polish: "wszyscy", english: "alle"),
//            Question(polish: "zatrzymywać, zatrzymać", english: "anhalten"),
//            Question(polish: "ubierać", english: "anziehen"),
//            Question(polish: "początek", english: "Anfang "),
//            Question(polish: "zaczynać", english: "anfangen"),
//            Question(polish: "przybywać,przybyć", english: "ankommen"),
//            Question(polish: " miły", english: "angenehm"),
//            Question(polish: "sam samotny", english: "allein"),
//            Question(polish: "wszystko", english: "alles"),
//            Question(polish: "gdy", english: "als "),
//            Question(polish: "niż", english: "als"),
//            Question(polish: "stary", english: "alt "),
            
            Question(polish: "wiek", english: "Alter"),
            Question(polish: "przybycie", english: "Ankunft"),
            Question(polish: "inny", english: "anderer"),
            Question(polish: "przy", english: "an"),
            Question(polish: "przyjmować (perf:przyjąć)", english: "annehmen"),
            Question(polish: "dzwonić, zadzwonić", english: "anrufen"),
            Question(polish: "pytanie", english: "Anfrage"),
            Question(polish: "odpowiedź", english: "Antwort"),
            Question(polish: "garnitur", english: "Anzug "),
            Question(polish: "jabłko", english: "Apfel"),
            Question(polish: "apetyt", english: "Appetit"),
            Question(polish: "praca", english: "die Arbeit "),
            Question(polish: "ramie", english: "Arm"),
            Question(polish: "sprzątać", english: "aufräumen"),
            Question(polish: "pracować", english: "arbeiten"),
            Question(polish: "wygląd", english: "das Aussehen"),
            Question(polish: "także, też, również", english: "auch"),
            Question(polish: "wstawać", english: "aufstehen"),
            
//            Question(polish: "budzić się", english: "aufwachen"),
//            Question(polish: "otworzyć", english: "aufmachen"),
//            Question(polish: "na", english: "auf"),
//            Question(polish: "poza tym", english: "außerdem"),
//            Question(polish: "rozbierać się", english: "sich ausziehen"),
//            Question(polish: "kąpać się", english: "baden"),
//            Question(polish: "łazienka", english: "Bad"),
//            Question(polish: "piec", english: "backen"),
//            Question(polish: "wkrótce", english: "bald"),
//            Question(polish: "przykład", english: "Beispiel"),
//            Question(polish: "otrzymać, dostawać", english: "bekommen"),
//            Question(polish: "zaczynać", english: "beginnen"),
//            Question(polish: "przy,obok,u", english: "bei"),
//            Question(polish: " szczególnie", english: "besonders"),
//            Question(polish: "znany", english: "bekannt"),
//            Question(polish: "na pewno", english: "bestimmt"),
//            Question(polish: "most", english: "Brücke"),
//            Question(polish: "brat", english: "Bruder"),
//            Question(polish: "książka", english: "Buch"),
//            Question(polish: "zawód", english: "Beruf"),
            
//            Question(polish: "opis, wpis", english: "Beschreibung"),
//            Question(polish: "dolegliwość", english: "Beschwerde"),
//            Question(polish: "przebywać, znajdować się, być", english: "befinden sich "),
//            Question(polish: "posiadać", english: "besitzen"),
//            Question(polish: "aż,do", english: "bis"),
//            Question(polish: "tanio", english: "billig"),
//            Question(polish: "prosić", english: "bitten"),
//            Question(polish: "chleb", english: "Brot"),
//            Question(polish: "ponieważ", english: "da"),
//            Question(polish: "potem", english: "dann"),
//            Question(polish: "dziękować", english: "danken"),
//            Question(polish: "myśleć, pamiętać", english: "denken"),
//            Question(polish: "z tym", english: "damit"),
//            Question(polish: "dlatego", english: "deslalb"),
//            Question(polish: "gruby", english: "dick"),
//            Question(polish: "ciebie", english: "dich"),
//            Question(polish: "tam", english: "dort"),
//            Question(polish: "ty", english: "du"),
//            Question(polish: "przez", english: "durch"),
//            Question(polish: "brać prysznic", english: "duschen"),
            
//            Question(polish: "biegunka", english: "Durchfall"),
//            Question(polish: "rodzice", english: "Eltern"),
//            Question(polish: "on", english: "er"),
//            Question(polish: "otrzymać", english: "erhalten"),
//            Question(polish: "wytłumaczyć", english: "erklären"),
//            Question(polish: "właściwie", english: "eigentlich"),
//            Question(polish: "wjazd", english: "Einfahrt"),
//            Question(polish: "zasnąć", english: "einschlafen"),
//            Question(polish: "wypoczynek", english: "Erholung"),
//            Question(polish: "jeść esn", english: "essen"),
//            Question(polish: "jeść śniadanie", english: "frühstücken"),
//            Question(polish: "gorączka", english: "Fieber"),
//            Question(polish: "urodziny", english: "Geburststag"),
//            Question(polish: "iść , chodzić", english: "gehen"),
//            Question(polish: "szczęśliwy", english: "Glücklich"),
//            Question(polish: "chętnie", english: "gern"),
//            Question(polish: "wspólnie", english: "gemeinsam"),
//            Question(polish: "wczoraj", english: "Gestern"),
//            Question(polish: "zaraz", english: "gleich"),
//            Question(polish: "pomagać", english: "helfen"),
            
//            Question(polish: "Pan", english: "Herr"),
//            Question(polish: "serce", english: "Herz"),
//            Question(polish: "pomoc", english: "Hilfe"),
//            Question(polish: "dzisiaj", english: "heute"),
//            Question(polish: "tutaj", english: "hier"),
//            Question(polish: "ja", english: "ich"),
//            Question(polish: "jest ", english: "ist"),
//            Question(polish: "w", english: "in"),
//            Question(polish: "w łóżku", english: "im Bett"),
//            Question(polish: "zawsze", english: "immer"),
//            Question(polish: "wy", english: "ihr"),
//            Question(polish: "tak", english: "ja"),
//            Question(polish: "teraz", english: "jetzt"),
//            Question(polish: "ktoś", english: "jemand"),
//            Question(polish: "żaden", english: "kein"),
//            Question(polish: "chory", english: "krank"),
//            Question(polish: "mały- klajn", english: "klein"),
//            Question(polish: "gotować", english: "kochen"),
//            Question(polish: "przychodzić, przyjść", english: "kommen"),
//            Question(polish: "lampa", english: "die Lampe"),
            
//            Question(polish: "uczyć (kogoś)", english: "lehren"),
//            Question(polish: "żyć", english: "leben"),
//            Question(polish: "das lejben", english: "das Leben – życie"),
//            Question(polish: "uczyć się", english: "lernen"),
//            Question(polish: "więcej", english: "mehr"),
//            Question(polish: "miły", english: "nett"),
//            Question(polish: "wziąć", english: "nehmen"),
//            Question(polish: "nikt", english: "niemand"),
//            Question(polish: "nic", english: "nichts"),
//            Question(polish: "mgła", english: "Nebel"),
//            Question(polish: "nowy", english: "neu"),
//            Question(polish: "albo, lub", english: "oder"),
//            Question(polish: "mimo,że", english: "obwohl"),
//            Question(polish: "mówić", english: "reden"),
//            Question(polish: "podróżować", english: "reisen"),
//            Question(polish: "bardzo", english: "sehr"),
//            Question(polish: "lecz", english: "sondern"),
//            Question(polish: "żle", english: "schlimm"),
//            Question(polish: "czarny", english: "schwarz"),
//            Question(polish: "szybko", english: "schnell"),
//            Question(polish: "smakować", english: "schmecken"),
            
//            Question(polish: "już", english: "schon"),
//            Question(polish: "mieć powinność", english: "sollen"),
//            Question(polish: "cicho", english: "still"),
//            Question(polish: "zgadzać się", english: "stimmen"),
//            Question(polish: "żle", english: "schlimm"),
//            Question(polish: "szterben", english: "sterben – umierać"),
//            Question(polish: "pić trynkn", english: "trinken"),
//            Question(polish: "dzień", english: "der Tag"),
//            Question(polish: "stół", english: "der Tisch"),
//            Question(polish: "der tod", english: "der Tod – śmierć"),
//            Question(polish: "państwo", english: "Staat"),
//            Question(polish: "marzyć, śnić", english: "träumen"),
//            Question(polish: "nosić", english: "tragen"),
//            Question(polish: "czynić, robić", english: "tun"),
//            Question(polish: "tyten", english: "töten – zabijać"),
//            Question(polish: "i", english: "und"),
//            Question(polish: "wszędzie", english: "überall"),
//            Question(polish: "zarabiać", english: "verdienen"),
//            Question(polish: "zapominać, zapomnieć", english: "vergessen"),
//            Question(polish: "próbować", english: "versuchen"),
//            Question(polish: "może", english: "vielleicht"),
            
//            Question(polish: "co", english: "was"),
//            Question(polish: "świat", english: "Welt"),
//            Question(polish: "mało", english: "wenig"),
//            Question(polish: "powtarzać", english: "widerholen"),
//            Question(polish: "wiatr", english: "Wind"),
//            Question(polish: "ile", english: "wie viel"),
//            Question(polish: "wiedzieć", english: "wissen"),
//            Question(polish: "gdzie", english: "wo"),
//            Question(polish: "my", english: "wir"),
//            Question(polish: "wszędzie", english: "überall"),
//            Question(polish: "jakby, niby, niejako, prawie, rzekomo", english: "quasi"),
//            Question(polish: "czas", english: "Zeit"),
//            Question(polish: "pokazywać", english: "zeigen"),
//            Question(polish: "pokój", english: "das Zimmer"),
//            Question(polish: "zadowolony", english: "zufrieden"),
//            Question(polish: "zamknąć", english: "zumachen"),
//            Question(polish: "razem", english: "zusammen"),
//            Question(polish: "wracać, wrócić", english: "zurückkommen"),
        ]
    }
    
    class func someNiceStuff() -> [Question] {
        return [
            Question(polish: "To miłe z twojej strony", english: "Das ist aber nett von dir"),
            Question(polish: "Żaden problem.", english: "Kein Problem"),
            Question(polish: "Przepraszam", english: "Entschuldigung"),
            Question(polish: "Przepraszam (za cos)", english: "Verzeihen Sie"),
            Question(polish: "Nie chciałem tego.", english: "Das wollte ich nicht."),
            Question(polish: "Cześć!", english: "Tschüs"),
            Question(polish: "Tak sobie", english: "So lala."),
            Question(polish: "Świetnie", english: "Ausgezeichnet"),
            Question(polish: "Nie ma za co", english: "Gern geschehen"),
            Question(polish: "Nichts zu danken", english: "Nie ma za co dziękować"),
            Question(polish: "Nic nie szkodzi", english: "Keine Ursache"),
            Question(polish: "Chętnie", english: "Gerne"),
            Question(polish: "Tak, z przyjemnością", english: "Ja, mit Vergnügen"),
            Question(polish: "Nie, niestety nie.", english: "Nein, leider nicht"),
            Question(polish: "Przykro mi", english: "Es tut mir leid"),
            Question(polish: "Proszę", english: "Bitte sehr."),
            Question(polish: "Smacznego (M.)", english: "Mahlzeit"),
            Question(polish: "Smacznego (G.)", english: "Guten Appetit"),
            Question(polish: "Na zdrowie", english: "Zum wohl"),
            Question(polish: "Na zdrowie (po kichnieciu)", english: "Gesundheit"),
            Question(polish: "Szczęśliwej podróży", english: "Gute Reise! "),
            Question(polish: "Wszystkiego dobrego!", english: "Alles Gute! "),
            Question(polish: "Dobrej zabawy!", english: "Viel SpaSS!"),
            Question(polish: "Ja uczyłem się niemieckiego w szkole 20 lat temu.", english: "Ich habe vor 20 Jahren Deutsch in der Schule gelernt."),
            Question(polish: "AAA", english: "BBB"),
            
            
            
        ]
    }
    
    
    class func getUseful() -> [Question] {
        return [
            Question(polish: "Wylatujemy do szwecji.", english: "Wir fliegen nach Schweden"),
            Question(polish: "Mam przy sobie komputer i idę do pracy", english: "Ich habe einen Computer dabei und gehe arbeiten"),
            Question(polish: "Chodze na silownie.", english: "Ich gehe ins Fitnessstudio."),
            Question(polish: "Pracuję jako programista, więc dużo się uczę.", english: "Ich arbeite als Programmierer, also lerne ich viel."),
            Question(polish: "Robię kursy online", english: "Ich mache Online-Kurse"),
            Question(polish: "Większość z nich jest bezpłatna.", english: "Die meisten sind frei."),
            Question(polish: "Spędzam dużo czasu z Julią i Emilią", english: "Ich verbringe viel Zeit mit Julia und Emilia"),
            Question(polish: "Nie mam wielu przyjaciół", english: "Ich habe nicht viele Freunde"),
            Question(polish: "Julia idzie do przedszkola.", english: "Julia geht in den Kindergarten."),
            Question(polish: "Czasami Julia zostaje w domu i przeszkadza mi w pracy.", english: "Manchmal bleibt Julia zu Hause und stört meine Arbeit."),
            Question(polish: "Pogoda w Szwecji jest kiepska.", english: "Das Wetter in Schweden ist schlecht."),
            Question(polish: "Bardzo lubię swoją pracę.", english: "Ich mag meinen Job sehr."),
            Question(polish: "Ja uczyłem się niemieckiego w szkole 20 lat temu.", english: "Ich habe vor 20 Jahren Deutsch in der Schule gelernt."),
            Question(polish: "Bardzo duzo zapomnialem.", english: "Ich habe viel vergessen."),
            
        ]
    }
    
    class func getSomeUseful() -> [Question] {
        return [
            
        ]
    }
    
    class func get4() -> [Question] {
        return [
            
        ]
    }
    
    class func get5() -> [Question] {
        return [
            
        ]
    }
    
    class func get6() -> [Question] {
        return [
            
        ]
    }
    
    class func get7() -> [Question] {
        return [
            
        ]
    }
    
    class func get8() -> [Question] {
        return [
           
        ]
    }
    
    class func get9() -> [Question] {
        return [
            
        ]
    }
    
    class func get10() -> [Question] {
        return [
            
        ]
    }
    
    class func get11() -> [Question] {
        return [
            
        ]
    }
    
    class func get12() -> [Question] {
        return [
            
            
        ]
    }
    
    class func get13() -> [Question] {
        return [
            
        ]
    }
    
    class func get14() -> [Question] {
        return [
           
        ]
    }
    
    class func getInteresting() -> [Question] {
        return [
            
        ]
    }
}


// zdania https://www.ldoceonline.com/dictionary/fling

