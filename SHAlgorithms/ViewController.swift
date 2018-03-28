//
//  ViewController.swift
//  SHAlgorithms
//
//  Created by Hemrom, Sheetal Swati on 8/22/17.
//  Copyright © 2017 Hemrom, Sheetal Swati. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var questionTable:UITableView?
    var questions:[Question] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionTable?.estimatedRowHeight = 100
        questionTable?.rowHeight = UITableViewAutomaticDimension
        addQuestions()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: TableView Delegate/Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:QuestionsTableCell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! QuestionsTableCell
        cell.formatCell(questions[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "solution", sender: questions[indexPath.row])
    }
    
    func addQuestions(){
        let question = Question("You are given a list of projects(GraphNodes) and list of dependencies(which is a list of pairs of projects , where the first project is dependent on the second  project). All of project's dependencies must be built before the project is. Find a build order that will allow projects to be built. If there is no valid build order , return a error", id: questions.count)
        questions.append(question)
        
        let question2 = Question("Design an algorithm and write code to find the first common ancestor of two nodes in a binary tree. Avoid storing additional nodes in a data structure. N:B: This is not necessarily a binary serach tree", id: questions.count)
        questions.append(question2)
        
        questionTable?.delegate = self
        questionTable?.dataSource = self
        questionTable?.reloadData()
    }
    
    
    //MARK:Seque methids
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "solution"{
            let solutionsVC:SolutionViewController = segue.destination as! SolutionViewController
            solutionsVC.question = sender as? Question
            
        }
    }
}

