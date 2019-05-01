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
    
    class func getAllSingleWords() -> [String] {
        let words = ["read", "bit", "rose", "split", "drink", "hold", "chose", "swung", "clung", "built", "ring", "spread", "strive", "knit", "awoken", "make", "saw", "burnt", "forgotten", "froze", "grind", "begin", "arose", "dug", "stick", "split", "bear", "stunk", "fling", "lighted", "wrote", "won", "sawn", "held", "lay", "bled", "burned", "forgot", "shed", "slept", "made", "meant", "lent", "hung", "made", "ground", "did", "rung", "swept", "wept", "tore", "shone", "set", "wring", "hanged", "lit", "deal", "bought", "split", "ran", "speak", "knitted", "gone", "threw", "fight", "dealt", "drank", "let", "bent", "burned", "build", "shot", "think", "sink", "left", "cast", "drunk", "understood", "bind", "leaped", "rang", "began", "leave", "knelt", "fought", "hidden", "wrung", "spent", "lay", "light", "learnt", "cut", "sworn", "sweep", "shrunk", "shut", "broken", "cast", "bitten", "thrown", "flung", "do", "grown", "led", "led", "cast", "slain", "show", "burnt", "awake", "strove", "fed", "paid", "draw", "bred", "flew", "hear", "kneeled", "go", "sell", "beat", "shed", "knew", "quit", "tread", "put", "read", "mean", "swung", "stank", "wept", "drawn", "understood", "sting", "leap", "shine", "dealt", "lost", "fall", "kept", "got", "blew", "spoke", "bet", "understand", "dug", "sang", "hide", "have", "done", "spring", "cost", "bought", "bound", "brought", "stink", "wound", "shut", "lend", "stole", "foretell", "slay", "told", "lent", "read", "stung", "sprang", "set", "saw", "tell", "ride", "wore", "slung", "laid", "stood", "ate", "leapt", "driven", "eat", "spread", "sent", "slept", "given", "become", "send", "crept", "dig", "bite", "came", "say", "lighted", "creep", "heard", "broke", "wind", "shake", "seen", "breed", "stung", "caught", "lead", "sling", "held", "swum", "bend", "gave", "bore", "pay", "said", "showed", "knitted", "woken", "became", "fell", "knit", "know", "trodden", "felt", "sawed", "knelt", "met", "swam", "steal", "shut", "choose", "bred", "sought", "flown", "forgave", "wound", "blow", "left", "frozen", "spin", "lose", "shrank", "sit", "bent", "dreamt", "learnt", "hurt", "quit", "sat", "wake", "ground", "hit", "struck", "swing", "wear", "grow", "took", "sold", "knit", "stood", "fled", "forgive", "spun", "slid", "bound", "bleed", "shaken", "forbid", "quit", "sent", "break", "leaped", "spoken", "stuck", "cut", "eaten", "slew", "feed", "dreamt", "struck", "cost", "wrung", "begun", "leapt", "freeze", "ridden", "cut", "won", "write", "sought", "written", "had", "taught", "fled", "learn", "kept", "learned", "grew", "seek", "met", "foretold", "find", "tear", "buy", "shed", "brought", "taught", "run", "let", "sank", "spread", "become", "shrink", "fallen", "flee", "meant", "catch", "risen", "swim", "dream", "forbade", "burn", "torn", "forgiven", "keep", "lost", "kneel", "went", "found", "give", "meet", "got", "thought", "thought", "clung", "heard", "arise", "crept", "found", "hung", "drive", "stand", "take", "run", "come", "hit", "bet", "told", "shown", "shot", "laid", "hang", "weep", "set", "awoke", "fed", "chosen", "forsaken", "slung", "fought", "dreamed", "paid", "rise", "hanged", "spun", "felt", "swore", "feel", "come", "cling", "caught", "sleep", "flung", "sat", "built", "slid", "lie", "woke", "drove", "slide", "sprung", "forget", "had", "striven", "drew", "stolen", "forbidden", "sung", "win", "stuck", "hurt", "bled", "foretold", "beat", "taken", "swear", "dreamed", "sing", "see", "hurt", "let", "shone", "spend", "hit", "trod", "said", "strike", "shoot", "lit", "get", "bet", "shook", "forsake", "worn", "borne", "spent", "known", "beaten", "learned", "put", "blown", "fly", "hid", "put", "sold", "kneeled", "rode", "sunk", "teach", "cost", "bring", "forsook", "swept", "lain", "arisen", "throw"]
        return words.shuffled()
    }
    
    class func getVerbs() -> [Question] {
        return [Question(swedish: "stiga upp", english: "arise"),
                Question(swedish: "vakna", english: "awake"),
                Question(swedish: "vara", english: "be"),
                Question(swedish: "slå", english: "beat"),
                Question(swedish: "bli", english: "become"),
                Question(swedish: "börja", english: "begin"),
                Question(swedish: "böja", english: "bend"),
                Question(swedish: "slå vad", english: "bet"),
                Question(swedish: "bita", english: "bite"),
                Question(swedish: "blöda", english: "bleed"),
                Question(swedish: "blåsa", english: "blow"),
                Question(swedish: "bryta", english: "break"),
                Question(swedish: "föra", english: "bring"),
                Question(swedish: "bygga", english: "build"),
                Question(swedish: "brinna", english: "burn"),
                Question(swedish: "brista", english: "burst"),
                Question(swedish: "köpa", english: "buy"),
                Question(swedish: "fånga", english: "catch"),
                Question(swedish: "välja", english: "choose"),
                Question(swedish: "komma", english: "come"),
                Question(swedish: "kosta", english: "cost"),
                Question(swedish: "krypa", english: "creep"),
                Question(swedish: "skära", english: "cut"),
                Question(swedish: "handla", english: "deal"),
                Question(swedish: "gräva", english: "dig"),
                Question(swedish: "göra", english: "do"),
                Question(swedish: "dra", english: "draw"),
                Question(swedish: "drömma", english: "dream"),
                Question(swedish: "dricka", english: "drink"),
                Question(swedish: "öra", english: "drive"),
                Question(swedish: "äta", english: "eat"),
                Question(swedish: "falla", english: "fall"),
                Question(swedish: "mata", english: "feed"),
                Question(swedish: "känna", english: "feel"),
                Question(swedish: "slåss", english: "fight"),
                Question(swedish: "hitta", english: "find"),
                Question(swedish: "fly", english: "flee"),
                Question(swedish: "slänga", english: "fling"),
                Question(swedish: "flyga", english: "fly"),
                Question(swedish: "förbjuda", english: "forbid"),
                Question(swedish: "glömma", english: "forget"),
                Question(swedish: "förlåten", english: "forgive"),
                Question(swedish: "frysa", english: "freeze"),
                Question(swedish: "få", english: "get"),
                Question(swedish: "ge", english: "give"),
                Question(swedish: "gå", english: "go"),
                Question(swedish: "växa", english: "grow"),
                Question(swedish: "hänga", english: "hang"),
                Question(swedish: "ha", english: "have"),
                Question(swedish: "höra", english: "hear"),
                Question(swedish: "gömma", english: "hide"),
                Question(swedish: "träffa", english: "hit"),
                Question(swedish: "hålla", english: "hold"),
                Question(swedish: "skada", english: "hurt"),
                Question(swedish: "behålla", english: "keep"),
                Question(swedish: "veta", english: "know"),
                Question(swedish: "lägga", english: "lay"),
                Question(swedish: "leda", english: "lead"),
                Question(swedish: "luta", english: "lean"),
                Question(swedish: "lära", english: "learn"),
                Question(swedish: "lämna", english: "leave"),
                Question(swedish: "låna", english: "lend"),
                Question(swedish: "låta", english: "let"),
                Question(swedish: "ligga", english: "lie"),
                Question(swedish: "tända", english: "light"),
                Question(swedish: "förlora", english: "lose"),
                Question(swedish: "göra", english: "make"),
                Question(swedish: "betyda", english: "mean"),
                Question(swedish: "möta", english: "meet"),
                Question(swedish: "betala", english: "pay"),
                Question(swedish: "ställa", english: "put"),
                Question(swedish: "sluta", english: "quit"),
                Question(swedish: "läsa", english: "read"),
                Question(swedish: "rida", english: "ride"),
                Question(swedish: "ringa", english: "ring"),
                Question(swedish: "stiga", english: "rise"),
                Question(swedish: "springa", english: "run"),
                Question(swedish: "säga", english: "say"),
                Question(swedish: "se", english: "see"),
                Question(swedish: "söka", english: "seek"),
                Question(swedish: "sälja", english: "sell"),
                Question(swedish: "skicka", english: "send"),
                Question(swedish: "sätta", english: "set"),
                Question(swedish: "skaka", english: "shake"),
                Question(swedish: "skina", english: "shine"),
                Question(swedish: "skjuta", english: "shoot"),
                Question(swedish: "visa", english: "show"),
                Question(swedish: "krympa", english: "shrink"),
                Question(swedish: "stänga", english: "shut"),
                Question(swedish: "sjunka", english: "sink"),
                Question(swedish: "sitta", english: "sit"),
                Question(swedish: "sova", english: "sleep"),
                Question(swedish: "glida", english: "slide"),
                Question(swedish: "lukta", english: "smell"),
                Question(swedish: "tala", english: "speak"),
                Question(swedish: "stava", english: "spell"),
                Question(swedish: "tillbringa", english: "spend"),
                Question(swedish: "spotta", english: "spit"),
                Question(swedish: "sprida", english: "spread"),
                Question(swedish: "stå", english: "stand"),
                Question(swedish: "stjäla", english: "steal"),
                Question(swedish: "sticka", english: "stick"),
                Question(swedish: "stinga", english: "sting"),
                Question(swedish: "stinka", english: "stink"),
                Question(swedish: "slå", english: "strike"),
                Question(swedish: "svära", english: "swear"),
                Question(swedish: "svepa", english: "sweep"),
                Question(swedish: "simma", english: "swim"),
                Question(swedish: "svänga", english: "swing"),
                Question(swedish: "ta", english: "take"),
                Question(swedish: "lära", english: "teach"),
                Question(swedish: "riva", english: "tear"),
                Question(swedish: "berätta", english: "tell"),
                Question(swedish: "tänka", english: "think"),
                Question(swedish: "kasta", english: "throw"),
                Question(swedish: "trampa", english: "tread"),
                Question(swedish: "förstå", english: "understand"),
                Question(swedish: "väcka", english: "wake"),
                Question(swedish: "bära", english: "wear"),
                Question(swedish: "väva", english: "weave"),
                Question(swedish: "gråta", english: "weep"),
                Question(swedish: "vinna", english: "win"),
                Question(swedish: "vrida", english: "wring"),
                Question(swedish: "skriva", english: "write")]
    }
    
    class func getAdjectives() -> [Question] {
        return [Question(swedish: "ung", english: "young"),
                Question(swedish: "vis", english: "wise"),
                Question(swedish: "warm", english: "warm"),
                Question(swedish: "tuff", english: "tough"),
                Question(swedish: "smal", english: "thin"),
                Question(swedish: "tjock", english: "thick"),
                Question(swedish: "lång", english: "tall"),
                Question(swedish: "stark", english: "strong"),
                Question(swedish: "konstig", english: "strange"),
                Question(swedish: "mjuk", english: "soft"),
                Question(swedish: "smart", english: "smart"),
                Question(swedish: "liten", english: "small"),
                Question(swedish: "långsam", english: "slow"),
                Question(swedish: "enkel", english: "simple"),
                Question(swedish: "blyg", english: "shy"),
                Question(swedish: "skarp", english: "sharp"),
                Question(swedish: "grunt", english: "shallow"),
                Question(swedish: "säker", english: "safe"),
                Question(swedish: "ledsen", english: "sad"),
                Question(swedish: "grov", english: "rough"),
                Question(swedish: "rik", english: "rich"),
                Question(swedish: "tyst", english: "quiet"),
                Question(swedish: "kvick", english: "quick"),
                Question(swedish: "ren", english: "pure"),
                Question(swedish: "fattig", english: "poor"),
                Question(swedish: "märklig", english: "odd"),
                Question(swedish: "snäll", english: "nice"),
                Question(swedish: "nära", english: "near"),
                Question(swedish: "ny", english: "new"),
                Question(swedish: "nära", english: "near"),
                Question(swedish: "mild", english: "mild"),
                Question(swedish: "elak", english: "mean"),
                Question(swedish: "hög", english: "loud"),
                Question(swedish: "lång", english: "long"),
                Question(swedish: "ensam", english: "lonely"),
                Question(swedish: "sen", english: "late"),
                Question(swedish: "stor", english: "large"),
                Question(swedish: "snäll", english: "kind"),
                Question(swedish: "varm", english: "hot"),
                Question(swedish: "hög", english: "high"),
                Question(swedish: "svår", english: "hard"),
                Question(swedish: "stor", english: "great"),
                Question(swedish: "fräsh", english: "fresh"),
                Question(swedish: "lämplig", english: "fit"),
                Question(swedish: "fin", english: "fine"),
                Question(swedish: "våldsam", english: "fierce"),
                Question(swedish: "få", english: "few"),
                Question(swedish: "snabb", english: "fast"),
                Question(swedish: "rättvis", english: "fair"),
                Question(swedish: "svag", english: "faint"),
                Question(swedish: "djup", english: "deep"),
                Question(swedish: "mörk", english: "dark"),
                Question(swedish: "söt", english: "cute"),
                Question(swedish: "rå", english: "cruel"),
                Question(swedish: "häftig", english: "cool"),
                Question(swedish: "kall", english: "cold"),
                Question(swedish: "nära", english: "close"),
                Question(swedish: "smart", english: "clever"),
                Question(swedish: "klar", english: "clear"),
                Question(swedish: "ren", english: "clean"),
                Question(swedish: "upptagen", english: "busy"),
                Question(swedish: "ljus", english: "bright"),
                Question(swedish: "modig", english: "brave"),
                Question(swedish: "djärv", english: "bold"),
                Question(swedish: "stor", english: "big")]
    }
    

    // ąćęłńóśźż.
    class func getPlEn() -> [Question] {
        return [Question(swedish: "strajkować", english: "strike"),
                Question(swedish: "kopać", english: "dig"),
                Question(swedish: "powiesić", english: "hang"),
                Question(swedish: "ślizgać się", english: "slide"),
                Question(swedish: "pluć", english: "spit"),
                Question(swedish: "pękać", english: "burst"),
                Question(swedish: "rozprzestrzeniać się", english: "spread"),
                Question(swedish: "leżeć, kłamać", english: "lie"),
                Question(swedish: "pożyczyć", english: "lend"),
                Question(swedish: "uciekać", english: "flee"),
                Question(swedish: "szukać", english: "seek"),
                Question(swedish: "pochylać sie, oprzeć sie", english: "lean"),
                Question(swedish: "kłaść", english: "lay"),
                Question(swedish: "kurczyć", english: "shrink"),
                Question(swedish: "pływać", english: "swim"),
                Question(swedish: "ciągnąć", english: "draw"),
                Question(swedish: "ukręcić", english: "wring"),
                Question(swedish: "płakać", english: "weep"),
                Question(swedish: "prowadzić", english: "lead"),
                Question(swedish: "deptać, stąpać", english: "tread"),
                Question(swedish: "zapalić", english: "light"),
                Question(swedish: "obudzić", english: "awake"),
                Question(swedish: "wąchać", english: "smell"),
                Question(swedish: "zagiąć", english: "bend"),
                Question(swedish: "użądlić", english: "sting"),
                Question(swedish: "zamarzać", english: "freeze"),
                Question(swedish: "rosnąć", english: "rise"),
                Question(swedish: "rzucać", english: "fling")]
    }
    
    class func getHardVerbs() -> [LongQuestion] {
        return [
            LongQuestion(polish: "stawać się, zostawać kimś/czymś", english1: "become", english2: "became", english3: "become"),
            LongQuestion(polish: "zaczynać", english1: "begin", english2: "began", english3: "begun"),
            LongQuestion(polish: "łamać, pękać, rozbić, tłuc", english1: "break", english2: "broke", english3: "broken"),
            LongQuestion(polish: "przynosić, przyprowadzić", english1: "bring", english2: "brought", english3: "brought"),
            LongQuestion(polish: "budować", english1: "build", english2: "built", english3: "built"),
            LongQuestion(polish: "kupować", english1: "buy", english2: "bought", english3: "bought"),
            LongQuestion(polish: "łapać", english1: "catch", english2: "caught", english3: "caught"),
            LongQuestion(polish: "wybierać", english1: "choose", english2: "chose", english3: "chosen"),
            LongQuestion(polish: "przyjść, przyjechać", english1: "come", english2: "came", english3: "come"),
            LongQuestion(polish: "kosztować", english1: "cost", english2: "cost", english3: "cost"),
            LongQuestion(polish: "ciąć, kroić, skaleczyć", english1: "cut", english2: "cut", english3: "cut"),
            LongQuestion(polish: "robić", english1: "do", english2: "did", english3: "done"),
            LongQuestion(polish: "rysować, pociągnąć, remisować", english1: "draw", english2: "drew", english3: "drawn"),
            LongQuestion(polish: "śnić, marzyć", english1: "dream", english2: "dreamed/dreamt", english3: "dreamed/dreamt"),
            LongQuestion(polish: "pić", english1: "drink", english2: "drank", english3: "drunk"),
            LongQuestion(polish: "prowadzić, kierować (auto)", english1: "drive", english2: "drove", english3: "driven"),
            LongQuestion(polish: "jeść", english1: "eat", english2: "ate", english3: "eaten"),
            LongQuestion(polish: "padać, upadać, spadać", english1: "fall", english2: "fell", english3: "fallen"),
            LongQuestion(polish: "czuć", english1: "feel", english2: "felt", english3: "felt"),
            LongQuestion(polish: "znaleźć", english1: "find", english2: "found", english3: "found"),
            LongQuestion(polish: "latać", english1: "fly", english2: "flew", english3: "flown"),
            LongQuestion(polish: "dostawać", english1: "get", english2: "got", english3: "got"),
            LongQuestion(polish: "dawać", english1: "give", english2: "gave", english3: "given"),
            LongQuestion(polish: "iść", english1: "go", english2: "went", english3: "gone"),
            LongQuestion(polish: "rosnąć", english1: "grow", english2: "grew", english3: "grown"),
            LongQuestion(polish: "mieć", english1: "have", english2: "had", english3: "had"),
            LongQuestion(polish: "słyszeć", english1: "hear", english2: "heard", english3: "heard"),
            LongQuestion(polish: "uderzać", english1: "hit", english2: "hit", english3: "hit"),
            LongQuestion(polish: "trzymać, utrzymywać, posiadać", english1: "hold", english2: "held", english3: "held"),
            LongQuestion(polish: "ranić, boleć", english1: "hurt", english2: "hurt", english3: "hurt"),
            
            LongQuestion(polish: "trzymać", english1: "keep", english2: "kept", english3: "kept"),
            LongQuestion(polish: "znać, wiedzieć", english1: "know", english2: "knew", english3: "known"),
            LongQuestion(polish: "uczyć się", english1: "learn", english2: "learned/learnt", english3: "learned/learnt"),
            LongQuestion(polish: "opuszczać, wyjeżdżać, zostawiać", english1: "leave", english2: "left", english3: "left"),
            LongQuestion(polish: "pożyczać", english1: "lend", english2: "lent", english3: "lent"),
            LongQuestion(polish: "tracić, zgubić", english1: "lose", english2: "lost", english3: "lost"),
            LongQuestion(polish: "robić, wykonywać", english1: "make", english2: "made", english3: "made"),
            LongQuestion(polish: "znaczyć, oznaczać; mieć na myśli", english1: "mean", english2: "meant", english3: "meant"),
            LongQuestion(polish: "spotykać, poznać", english1: "meet", english2: "met", english3: "met"),
            LongQuestion(polish: "płacić", english1: "pay", english2: "paid", english3: "paid"),
            LongQuestion(polish: "kłaść", english1: "put", english2: "put", english3: "put"),
            LongQuestion(polish: "czytać", english1: "read", english2: "read", english3: "read"),
            LongQuestion(polish: "jeździć", english1: "ride", english2: "rode", english3: "ridden"),
            LongQuestion(polish: "dzwonić", english1: "ring", english2: "rang", english3: "rung"),
            LongQuestion(polish: "biec", english1: "run", english2: "ran", english3: "run"),
            LongQuestion(polish: "mówić", english1: "say", english2: "said", english3: "said"),
            LongQuestion(polish: "widzieć", english1: "see", english2: "saw", english3: "seen"),
            LongQuestion(polish: "sprzedawać", english1: "sell", english2: "sold", english3: "sold"),
            LongQuestion(polish: "wysyłać, słać", english1: "send", english2: "sent", english3: "sent"),
            LongQuestion(polish: "pokazywać", english1: "show", english2: "showed", english3: "shown"),
            LongQuestion(polish: "zamykać", english1: "shut", english2: "shut", english3: "shut"),
            LongQuestion(polish: "śpiewać", english1: "sing", english2: "sang", english3: "sung"),
            LongQuestion(polish: "siedzieć, siadać", english1: "sit", english2: "sat", english3: "sat"),
            LongQuestion(polish: "spać", english1: "sleep", english2: "slept", english3: "slept"),
            LongQuestion(polish: "mówić, rozmawiać", english1: "speak", english2: "spoke", english3: "spoken"),
            LongQuestion(polish: "spędzać, wydawać", english1: "spend", english2: "spent", english3: "spent"),
            LongQuestion(polish: "stać", english1: "stand", english2: "stood", english3: "stood"),
            LongQuestion(polish: "kraść", english1: "steal", english2: "stole", english3: "stolen"),
            LongQuestion(polish: "pływać", english1: "swim", english2: "swam", english3: "swum"),
            LongQuestion(polish: "brać", english1: "take", english2: "took", english3: "taken"),
            
            LongQuestion(polish: "uczyć", english1: "teach", english2: "taught", english3: "taught"),
            LongQuestion(polish: "powiedzieć", english1: "tell", english2: "told", english3: "told"),
            LongQuestion(polish: "myśleć, sądzić, uważać", english1: "think", english2: "thought", english3: "thought"),
            LongQuestion(polish: "rzucać", english1: "throw", english2: "threw", english3: "thrown"),
            LongQuestion(polish: "budzić", english1: "wake", english2: "woke", english3: "woken"),
            LongQuestion(polish: "nosić, zakładać", english1: "wear", english2: "wore", english3: "worn"),
            LongQuestion(polish: "rozumieć", english1: "understand", english2: "understood", english3: "understood"),
            LongQuestion(polish: "wygrywać", english1: "win", english2: "won", english3: "won"),
            LongQuestion(polish: "pisać", english1: "write", english2: "wrote", english3: "written"),
            LongQuestion(polish: "obudzić", english1: "awake", english2: "awoke", english3: "awoken"),
            LongQuestion(polish: "bić", english1: "beat", english2: "beat", english3: "beaten"),
            LongQuestion(polish: "ugryźć", english1: "bite", english2: "bit", english3: "bitten"),
            LongQuestion(polish: "krwawić", english1: "bleed", english2: "bled", english3: "bled"),
            LongQuestion(polish: "wiać, dmuchać", english1: "blow", english2: "blew", english3: "blown"),
            LongQuestion(polish: "palić, parzyć, płonąć", english1: "burn", english2: "burned/burnt", english3: "burned/burnt"),
            LongQuestion(polish: "kopać (np. w ziemi)", english1: "dig", english2: "dug", english3: "dug"),
            LongQuestion(polish: "karmić, żywić", english1: "feed", english2: "fed", english3: "fed"),
            LongQuestion(polish: "walczyć, bić się", english1: "fight", english2: "fought", english3: "fought"),
            LongQuestion(polish: "zapominać", english1: "forget", english2: "forgot", english3: "forgotten"),
            LongQuestion(polish: "wybaczać", english1: "forgive", english2: "forgave", english3: "forgiven"),
            LongQuestion(polish: "zamarzać", english1: "freeze", english2: "froze", english3: "frozen"),
            LongQuestion(polish: "zawieszać (coś, np. obraz)", english1: "hang", english2: "hanged/hung", english3: "hanged/hung"),
            LongQuestion(polish: "chować, ukrywać", english1: "hide", english2: "hid", english3: "hidden"),
            LongQuestion(polish: "pozwalać", english1: "let", english2: "let", english3: "let"),
            LongQuestion(polish: "leżeć, kłaść się", english1: "lie", english2: "lay", english3: "lain"),
            LongQuestion(polish: "zapalać, rozpalać, oświetlać", english1: "light", english2: "lighted/lit", english3: "lighted/lit"),
            LongQuestion(polish: "rzucać, opuszczać", english1: "quit", english2: "quit", english3: "quit"),
            LongQuestion(polish: "podnosić się, wzrastać, wschodzić (o słońcu)", english1: "rise", english2: "rose", english3: "risen"),
            LongQuestion(polish: "trząść, potrząsać", english1: "shake", english2: "shook", english3: "shaken"),
            LongQuestion(polish: "świecić, błyszczeć", english1: "shine", english2: "shone", english3: "shone"),
            
            LongQuestion(polish: "strzelać", english1: "shoot", english2: "shot", english3: "shot"),
            LongQuestion(polish: "tonąć (o statku), zapadać się", english1: "sink", english2: "sank", english3: "sunk"),
            LongQuestion(polish: "wbijać, wtykać, przyklejać, wystawić", english1: "stick", english2: "stuck", english3: "stuck"),
            LongQuestion(polish: "uderzyć, wybijać", english1: "strike", english2: "struck", english3: "struck"),
            LongQuestion(polish: "drzeć, rozdzierać", english1: "tear", english2: "tore", english3: "torn"),
            LongQuestion(polish: "znosić, udźwignąć coś, żywić (urazę)", english1: "bear", english2: "bore", english3: "borne"),
            LongQuestion(polish: "zginać, nachylać", english1: "bend", english2: "bent", english3: "bent"),
            LongQuestion(polish: "hodować, wychować, rozmnażać się", english1: "breed", english2: "bred", english3: "bred"),
            LongQuestion(polish: "rzucić, zrzucić", english1: "cast", english2: "cast", english3: "cast"),
            LongQuestion(polish: "postępować, mieć do czynienia, radzić sobie", english1: "deal", english2: "dealt", english3: "dealt"),
            LongQuestion(polish: "zabraniać", english1: "forbid", english2: "forbade", english3: "forbidden"),
            LongQuestion(polish: "klękać, klęczeć", english1: "kneel", english2: "kneeled/knelt", english3: "kneeled/knelt"),
            LongQuestion(polish: "robić na drutach", english1: "knit", english2: "knitted/knit", english3: "knitted/knit"),
            LongQuestion(polish: "prowadzić (zespół)", english1: "lead", english2: "led", english3: "led"),
            LongQuestion(polish: "szukać, poszukiwać", english1: "seek", english2: "sought", english3: "sought"),
            LongQuestion(polish: "ustawiać, zachodzić (o słońcu), nastawić, wyznaczyć", english1: "set", english2: "set", english3: "set"),
            LongQuestion(polish: "kurczyć się, zbiegać", english1: "shrink", english2: "shrank", english3: "shrunk"),
            LongQuestion(polish: "ślizgać się, zjeżdżać", english1: "slide", english2: "slid", english3: "slid"),
            LongQuestion(polish: "dzielić, rodzielać", english1: "split", english2: "split", english3: "split"),
            LongQuestion(polish: "rozchodzić się, rozprzestrzeniać, rozkładać, rozpościerać, rozsmarować", english1: "spread", english2: "spread", english3: "spread"),
            LongQuestion(polish: "przysięgać, przeklinać", english1: "swear", english2: "swore", english3: "sworn"),
            LongQuestion(polish: "zmiatać, zamiatać", english1: "sweep", english2: "swept", english3: "swept"),
            LongQuestion(polish: "machnąć, zakołysać", english1: "swing", english2: "swung", english3: "swung"),
            LongQuestion(polish: "pojawić się", english1: "arise", english2: "arose", english3: "arisen"),
            LongQuestion(polish: "zakładać się, obstawiać", english1: "bet", english2: "bet", english3: "bet"),
            LongQuestion(polish: "umykać, uciekać, opuścić", english1: "flee", english2: "fled", english3: "fled"),
            LongQuestion(polish: "położyć, kłaść", english1: "lay", english2: "laid", english3: "laid"),
            LongQuestion(polish: "kręcić, zakręcić czymś/się, obrócić", english1: "spin", english2: "spun", english3: "spun"),
            LongQuestion(polish: "śmierdzieć, cuchnąć", english1: "stink", english2: "stank", english3: "stunk"),
            LongQuestion(polish: "wiązać, złączyć, oprawić (książkę)", english1: "bind", english2: "bound", english3: "bound"),
            LongQuestion(polish: "przywrzeć, uczepić się, trzymać się kurczowo", english1: "cling", english2: "clung", english3: "clung"),
            LongQuestion(polish: "skradać się, zakradać, piąć się, podchodzić", english1: "creep", english2: "crept", english3: "crept"),
            LongQuestion(polish: "rzucić, cisnąć", english1: "fling", english2: "flung", english3: "flung"),
            LongQuestion(polish: "porzucać, zaniechać, opuścić", english1: "forsake", english2: "forsook", english3: "forsaken"),
            LongQuestion(polish: "przepowiadać, przewidywać", english1: "foretell", english2: "foretold", english3: "foretold"),
            LongQuestion(polish: "zemleć, rozkruszyć, zgrzytać, ostrzyć, trzeć", english1: "grind", english2: "ground", english3: "ground"),
            LongQuestion(polish: "skakać, przeskoczyć", english1: "leap", english2: "leaped/leapt", english3: "leaped/leapt"),
            LongQuestion(polish: "piłować", english1: "saw", english2: "sawed", english3: "sawn"),
            LongQuestion(polish: "zrzucać, pozbywać się", english1: "shed", english2: "shed", english3: "shed"),
            LongQuestion(polish: "zgładzać, zabijać", english1: "slay", english2: "slew", english3: "slain"),
            LongQuestion(polish: "cisnąć, miotać", english1: "sling", english2: "slung", english3: "slung"),
            LongQuestion(polish: "przeskakiwać, wyskakiwać", english1: "spring", english2: "sprang", english3: "sprung"),
            LongQuestion(polish: "żądlić", english1: "sting", english2: "stung", english3: "stung"),
            LongQuestion(polish: "zmagać się, dążyć, starać się", english1: "strive", english2: "strove", english3: "striven"),
            LongQuestion(polish: "kroczyć, stąpać, deptać", english1: "tread", english2: "trod", english3: "trodden"),
            LongQuestion(polish: "płakać, szlochać", english1: "weep", english2: "wept", english3: "wept"),
            LongQuestion(polish: "nawijać, nakręcać, wić się", english1: "wind", english2: "wound", english3: "wound"),
            LongQuestion(polish: "wykręcić, wyżąć coś, wycisnąć", english1: "wring", english2: "wrung", english3: "wrung")
        ]
    }
}


// zdania https://www.ldoceonline.com/dictionary/fling

