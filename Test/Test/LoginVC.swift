import UIKit

protocol LoginvcDelegate 
{
    func push_login(name : String)
}

class LoginVC: UIViewController
{
    
    @IBOutlet weak var btn_Text: UITextField!
    
    @IBOutlet weak var btn_Password: UITextField!
    var delegate : LoginvcDelegate?
    var email = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.btn_Text.text = email
    }
    
    @IBAction func btn_SignIn(_ sender: UIButton)
    {
        self.delegate?.push_login(name : self.btn_Text.text!)
        self.dismiss(animated: true)
    }
    
    @IBAction func btn_CreateAccount(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SignupVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
