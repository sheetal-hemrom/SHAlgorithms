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
    
    func getOrCreateNode(_ name:String) -> GraphNode{
        if map.object(forKey: name) == nil{
            let node:GraphNode = GraphNode(name)
            nodes.append(node)
            map.setValue(node, forKey: name)
        }
        return map.object(forKey: name) as! GraphNode
    }
    
    
    func addEdge(root:String , dependent:String){
        let graphNodeRoot:GraphNode = GraphNode(root)
        let graphNodeDependent:GraphNode = GraphNode(dependent)
        graphNodeRoot.addNeighbour(graphNode: graphNodeDependent)
    }
    
    
    class func buildGraph(graphNodes : [String] , dependencies : [[String]]) -> Graph{
        let graph = Graph()
        
        //Create or add GraphNodes
        for element:String in graphNodes{
            graph.getOrCreateNode(element)
        }
        
        //Create dependencies
        for dependency:[String] in dependencies{
            if dependency.count >= 2{
                let root = dependency[0]
                let dependent = dependency[1]
                graph.addEdge(root: root, dependent: dependent)
            }
        }
        return graph
    }
    
    func getNodes() -> [GraphNode]{
        return nodes
    }
}
