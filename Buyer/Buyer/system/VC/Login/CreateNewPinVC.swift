//
//  CreateNewPinVC.swift
//  Buyer
//
//  Created by yugansh on 31/01/24.
//

import UIKit

class CreateNewPinVC: UIViewController 
{

    @IBOutlet weak var text_2: UITextField!
    
    @IBOutlet weak var text_1: UITextField!
  
    override func viewDidLoad() 
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let em = UIImage(named: "Lock copy")
        addleftimage(textFlied : text_2 , andimage : em!)

        let pass = UIImage(named: "Lock copy")
        addleftimage(textFlied : text_1 , andimage : pass!)
    }

    func   addleftimage(textFlied : UITextField , andimage img : UIImage)
    {
        let leftimageview = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 20, height: 20))
        leftimageview.image = img
        textFlied.leftView = leftimageview
        textFlied.leftViewMode = .always
    }
    
    @IBAction func btn_back(_ sender: UIButton) 
    {
        self.popVC()
    }
    @IBAction func continu_btn(_ sender: UIButton)
    {
        if self.text_1.text!.isEmpty || self.text_2.text!.isEmpty
        {
            
            let alert =  UIAlertController(title: "Pin number", message: "your text fild is empty ", preferredStyle: .alert)
  
            let btn1 = UIAlertAction(title: "ok" , style : .default)
            alert.addAction(btn1)
            
            self.present(alert, animated: true)
        }
        else
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC")
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
