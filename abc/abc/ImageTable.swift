//
//  ImageTable.swift
//  abc
//
//  Created by yugansh on 24/01/24.
//

import UIKit

class ImageTable: UITableViewCell 
{

    @IBOutlet weak var img_Name: UIImageView!
    
    @IBOutlet weak var lab_Description: UILabel!
    
    @IBOutlet weak var lab_Name: UILabel!
    
    @IBOutlet weak var btn_Next: UIButton!
    
    var name = String()
    
    override func awakeFromNib() 
    {
        super.awakeFromNib()
        // Initialization code
        
        self.lab_Name.text = name
    }

    @IBAction func btn_Next(_ sender: UIButton) 
    {
        
    }
    
}
