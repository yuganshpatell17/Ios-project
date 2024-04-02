//
//  EnterPinVC.swift
//  Buyer
//
//  Created by yugansh on 31/01/24.
//

import UIKit

class EnterPinVC: UIViewController 
{
    @IBOutlet weak var text_num_filed: UITextField!
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func mobil_num_vc(_ sender: UIButton)
    {
        if  self.text_num_filed.text!.count != 10
        {
            let alert =  UIAlertController(title: "Wrong Number", message:   "plese enter  Vaild number  ", preferredStyle: .alert)
            
            let btn1 = UIAlertAction(title: "ok" , style : .default )
            alert.addAction(btn1)
            
            self.present(alert, animated: true )
            
        }
        
        else 
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "OtpVC3")
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @IBAction func back_btn2(_ sender: UIButton) 
    {
        
        self.popVC()
        
    }
}
