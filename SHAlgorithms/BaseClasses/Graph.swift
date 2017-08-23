//
//  Graph.swift
//  SHAlgorithms
//
//  Created by Hemrom, Sheetal Swati on 8/22/17.
//  Copyright © 2017 Hemrom, Sheetal Swati. All rights reserved.
//

import Foundation

class Graph{
    private var nodes:[GraphNode] = []
    private var map:NSMutableDictionary = NSMutableDictionary()
    
    func getNode(_ name:String) -> GraphNode{
        if map.object(forKey: name) == nil{
            let node:GraphNode = GraphNode(name)
            nodes.append(node)
            map.setValue(node, forKey: name)
        }
        return map.object(forKey: name) as! GraphNode
    }
    
    func addEdge(startName:String , endName:String){
        let graphNodeStart:GraphNode = GraphNode(startName)
        let graphNodeEnd:GraphNode = GraphNode(endName)
        graphNodeStart.addNeighbour(graphNode: graphNodeEnd)
    }
}
