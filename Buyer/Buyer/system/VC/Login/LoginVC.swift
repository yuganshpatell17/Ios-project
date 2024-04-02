//
//  LoginVC.swift
//  Buyer
//
//  Created by yugansh on 25/01/24.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class LoginVC: UIViewController 
{
    @IBOutlet weak var btn_Login: UIButton!
    
    @IBOutlet weak var btn_ForgetPin: UIButton!
    
    @IBOutlet weak var btn_Back: UIButton!
    
    @IBOutlet weak var text_fild: UITextField!
    
    @IBOutlet weak var passsword_text_fild: UITextField!
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        
        self.btn_Login.layer.cornerRadius = self.btn_Login.frame.height / 2
        
        let em = UIImage(named: "Call")
        addleftimage(textFlied : text_fild , andimage : em!)

        let pass = UIImage(named: "Pass")
       addleftimage(textFlied : passsword_text_fild , andimage : pass!)
        

    }
    
    func   addleftimage(textFlied : UITextField , andimage img : UIImage)
    {
        let leftimageview = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 20, height: 20))
        leftimageview.image = img
        textFlied.leftView = leftimageview
        textFlied.leftViewMode = .always
    }
    
    @IBAction func btn_Back(_ sender: UIButton) 
    {
        self.popVC()
    }
    
    @IBAction func btn_ForgetPin(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "EnterPinVC")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Login(_ sender: UIButton) 
    {
        
        if  self.text_fild.text!.isEmpty || self.passsword_text_fild.text!.isEmpty 
        {
            
            let alert =  UIAlertController(title: "Login", message: "plese enter  Login ID or Password  ", preferredStyle: .alert)
            
            let btn1 = UIAlertAction(title: "ok" , style : .default )
            alert.addAction(btn1)
            
            self.present(alert, animated: true )
            
        }
        else if !(self.text_fild.text!.hasSuffix("@gmail.com"))
        {
            
            let alert =  UIAlertController(title: "Wrong Email Id", message: "Your email id has no word ilke @gmail.com", preferredStyle: .alert)
            
            let btn1 = UIAlertAction(title: "ok" , style : .default )
            alert.addAction(btn1)
            
            self.present(alert, animated: true )
            
        }
        else if  passsword_text_fild.text!.count <= 7 
        {
            let alert =  UIAlertController(title: "Wrong password lenth", message: "minimum password caractor is 7 ", preferredStyle: .alert)
            
            let btn1 = UIAlertAction(title: "ok" , style : .default )
            alert.addAction(btn1)
            
            self.present(alert, animated: true )
        }
        else
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "OtpVC")
            
            self.navigationController?.pushViewController(vc, animated: true)
            
            userinfo(email: text_fild.text ?? "", password: passsword_text_fild.text ?? "")
        }

    }
    
    @IBAction func btn_Signup(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegisterVC")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

