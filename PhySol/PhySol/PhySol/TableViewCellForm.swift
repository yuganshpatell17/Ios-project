//
//  TableViewCellForm.swift
//  PhySol
//
//  Created by SUJAL on 3/19/24.
//

import UIKit

class TableViewCellForm: UITableViewCell {

    @IBOutlet weak var lbl_formula_name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.lbl_formula_name.layer.cornerRadius = self.lbl_formula_name.frame.height / 2
        self.lbl_formula_name.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
