//
//  EnterNewPinVC.swift
//  Buyer
//
//  Created by yugansh on 31/01/24.
//

import UIKit

class EnterNewPinVC: UIViewController 
{

    @IBOutlet weak var txt_Number1: UITextField!
    
    @IBOutlet weak var txt_Number2: UITextField!
    
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_Back(_ sender: UIButton) 
    {
        self.popVC()
    }
    
    @IBAction func continu_btn(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC")
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}
