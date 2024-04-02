//
//  HomeVC4.swift
//  Buyer
//
//  Created by yugansh on 05/02/24.
//

import UIKit

class HomeVC4: UIViewController 
{

    override func viewDidLoad() 
    {
        super.viewDidLoad()

        let alert = UIAlertController(title: "Delete ", message: "Lorem ipsum dolor sit amet consectetur. Molestie egestas donec rutrum fames. Aliquam velit blandit risus ullamcorper velit faucibus scelerisque viverra sit. Rutrum sagittis turpis odio commodo ", preferredStyle: .alert)
        
        let btn1 = UIAlertAction(title: "Confirm", style: .default)
//         let btn2 = UIAlertAction(title: "Yes", style: .destructive)
        let btn2 = UIAlertAction(title: "Yes", style: .destructive)
        {
            i in
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC5")
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        alert.addAction(btn1)
        alert.addAction(btn2)
        
        self.present(alert, animated: true)
        
    }

}
