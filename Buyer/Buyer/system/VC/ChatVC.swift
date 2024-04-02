//
//  ChatVC.swift
//  Buyer
//
//  Created by yugansh on 01/02/24.
//

import UIKit

class ChatVC: UITableViewCell 
{

    @IBOutlet weak var profile_Image: UIImageView!
    
    @IBOutlet weak var lbl_Name: UILabel!
    
    @IBOutlet weak var Tik_image: UIImageView!
    
    @IBOutlet weak var lbl_LastMassage: UILabel!
    
    override func awakeFromNib() 
    {
        super.awakeFromNib()
        
        self.profile_Image.layer.cornerRadius = self.profile_Image.frame.width / 2
        
        self.profile_Image.clipsToBounds = true
        
        self.profile_Image.contentMode = .scaleAspectFill
        
    }
}
