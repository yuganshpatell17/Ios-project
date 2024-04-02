//
//  Add_Inventory_vc.swift
//  Buyer
//
//  Created by yugansh on 05/02/24.
//

import UIKit

class Add_Inventory_vc: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate 
{

    @IBOutlet weak var Brand_name_lbl: UITextField!
     
    @IBOutlet weak var Model_Name_lbl: UITextField!
    
    @IBOutlet weak var Register_Number_lbl: UITextField!
    
    @IBOutlet weak var Price_lbl: UITextField!
    
    @IBOutlet weak var Fuel_lbl: UITextField!
    
    @IBOutlet weak var Kms_lbl: UITextField!
    
    @IBOutlet weak var Transmission_lbl: UITextField!
    
    @IBOutlet weak var Owner_name_lbl: UITextField!
    
    @IBOutlet weak var Year_lbl: UITextField!
    
    @IBOutlet weak var Description_lbl: UITextField!
    
    @IBOutlet weak var Car_image: UIImageView!
    
    var image = UIImage()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        
    }

    @IBAction func Save_btn(_ sender: UIButton) 
    {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavouriteVC") as! FavouriteVC
            
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func Add_Image_btn(_ sender: UIImage) 
    {
        let s_img1 = UIImagePickerController()
        
        s_img1.sourceType = .photoLibrary
        
        s_img1.allowsEditing = true
        
        s_img1.delegate = self
        
        self.present(s_img1, animated: true)
    }
    
    @IBAction func btn_Back(_ sender: UIButton) 
    {
        self.popVC()
    }
    
}

