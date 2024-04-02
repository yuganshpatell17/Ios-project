//
//  OtpVC2.swift
//  Buyer
//
//  Created by yugansh on 31/01/24.
//

import UIKit
import AEOTPTextField

class OtpVC2: UIViewController 
{

    @IBOutlet weak var continu_btn: UIButton!
    
    @IBOutlet weak var OtpFlied: AEOTPTextField!
    
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        
        self.continu_btn.layer.cornerRadius = 10
        
        OtpFlied.otpDelegate = self
        OtpFlied.configure(with: 4)
        // Do any additional setup after loading the view.
    }


    @IBAction func continu_back_btn6(_ sender: UIButton) 
    {
        
        self.popVC()
    }
    
    @IBAction func continu_btn(_ sender: UIButton)
    {
        
        if self.OtpFlied.text!.isEmpty
        {
            
            let alert =  UIAlertController(title: "OTP", message:   "plese enter  full  otp  ", preferredStyle: .alert)
            
            let btn1 = UIAlertAction(title: "ok" , style : .default )
            alert.addAction(btn1)
            
            self.present(alert, animated: true )
            
        }
        
        else
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CreateNewPinVC")
                
            self.navigationController?.pushViewController(vc, animated: true)
                
        }

    }
}


extension OtpVC2 : AEOTPTextFieldDelegate
{
    func didUserFinishEnter(the code: String)
    {
        print(code)
    }
}
