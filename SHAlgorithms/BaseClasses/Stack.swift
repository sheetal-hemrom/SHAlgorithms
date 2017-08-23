//
//  Stack.swift
//  SHAlgorithms
//
//  Created by Hemrom, Sheetal Swati on 8/23/17.
//  Copyright © 2017 Hemrom, Sheetal Swati. All rights reserved.
//

import Foundation

class Stack{
    private var elements:[Node] = []
    
    func push(_ node : Node){
        elements.append(node)
    }
    
    func pop() -> Node?{
        if(elements.count == 0){
            return nil
        }
        let node = elements.remove(at: elements.count - 1)
        return node
    }
    
    func peek() -> Node?{
        if(elements.count == 0){
            return nil
        }
        let node = elements[elements.count - 1]
        return node
    }
    
    func getElelments() -> [Node]{
        return elements.reversed()
    }
    
}
