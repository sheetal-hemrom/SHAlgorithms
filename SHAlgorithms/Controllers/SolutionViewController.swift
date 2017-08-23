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
    var projects:[String] = []
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
        projects.append((enterNodes?.text)!)
        enterNodes?.text = ""
        var nodesToDisplay:String = ""
        for project in projects{
            nodesToDisplay.append(project + ",")
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
        
        let buildOrderClass:BuildOrderWithDependencies = BuildOrderWithDependencies()
        let orderedNodesBFS:[GraphNode] = buildOrderClass.findBuildOrderBFS(projects, dependencies)
        let orderedNodesDFS:[GraphNode] = buildOrderClass.findBuildOrderDFS(projects, dependencies)
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
