import UIKit

class ViewController: UIViewController 
{
    @IBOutlet weak var btn_Signin: UIButton!

    @IBOutlet weak var btn_EmailId: UITextField!
    
    @IBOutlet weak var btn_Password: UITextField!
    
    var email : String = ""
    var pass : String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.btn_Signin.layer.cornerRadius = 25
    }
    
    @IBAction func btn_Back(_ sender: UIButton) 
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_SignIN(_ sender: UIButton) {
        
        UserDefaults.standard.setValue(true, forKey: "isLogin")
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")
        //
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
//    {
//        self.email = self.btn_EmailId.text!
//        self.pass = self.btn_Password.text!
//        
//        if self.email.hasSuffix(".com") 
//        {
//            
//            if self.pass.count == 6
//            {
//                
//                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController_5")
//                
//                self.navigationController?.pushViewController(vc, animated: true)
//                
//            }
//            else
//            {
//                
//                let alert = UIAlertController(title: "Invalid Information", message: "Invalid email-id and password", preferredStyle: .alert)
//                
//                let btn1 = UIAlertAction(title: "OK", style: .default)
//                
//                alert.addAction(btn1)
//                
//                self.present(alert, animated: true)
//                
//            }
//        }
//    }
}
