//
//  Favourite1.swift
//  
//
//  Created by yugansh on 14/02/24.
//

import UIKit

class Favourite1: UITableViewCell 
{

    @IBOutlet weak var CarPrice: UILabel!
    
    @IBOutlet weak var CarName: UILabel!
    
    @IBOutlet weak var CarDistance: UILabel!
    
    @IBOutlet weak var CarGearType: UILabel!
    
    @IBOutlet weak var CarFuelType: UILabel!
    
    @IBOutlet weak var CarModelYear: UILabel!
    
    @IBOutlet weak var Name: UILabel!
    
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
