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
            
            //var newStrings:[String] = myStrings.reversed()
            //newStrings.remove(at: 0)
            
            //for i in 0...(myStrings.count) {
                //if (i % 2 == 0) {
                    //print("Question(swedish: \"\(newStrings[i])\", english: \"\(newStrings[i+1])\"),")
                //}
            //}

            var i = 0
            print("b1b2 count:")
            print(myStrings.count)
            for row in myStrings {
                
                //print(String(row.prefix(10)))
                
                if row.contains("–") {
                    //print(row.slice(from: ">", to: "<")!)
                    
                    let fullNameArr = row.split{$0 == "–"}.map(String.init)
                    // or simply:
                    // let fullNameArr = fullName.characters.split{" "}.map(String.init)

                    var first = fullNameArr[1]
                    let firstEdited = first.dropFirst()
                    print("Question(swedish: \"\(fullNameArr[0].dropLast())\", english: \"\(firstEdited)\"),")

                }
                
                
                

                
                //let verbs:[String] = row.components(separatedBy: " ")
                
                
                
                
                /*if (verbs.count == 4) {
                    print("LongQuestion(polish: \"\(verbs[3])\", english1: \"\(verbs[0])\", english2: \"\(verbs[1])\", english3: \"\(verbs[2])\"),")
                }
                else if (verbs.count == 5) {
                    print("LongQuestion(polish: \"\(verbs[3]) \(verbs[4])\", english1: \"\(verbs[0])\", english2: \"\(verbs[1])\", english3: \"\(verbs[2])\"),")
                }
                else if (verbs.count == 6) {
                    print("LongQuestion(polish: \"\(verbs[3]) \(verbs[4]) \(verbs[5])\", english1: \"\(verbs[0])\", english2: \"\(verbs[1])\", english3: \"\(verbs[2])\"),")
                }
                else if (verbs.count == 7) {
                    print("LongQuestion(polish: \"\(verbs[3]) \(verbs[4]) \(verbs[5]) \(verbs[6])\", english1: \"\(verbs[0])\", english2: \"\(verbs[1])\", english3: \"\(verbs[2])\"),")
                }
                else if (verbs.count == 8) {
                    print("LongQuestion(polish: \"\(verbs[3]) \(verbs[4]) \(verbs[5]) \(verbs[6]) \(verbs[7])\", english1: \"\(verbs[0])\", english2: \"\(verbs[1])\", english3: \"\(verbs[2])\"),")
                }
                else if (verbs.count == 9) {
                    print("LongQuestion(polish: \"\(verbs[3]) \(verbs[4]) \(verbs[5]) \(verbs[6]) \(verbs[7]) \(verbs[8])\", english1: \"\(verbs[0])\", english2: \"\(verbs[1])\", english3: \"\(verbs[2])\"),")
                }*/
                
                
              
                //print("One: \(verbs[0]!) two: \(verbs[1]!) three: \(verbs[2]!) four: \(verbs[3] ?? "") \(verbs[4] ?? "") \(verbs[5] ?? "") \(verbs[6] ?? "") \(verbs[7] ?? "") \(verbs[8] ?? "") \(verbs[9] ?? "")")
                
                /*let splittedPair = pair.components(separatedBy: " - ")
                
                print("Question(swedish: \"\(splittedPair[0])\", english: \"\(splittedPair[1])\"),")*/
            }
            print(i)
            
            
            //print(myStrings)
        } catch  {
            print(error);
        }
        
        
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
