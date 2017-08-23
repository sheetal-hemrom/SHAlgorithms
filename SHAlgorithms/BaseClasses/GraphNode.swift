//
//  GraphNode.swift
//  SHAlgorithms
//
//  Created by Hemrom, Sheetal Swati on 8/22/17.
//  Copyright © 2017 Hemrom, Sheetal Swati. All rights reserved.
//

import Foundation

class GraphNode:Node{
    private var children:[GraphNode] = []
    private var neighborMap:NSMutableDictionary =  NSMutableDictionary()
    private var dependencies:Int = 0
    
    func addNeighbour(graphNode : GraphNode){
        if(neighborMap.object(forKey: graphNode.getName()) == nil){
            children.append(graphNode)
            neighborMap.setValue(graphNode, forKey: graphNode.getName())
            graphNode.incrementDependencies()
        }
    }
    
    func incrementDependencies(){
        dependencies += 1
    }
    
    func decrementDependencies(){
        dependencies -= 1
    }
    
    func getChildren() -> [GraphNode]{
        return children
    }
    
    func getDependencies() -> Int{
        return dependencies
    }
    
}
