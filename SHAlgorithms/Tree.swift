//
//  Tree.swift
//  SHAlgorithms
//
//  Created by Hemrom, Sheetal Swati on 9/6/17.
//  Copyright © 2017 Hemrom, Sheetal Swati. All rights reserved.
//

import Foundation

class Tree{
    
    var treeNode:Node?
    private var nodes:NSMutableArray = []
    
    init(nodenames:[String]) {
        treeNode = buildBST(nodes: nodes(nodes: nodenames), start: 0, end: nodenames.count-1)
    }
    
    private func buildBST(nodes:[Node], start:Int , end:Int) -> Node?{
        if(end<start){
            return nil
        }
        let mid = nodes.count/2
        let root:Node = self.nodes[mid] as! Node
        root.leftNode = buildBST(nodes: nodes, start: start, end: mid-1)
        root.rightNode = buildBST(nodes: nodes, start: mid+1, end: end)
        return root
    }
    
    private func nodes(nodes:[String]) -> [Node]{
        for item in nodes {
            self.nodes.add(Node(item))
        }
        return self.nodes as! [Node]
    }
    
}
