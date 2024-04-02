//
//  TableViewCell1.swift
//  abc
//
//  Created by yugansh on 02/02/24.
//

import UIKit

class TableViewCell1: UITableViewCell 
{

    @IBOutlet weak var postId: UILabel!
    
    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var body: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) 
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
