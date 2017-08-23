//
//  Question.swift
//  SHAlgorithms
//
//  Created by Hemrom, Sheetal Swati on 8/23/17.
//  Copyright © 2017 Hemrom, Sheetal Swati. All rights reserved.
//

import UIKit

class Question: NSObject {
    var question:String?
    var id:Int
    
    init(_ question : String , id : Int) {
        self.question = question
        self.id = id
    }
}
