//
//  Question.swift
//  Quizzler
//
//  Created by Evgeniy Uskov on 03/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let questionString: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionString = text
        answer = correctAnswer
    }
    
}
