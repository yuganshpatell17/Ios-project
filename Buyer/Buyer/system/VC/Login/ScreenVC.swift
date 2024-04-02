//
//  ScreenVC.swift
//  Buyer
//
//  Created by yugansh on 25/01/24.
//

import UIKit

class ScreenVC: UIViewController 
{

    @IBOutlet weak var btn_Signup: UIButton!
    
    @IBOutlet weak var btn_Login: UIButton!
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        
        userinfo2()

        // Do any additional setup after loading the view.
        
        self.btn_Login.layer.cornerRadius = 10
        
        self.btn_Signup.layer.cornerRadius = 10
        
        self.btn_Signup.layer.borderWidth = 1
        
        self.btn_Signup.layer.borderColor = UIColor.white.cgColor
        
        
        if UserDefaults.standard.bool(forKey: "isLogin")
        {
            push(vc: self, name: "HomeVC")
        }
        else
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC")
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @IBAction func btn_Login(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginVC")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Signup(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegisterVC")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
