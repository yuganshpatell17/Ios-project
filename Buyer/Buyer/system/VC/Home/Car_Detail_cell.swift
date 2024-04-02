//
//  Car_Detail_cell.swift
//  Broker_Project
//
//  Created by Sujan Bhayani on 04/02/24.
//

import UIKit

class Car_Detail_cell: UITableViewCell {

    @IBOutlet weak var Car_Image: UIImageView!
    
    @IBOutlet weak var Car_Name_lbl: UILabel!
    
    @IBOutlet weak var Car_Price_lbl: UILabel!
    
    @IBOutlet weak var Car_Distance_lbl: UILabel!
    
    @IBOutlet weak var Car_Gear_type_lbl: UILabel!
    
    @IBOutlet weak var Car_Fuel_type: UILabel!
    
    @IBOutlet weak var Car_Date_lbl: UILabel!
   
    @IBOutlet weak var Car_Owner_lbl: UILabel!
    
    @IBOutlet weak var Register_Number_lbl: UILabel!
    
    @IBOutlet weak var Car_Description_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
