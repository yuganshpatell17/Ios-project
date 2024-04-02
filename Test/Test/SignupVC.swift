import UIKit

class SignupVC: UIViewController
{

    @IBOutlet weak var btn_CreatAccount: UIButton!
    
    @IBOutlet weak var btn_Email: UITextField!
    
    @IBOutlet weak var btn_Password: UITextField!
    
    @IBOutlet weak var btn_RePassword: UITextField!
    
    var callback : ((String) -> Void)?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.btn_CreatAccount.layer.cornerRadius = self.btn_CreatAccount.frame.height / 2

    }
    

    @IBAction func btn_CreatAccount(_ sender: UIButton)
    {
//        let vc = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "Home")
//                
//        self.navigationController?.pushViewController(vc, animated: true)
        
        self.callback?(self.btn_Email.text!)
        self.dismiss(animated: true)
    }
}
