//
//  EditProfileDetailsVC.swift
//  Buyer
//
//  Created by yugansh on 03/02/24.
//

import UIKit

class EditProfileDetailsVC: UIViewController 
{

    @IBOutlet weak var btn_Save: UIButton!
    
    @IBOutlet weak var txt_City: UITextField!
    
    @IBOutlet weak var txt_Name: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let em = UIImage(named: "frame")
        addleftimage(textFlied : txt_Name , andimage : em!)

        let pass = UIImage(named: "location")
        addleftimage(textFlied : txt_City , andimage : pass!)
        
        // Do any additional setup after loading the view.
        
        self.btn_Save.layer.cornerRadius = 10
    }
    
    func   addleftimage(textFlied : UITextField , andimage img : UIImage)
    {
        let leftimageview = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 20, height: 20))
        leftimageview.image = img
        textFlied.leftView = leftimageview
        textFlied.leftViewMode = .always
    }
    
    @IBAction func btn_Back(_ sender: Any) 
    {
        self.popVC()
    }
}
