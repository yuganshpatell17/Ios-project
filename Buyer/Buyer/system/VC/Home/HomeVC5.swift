//
//  HomeVC5.swift
//  Buyer
//
//  Created by yugansh on 05/02/24.
//

import UIKit

class HomeVC5: UIViewController 
{

    override func viewDidLoad() 
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func Delete(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Car_Detail_vc")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
