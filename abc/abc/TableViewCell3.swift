//
//  TableViewCell3.swift
//  abc
//
//  Created by yugansh on 03/02/24.
//

import UIKit

class TableViewCell3: UITableViewCell 
{

    @IBOutlet weak var albumId: UILabel!
    
    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var url: UIImageView!
    
    @IBOutlet weak var thumbnailUrl: UIImageView!
    
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
