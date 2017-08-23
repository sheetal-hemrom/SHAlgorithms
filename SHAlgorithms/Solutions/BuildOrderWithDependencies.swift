//
//  BuildOrderWithDependencies.swift
//  SHAlgorithms
//
//  Created by Hemrom, Sheetal Swati on 8/23/17.
//  Copyright © 2017 Hemrom, Sheetal Swati. All rights reserved.
//

// You are given a list of projects(GraphNodes) and list of dependencies(which is a list of pairs of projects , where the first project is dependent on the second  project). All of project's dependencies must be built before the project is. Find a build order that will allow projects to be built. If there is no valid build order , return a error

import Foundation


class BuildOrderWithDependencies{
    
    
    
    func findBuildOrder(_ projects : [String] , _ dependencies : [[String]]) -> [GraphNode]
    {
        // Dependencies should be in format : (d,a),(b,f),(a,d)
        
        let graph = Graph.buildGraph(graphNodes: projects, dependencies: dependencies)
        return orderProjectsBFS(projects: graph.getNodes())
    }
    
    func orderProjectsBFS(projects : [GraphNode]) -> [GraphNode]{
        var orderedGraphNodes:[GraphNode?] = []
        var endOfOrderedListOffset = 0
        
        // Add all the nondependents to order list since this projects will be executed first and increment the ordered list offset
        endOfOrderedListOffset = addNonDependentToOrderedList(list: &orderedGraphNodes, projects: projects, offset: &endOfOrderedListOffset)
        
        var theOneProcessingOffset = 0
        while theOneProcessingOffset < projects.count {
            let currentProject = orderedGraphNodes[theOneProcessingOffset]
            
            if currentProject == nil {
                return []
            }
            // Start decrementing ordered list dependencies .
            for child:GraphNode in currentProject!.getChildren(){
                child.decrementDependencies()
            }
            
            // Now add the children with no dependencies in the ordered graph list
            endOfOrderedListOffset = addNonDependentToOrderedList(list: &orderedGraphNodes, projects: currentProject!.getChildren(), offset: &endOfOrderedListOffset)
            theOneProcessingOffset += 1
            
        }
        return orderedGraphNodes as! [GraphNode]
    }
    
    
    func addNonDependentToOrderedList( list : inout [GraphNode?] , projects : [GraphNode] , offset : inout Int) -> Int{
        for node:GraphNode in projects
        {
            if (node.getDependencies() == 0) {
                list[offset] = node
                offset += 1
            }
        }
        return offset
    }
    
}
