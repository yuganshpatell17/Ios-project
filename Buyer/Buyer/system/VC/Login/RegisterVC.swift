//
//  RegisterVC.swift
//  Buyer
//
//  Created by yugansh on 31/01/24.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class RegisterVC: UIViewController 
{

    @IBOutlet weak var txt_Mobile: UITextField!
    
    @IBOutlet weak var city_name: UITextField!
   
    @IBOutlet weak var text_fild: UITextField!
    
    static var name = ""
    
    static var email = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let em = UIImage(named: "frame")
        addleftimage(textFlied : text_fild , andimage : em!)

        let pass = UIImage(named: "location")
        addleftimage(textFlied : city_name , andimage : pass!)
        
        let pass2 = UIImage(named: "Call")
        addleftimage(textFlied : txt_Mobile , andimage : pass2!)
        
    }
    
    func   addleftimage(textFlied : UITextField , andimage img : UIImage)
    {
        let leftimageview = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 20, height: 20))
        leftimageview.image = img
        textFlied.leftView = leftimageview
        textFlied.leftViewMode = .always
    }
    
    @IBAction func sing_up_btn(_ sender: UIButton)
    {
       
        if  self.text_fild.text!.isEmpty || self.city_name.text!.isEmpty || self.txt_Mobile.text!.isEmpty
        {
            
            let alert =  UIAlertController(title: "sing UP", message:   "plese enter  your full name , city , and mobile number  ", preferredStyle: .alert)
            
            let btn1 = UIAlertAction(title: "ok" , style : .default )
            alert.addAction(btn1)
            
            self.present(alert, animated: true )
            
        }
        else if  self.txt_Mobile.text!.count != 10
        {
            let alert =  UIAlertController(title: "Wrong Mobile number", message:   "minimum password caractor is 10 ", preferredStyle: .alert)
            
            let btn1 = UIAlertAction(title: "ok" , style : .default )
            alert.addAction(btn1)
            
            self.present(alert, animated: true )
        }
        else
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "OtpVC2")
            
            self.navigationController?.pushViewController(vc, animated: true)
            
            RegisterVC.name = city_name.text!
            
            RegisterVC.email = text_fild.text!
            
            UserDefaults.standard.set(text_fild.text!, forKey: "email")
            UserDefaults.standard.set(city_name.text!, forKey: "name")
            
            userinfo1(Mobile: txt_Mobile.text ?? "", City: city_name.text ?? "", Name: text_fild.text ?? "")
        }
    }
    
    @IBAction func back_button_5(_ sender: UIButton) 
    {
        self.popVC()
    }
    
    
    @IBAction func login_btn(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginVC")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


// yugansh patel
