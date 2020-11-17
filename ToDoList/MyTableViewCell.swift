//
//  MyTableViewCell.swift
//  ToDoList
//
//  Created by Assem Mukhamadi on 11/10/20.
//

import UIKit

protocol CustomCellDelegate:class {
    func customcell(cell:MyTableViewCell, didTappedThe button:UIButton?)
}

class MyTableViewCell: UITableViewCell {
    
    weak var cellDelegate:CustomCellDelegate?
    
    @IBOutlet weak var labelTextField: UILabel!
    
    @IBOutlet weak var buttonField: UIButton!
    
    @IBAction func cellButtonAction(_ sender: Any) {
        cellDelegate?.customcell(cell: self, didTappedThe: sender as? UIButton)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
