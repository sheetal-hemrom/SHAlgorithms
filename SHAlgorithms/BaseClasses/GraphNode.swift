//
//  GraphNode.swift
//  SHAlgorithms
//
//  Created by Hemrom, Sheetal Swati on 8/22/17.
//  Copyright © 2017 Hemrom, Sheetal Swati. All rights reserved.
//

import Foundation

class GraphNode{
    private var children:[GraphNode] = []
    private var neighborMap:NSMutableDictionary =  NSMutableDictionary()
    private var name:String
    private var dependencies:Int = 0
    
    init(_ name:String) {
        self.name = name
    }
    
    func addNeighbour(graphNode : GraphNode){
        if(neighborMap.object(forKey: graphNode.name) == nil){
            children.append(graphNode)
            neighborMap.setValue(graphNode, forKey: graphNode.name)
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
    
    func getName() -> String{
        return name
    }
    
}
