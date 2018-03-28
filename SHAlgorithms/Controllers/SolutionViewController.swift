//
//  SolutionViewController.swift
//  SHAlgorithms
//
//  Created by Hemrom, Sheetal Swati on 8/23/17.
//  Copyright © 2017 Hemrom, Sheetal Swati. All rights reserved.
//

import UIKit

class SolutionViewController: UIViewController {
    
    
    @IBOutlet weak var enterNodes:UITextField?
    @IBOutlet weak var displayNodes:UILabel?
    @IBOutlet weak var node:UITextField?
    @IBOutlet weak var dependent:UITextField?
    @IBOutlet weak var displayDependencies:UILabel?
    @IBOutlet weak var solutionLabel:UILabel?
    //@IBOutlet weak var addNodes:UIButton?
    //@IBOutlet weak var addDependencies:UIButton?
    
    
    
    var question:Question?
    var nodes:[String] = []
    var dependencies:[[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNodes(_ sender : UIButton){
        nodes.append((enterNodes?.text)!)
        enterNodes?.text = ""
        var nodesToDisplay:String = ""
        for node in nodes{
            nodesToDisplay.append(node + ",")
        }
        displayNodes?.text = nodesToDisplay
    }
    
    
    @IBAction func addDependencies(_ sender : UIButton){
        let dependencyArray:[String] = [(node?.text)! , (dependent?.text)!]
        dependencies.append(dependencyArray)
        
        node?.text = ""
        dependent?.text = ""
        
        displayDependencies?.text = dependencies.description
        
    }
    
    @IBAction func calculate(_ sender : UIButton){
        calculateAnswer()
    }
    
    func calculateAnswer(){
        switch (question?.id)! {
        case 0:
            findBuildOrder()
            break
        case 1:
            findCommonAncestor(p: Node("7"),q: Node("17"))
            break
        default:
            break
        }
    }
    
    func findBuildOrder(){
        let buildOrderClass:BuildOrderWithDependencies = BuildOrderWithDependencies()
        let orderedNodesBFS:[GraphNode] = buildOrderClass.findBuildOrderBFS(nodes, dependencies)
        let orderedNodesDFS:[GraphNode] = buildOrderClass.findBuildOrderDFS(nodes, dependencies)
        var nodesToDisplayBFS:String = ""
        var nodesToDisplayDFS:String = ""
        for graphnode in orderedNodesBFS {
            nodesToDisplayBFS.append(graphnode.getName() + ",")
        }
        for graphnode in orderedNodesDFS {
            nodesToDisplayDFS.append(graphnode.getName() + ",")
        }
        solutionLabel?.text = "BFS : " + nodesToDisplayBFS + "and DFS : " + nodesToDisplayDFS
    }
    
    func findCommonAncestor(p: Node? , q:Node?){
        let treeNode  = Tree(nodenames: nodes)
        let commonAncestorClass:CommonAncestor = CommonAncestor(treeNode.treeNode! , isAncestor: false)
        let commonAncestor = commonAncestorClass.commonAncestor(p: p, q: q)
        solutionLabel?.text = "Common Ancestor is : " + commonAncestor!.node.getName()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
