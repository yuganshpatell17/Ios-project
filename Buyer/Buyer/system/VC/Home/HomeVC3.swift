//
//  HomeVC3.swift
//  Buyer
//
//  Created by yugansh on 05/02/24.
//

import UIKit

class HomeVC3: UIViewController 
{

    override func viewDidLoad() 
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Kia(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC4")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func Mustang(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC4")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func Hyundai(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC4")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
