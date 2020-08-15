//
//  AppDelegate.swift
//  EmiApp
//
//  Created by Sebastian Strus on 2019-04-07.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let vc = MainMenuController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.interactivePopGestureRecognizer?.isEnabled = false
        
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = AppColors.ACCENT_PURPLE
        navigationController.navigationBar.tintColor = UIColor.white
        
        
        
        /*let times: [Question] = Data.getWeatherWords()
        print("TIME (\(times.count))")
        for question in times {
            print("\(question.swedish)  -  \(question.english)")
        }
        print(" ")
        let verbs: [Question] = Data.getVerbs()
        print("VERBS (\(verbs.count))")
        for question in verbs {
            print("\(question.swedish)  -  \(question.english)")
        }
        
        
        print(" ")
        let adjectives: [Question] = Data.getAdjectives()
        print("ADJECTIVES (\(adjectives.count))")
        for question in adjectives {
            print("\(question.swedish)  -  \(question.english)")
        }*/
        

        
        
        window?.rootViewController = navigationController
        
        
        let filePath = Bundle.main.path(forResource: "words", ofType: "txt");//words
        let URL = NSURL.fileURL(withPath: filePath!)

        do {
            let string = try String.init(contentsOf: URL)

            // use string here

            let myStrings: [String] = string.components(separatedBy: .newlines)
            var all = 0
            for row in myStrings {
                
                var temp1 = row.replacingOccurrences(of: "LongQuestion", with: "LongestQuestion")
                var temp2 = temp1.replacingOccurrences(of: "),", with: ", example: \"xxx\"),")
                print(temp2)
                all += 1
            }
            print(all)
//
//            //var newStrings:[String] = myStrings.reversed()
//            //newStrings.remove(at: 0)
//            print("Lines: \(myStrings.count)")
//
//            for i in 0...(myStrings.count) {
//                //if (i % 2 == 0) {
//                    //print("Question(swedish: \"\(newStrings[i])\", english: \"\(newStrings[i+1])\"),")
//                //}
//            //}
                

//            var i = 0
//
//            var k2int = 0
//            var k3int = 0
//            let allQuestions = Data.getMoreVerbs()
//        
//        print("All: \(allQuestions.count)")
//            for k in allQuestions {
//                let k0 = k.polish
//                let k1 = k.english1
//                let k2 = k.english2
//                let k3 = k.english3
//
//
//                if k3.contains("/") {
//                    let k3splited = k3.split(separator: "/")
//                    let newk3 = k3splited[1] + "/" + k3splited[0]
//                    print("LongQuestion(polish: \"\(k0)\", english1: \"\(k1)\", english2: \"\(k2)\", english3: \"\(newk3)\"),")
//                } else {
//                    print("LongQuestion(polish: \"\(k0)\", english1: \"\(k1)\", english2: \"\(k2)\", english3: \"\(k3)\"),")
//                }
//        }
//
//
//
//
//
//            }

            
            
//            for row in myStrings {
//
//                let row2 = row.replacingOccurrences(of: "Question", with: "LongQuestion")
//                let row3 = row2.replacingOccurrences(of: "swedish", with: "polish")
//
////                let sentence = "This is \"table\". There is an \"apple\" on the \"table\""
////
////                let pattern = "[[^\"]]" //everything between " and "
////                let replacement = ""
////                let newSentence = row.replacingOccurrences(
////                    of: pattern,
////                    with: replacement,
////                    options: .regularExpression
////                )
//
////                let replacedRow = row.replacingOccurrences(of: " \",", with: "\",")
////                let replacedRow2 = replacedRow.replacingOccurrences(of: " ,", with: ",")
////                let replacedRow3 = replacedRow2.replacingOccurrences(of: " \"),", with: "\"),")
////                print(replacedRow3) // This is ____. There is an ____ on the ____
////
////
//
//
//                if row.contains("|") {
//                    //print(row.slice(from: ">", to: "<")!)
//
//                    let fullNameArr = row.split{$0 == "|"}.map(String.init)
//                    // or simply:
//                    // let fullNameArr = fullName.characters.split{" "}.map(String.init)
//
//                    //let firstEdited = first.dropFirst()
//
//                    if (fullNameArr.count == 4) {
//                        //print("Question(swedish: \"\(fullNameArr[3].dropFirst())\", english1: \"\(fullNameArr[0].dropLast())\", english2: \"\(fullNameArr[1].dropLast().dropFirst())\", english3: \"\(fullNameArr[2].dropLast().dropFirst())\"),")
//                    }
//
//
//                }
//
//            }
//            for row in myStrings {
//
//                //print(String(row.prefix(10)))
//
//                if row.contains("–") {
//                    //print(row.slice(from: ">", to: "<")!)
//
//                    let fullNameArr = row.split{$0 == "–"}.map(String.init)
//                    // or simply:
//                    // let fullNameArr = fullName.characters.split{" "}.map(String.init)
//
//                    var first = fullNameArr[1]
//                    let firstEdited = first.dropFirst()
//                    print("Question(polish: \"\(firstEdited)\", english: \"\(fullNameArr[0].dropLast())\"),")
//
//                }
//
//            }
//
            
            //print(myStrings)
        } catch  {
            print(error);
        }
//        
        
        /*
        let all: String = "cut,skära#deal,handla#dig,gräva#do,göra#draw,dra#dream,drömma#drink,dricka#drive,öra#eat,äta#fall,falla#feed,mata#feel,känna#fight,slåss#find,hitta#flee,fly#fling,slänga#fly,flyga#forbid,förbjuda#forget,glömma#forgive,förlåten#freeze,frysa#get,få#give,ge#go,gå#grow,växa#hang,hänga#have,ha#hear,höra#hide,gömma#hit,träffa#hold,hålla#hurt,skada#keep,behålla#know,veta#lay,lägga#lead,leda#lean,luta#learn,lära#leave,lämna#lend,låna#let,låta#lie,ligga#light,tända#lose,förlora#make,göra#mean,betyda#meet,möta#pay,betala#put,ställa#quit,sluta#read,läsa#ride,rida#ring,ringa#rise,stiga#run,springa#say,säga#see,se#seek,söka#sell,sälja#send,skicka#set,sätta#shake,skaka#shine,skina#shoot,skjuta#show,visa#shrink,krympa#shut,stänga#sink,sjunka#sit,sitta#sleep,sova#slide,glida#smell,lukta#speak,tala#spell,stava#spend,tillbringa#spit,spotta#spread,sprida#stand,stå#steal,stjäla#stick,sticka#sting,stinga#stink,stinka#strike,slå#swear,svära#sweep,svepa#swim,simma#swing,svänga#take,ta#teach,lära#tear,riva#tell,berätta#think,tänka#throw,kasta#tread,trampa#understand,förstå#wake,väcka#wear,bära#weave,väva#weep,gråta#win,vinna#wring,vrida#write,skriva"
        
        let splitted: [String] = all.components(separatedBy: "#")
        // Question(swedish: "föra", english: "bring"),
        for pair in splitted {
            let splittedPair = pair.components(separatedBy: ",")
            
            //print("Question(swedish: \"\(splittedPair[1])\", english: \"\(splittedPair[0])\"),")
        }*/
        
        
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


extension String {
    
    func slice(from: String, to: String) -> String? {
        
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}


extension String {

    mutating func replace(from: String, to: String, by new: String) {
        guard let from = range(of: from)?.lowerBound, let to = range(of: to)?.upperBound else { return }

        let range = from..<to
        self = replacingCharacters(in: range, with: new)
    }

    func replaced(from: String, to: String, by new: String) -> String {
        guard let from = range(of: from)?.lowerBound, let to = range(of: to)?.upperBound else { return self }

        let range = from..<to
        return replacingCharacters(in: range, with: new)
    }

}
