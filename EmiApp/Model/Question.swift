//
//  Question.swift
//  EmiApp
//
//  Created by Sebastian Strus on 2019-04-07.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//


struct Question {
    let polish: String
    let english: String
    let examples: [String?]?

    init(polish: String, english: String, examples: [String?]? = nil) {
        self.polish = polish
        self.english = english
        self.examples = examples
    }
}
