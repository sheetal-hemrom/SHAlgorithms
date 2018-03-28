//
//  CommonAncestor.swift
//  SHAlgorithms
//
//  Created by Hemrom, Sheetal Swati on 9/6/17.
//  Copyright © 2017 Hemrom, Sheetal Swati. All rights reserved.
//

import Foundation

class CommonAncestor {
    let node:Node
    let isAncestor:Bool
    
    init(_ node:Node , isAncestor: Bool){
        self.node = node
        self.isAncestor = isAncestor
    }
    
    func commonAncestor(p: Node? , q:Node?)  -> CommonAncestor?{
       let commonAnc = findCommonAncestor(node, p: p, q: q)
        if (commonAnc?.isAncestor)!{
            return commonAnc
        }
        return nil
    }
    
    func findCommonAncestor(_ rootnode:Node? , p: Node? , q:Node?) -> CommonAncestor?{
        if (rootnode == nil){
            return nil
        }
        
        if rootnode!.getName() == p!.getName() && rootnode!.getName() == q!.getName(){
            return CommonAncestor(rootnode!,isAncestor: true)
        }
        
        let leftCommonAnc = findCommonAncestor(rootnode?.leftNode, p: p, q: q)
        if(leftCommonAnc?.isAncestor)!{
            return leftCommonAnc
        }
        
        let rightCommonAnc = findCommonAncestor(rootnode?.rightNode, p: p, q: q)
        if (rightCommonAnc?.isAncestor)!{
            return rightCommonAnc
        }
        
        if leftCommonAnc != nil && rightCommonAnc != nil{
            return CommonAncestor(rootnode!,isAncestor: true)
        }else if (rootnode?.getName() == p?.getName() || rootnode?.getName() == q?.getName()){
            let isAncestor:Bool = leftCommonAnc != nil || rightCommonAnc != nil
            return CommonAncestor(rootnode!,isAncestor: isAncestor)
        }else{
            let commonAnc:Node = (leftCommonAnc != nil ? leftCommonAnc!.node : rightCommonAnc!.node)
            return CommonAncestor(commonAnc,isAncestor: false)
        }
        
    }
    
}
