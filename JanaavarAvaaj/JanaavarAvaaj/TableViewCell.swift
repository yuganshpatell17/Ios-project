//
//  TableViewCell.swift
//  JanaavarAvaaj
//
//  Created by Yash Dhaduk on 13/03/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var lbl_details: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
