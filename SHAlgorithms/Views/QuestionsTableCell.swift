//
//  QuestionsTableCell.swift
//  SHAlgorithms
//
//  Created by Hemrom, Sheetal Swati on 8/23/17.
//  Copyright © 2017 Hemrom, Sheetal Swati. All rights reserved.
//

import UIKit

class QuestionsTableCell: UITableViewCell {

    @IBOutlet weak var questionLabel:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func formatCell(_ question: Question){
        questionLabel?.text = question.question
    }

}
