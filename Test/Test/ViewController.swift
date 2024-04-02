import UIKit

class ViewController: UIViewController, LoginvcDelegate
{
    @IBOutlet weak var btn_Login: UIButton!
    
    @IBOutlet weak var btn_SignUp: UIButton!
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        
        self.btn_Login.layer.cornerRadius = self.btn_Login.frame.height / 2
        self.btn_SignUp.layer.cornerRadius = self.btn_SignUp.frame.height / 2
    }

    @IBAction func btn_Login(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginVC") as! LoginVC
    
        vc.email = ""
        
        vc.delegate = self
    
        self.present(vc, animated: true)
    }
    
    @IBAction func btn_SignUp(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SignupVC") as! SignupVC
            
        vc.callback = { name in
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Home") as! Home
            vc.name = name
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        self.present(vc, animated: true)
    }
    
    func push_login(name : String )
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home") as! Home
        vc.name = name
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func push_create() 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home") as! Home
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
