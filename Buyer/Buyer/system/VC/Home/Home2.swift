//
//  Home2.swift
//  Buyer
//
//  Created by yugansh on 03/02/24.
//

import UIKit

class Home2: UITableViewCell 
{

    @IBOutlet weak var CarName: UILabel!
    
    @IBOutlet weak var CarImage: UIImageView!
    
    @IBOutlet weak var CarPrice: UILabel!
    
    @IBOutlet weak var CarDistance: UILabel!
    
    @IBOutlet weak var CarGearType: UILabel!
    
    @IBOutlet weak var CarType: UILabel!
    
    @IBOutlet weak var CarDate: UILabel!
    
    @IBOutlet weak var Time: UILabel!
    
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
