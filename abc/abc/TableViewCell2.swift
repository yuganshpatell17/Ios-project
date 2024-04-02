//
//  TableViewCell2.swift
//  abc
//
//  Created by yugansh on 03/02/24.
//

import UIKit

class TableViewCell2: UITableViewCell 
{

    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var description1: UILabel!
    
    @IBOutlet weak var category: UILabel!
    
    @IBOutlet weak var image1: UIImageView!
    
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
