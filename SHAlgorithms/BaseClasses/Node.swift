//
//  Node.swift
//  SHAlgorithms
//
//  Created by Hemrom, Sheetal Swati on 8/22/17.
//  Copyright © 2017 Hemrom, Sheetal Swati. All rights reserved.
//

import Foundation

class Node{
    var leftNode:Node? = nil
    var rightNode:Node? = nil
    private var value:NSNumber? = nil
    
    init(_ value:NSNumber) {
        self.value = value
    }
    
}
