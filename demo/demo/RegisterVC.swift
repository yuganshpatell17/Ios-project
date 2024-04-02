import UIKit

class RegisterVC: UIViewController
{

    @IBOutlet weak var btn_Registration: UIButton!

    @IBOutlet weak var btn_Email: UITextField!
    
    @IBOutlet weak var btn_RePass: UITextField!
    
    @IBOutlet weak var btn_Pass: UITextField!
    
    
    var email : String = ""
    var pass : String = ""
    var repass : String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.btn_Registration.layer.cornerRadius = 25
    }

    @IBAction func btn_Back(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btn_CreatAccount(_ sender: UIButton)
    {
        
        self.email = self.btn_Email.text!
        self.pass = self.btn_Pass.text!
        self.repass = self.btn_RePass.text!
        
        if self.email.hasSuffix(".com")
        {
            if self.pass.count == 6
            {
                if self.repass == self.pass
                {
                    
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController_5")
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                
                       
                }
                else
                {
                    
                    let alert = UIAlertController(title: "Invalid Information", message: "Invalid email-id and password", preferredStyle: .alert)
                    
                    let btn1 = UIAlertAction(title: "OK", style: .default)
                    
                    alert.addAction(btn1)
                    
                    self.present(alert, animated: true)
                    
                }
            }
        }
    }
}
