//
//  SplashScreen.swift
//  demo
//
//  Created by yugansh on 23/01/24.
//

import UIKit

class SplashScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                
        if UserDefaults.standard.bool(forKey: "isLogin"){
            
            push(vc: self, name: "HomeVC")
            
            
            
            
//            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")
//            
//            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    

}
