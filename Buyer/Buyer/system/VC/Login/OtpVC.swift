//
//  OtpVC.swift
//  Buyer
//
//  Created by yugansh on 31/01/24.
//

import UIKit
import AEOTPTextField

class OtpVC: UIViewController 
{

    @IBOutlet weak var continu_btn: UIButton!
    
    @IBOutlet weak var OtpFiled: AEOTPTextField!
    
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.continu_btn.layer.cornerRadius = 10
        
        OtpFiled.otpDelegate = self
        OtpFiled.configure(with: 4)
        
    }
    

    @IBAction func back_button(_ sender: UIButton)
    {
        
        self.popVC()
        
    }
    
    @IBAction func continu_vc(_ sender: UIButton) 
    {
        if self.OtpFiled.text!.isEmpty
        {
            
            let alert =  UIAlertController(title: "OTP", message:   "plese enter  full  otp  ", preferredStyle: .alert)
            
            let btn1 = UIAlertAction(title: "ok" , style : .default )
            alert.addAction(btn1)
            
            self.present(alert, animated: true )
            
        }
        
        else
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC")
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    
    }
}

extension OtpVC : AEOTPTextFieldDelegate
{
    func didUserFinishEnter(the code: String) 
    {
        print(code)
    }
}
