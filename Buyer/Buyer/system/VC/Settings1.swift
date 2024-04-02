//
//  Settings1.swift
//  
//
//  Created by yugansh on 14/02/24.
//

import UIKit

class Settings1: UITableViewCell 
{

    @IBOutlet weak var lbl_Name: UILabel!
    
    @IBOutlet weak var image_View: UIImageView!
    
    @IBOutlet weak var btn_Tab: UIButton!
    
    
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
