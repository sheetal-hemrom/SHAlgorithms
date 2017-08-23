//
//  Node.swift
//  SHAlgorithms
//
//  Created by Hemrom, Sheetal Swati on 8/22/17.
//  Copyright © 2017 Hemrom, Sheetal Swati. All rights reserved.
//

import Foundation

enum VISITED {
    case NEVER
    case PARTIALLY
    case COMPLETE
}

class Node{
    var leftNode:Node? = nil
    var rightNode:Node? = nil
    private var name:String?
    var state:VISITED = VISITED.NEVER
    
    init(_ name:String) {
        self.name = name
    }
    
    func getName() -> String {
        return self.name!
    }
}
