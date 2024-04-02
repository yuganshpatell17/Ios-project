//
//  SenderTC.swift
//  
//
//  Created by yugansh on 15/02/24.
//

import UIKit

class SenderTC: UITableViewCell 
{

    @IBOutlet weak var massage_Lable: UILabel!
    
    @IBOutlet weak var image_View: UIImageView!
    
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
