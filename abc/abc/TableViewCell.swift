//
//  TableViewCell.swift
//  abc
//
//  Created by yugansh on 02/02/24.
//

import UIKit

class TableViewCell: UITableViewCell 
{

    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var street: UILabel!
    
    @IBOutlet weak var suite: UILabel!
    
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var zipcode: UILabel!
    
    @IBOutlet weak var geo: UILabel!
    
    @IBOutlet weak var lat: UILabel!
    
    @IBOutlet weak var lng: UILabel!
    
    @IBOutlet weak var phone: UILabel!
    
    @IBOutlet weak var website: UILabel!
    
    @IBOutlet weak var company: UILabel!
    
    @IBOutlet weak var name2: UILabel!
    
    @IBOutlet weak var catchPhrase: UILabel!
    
    @IBOutlet weak var bs: UILabel!
    
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
