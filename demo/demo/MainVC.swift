import UIKit

class MainVC: UIViewController
{

    @IBOutlet weak var loder: UIActivityIndicatorView!
    
    @IBOutlet weak var btn_SignUPFree: UIButton!
    
    @IBOutlet weak var btn_LogIn: UIButton!
    
    @IBOutlet weak var btn_ContinueWithGoogle: UIButton!
    
    @IBOutlet weak var btn_ContinueWithFacebook: UIButton!
    
    @IBOutlet weak var btn_ContinueWithApple: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.loder.isHidden = true
        self.loder.style = .large
        
        self.btn_SignUPFree.layer.cornerRadius = self.btn_SignUPFree.frame.height / 2
        self.btn_LogIn.layer.cornerRadius = self.btn_LogIn.frame.height / 2
        self.btn_ContinueWithGoogle.layer.cornerRadius = self.btn_ContinueWithGoogle.frame.height / 2
        self.btn_ContinueWithFacebook.layer.cornerRadius = self.btn_ContinueWithFacebook.frame.height / 2
        self.btn_ContinueWithApple.layer.cornerRadius = self.btn_ContinueWithApple.frame.height / 2
        
        self.btn_SignUPFree.layer.borderWidth = 1
        self.btn_LogIn.layer.borderWidth = 1
        self.btn_ContinueWithGoogle.layer.borderWidth = 1
        self.btn_ContinueWithFacebook.layer.borderWidth = 1
        self.btn_ContinueWithApple.layer.borderWidth = 1
        
        self.btn_SignUPFree.layer.borderColor = UIColor.darkGray.cgColor
        self.btn_LogIn.layer.borderColor = UIColor.darkGray.cgColor
        self.btn_ContinueWithGoogle.layer.borderColor = UIColor.darkGray.cgColor
        self.btn_ContinueWithFacebook.layer.borderColor = UIColor.darkGray.cgColor
        self.btn_ContinueWithApple.layer.borderColor = UIColor.darkGray.cgColor
        
    }
    @IBAction func btn_SignUpFree(_ sender: UIButton)
    {
        self.loder.isHidden = false
        self.loder.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.loder.stopAnimating()
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController_2")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    
    @IBAction func btn_LogIn(_ sender: UIButton)
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
