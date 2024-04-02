//
//  InformationVC.swift
//  JanaavarAvaaj
//
//  Created by Yash Dhaduk on 13/03/24.
//

import UIKit

class InformationVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_parts(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PartsVC") as! PartsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_facts(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FactVC") as! FactVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func btn_Features(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FeaturesVC") as! FeaturesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
