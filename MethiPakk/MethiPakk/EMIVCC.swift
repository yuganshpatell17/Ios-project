 
import UIKit

class EMIVCC: UIViewController {

    
    @IBOutlet weak var b3: UIView!
    @IBOutlet weak var b2: UIView!
    @IBOutlet weak var b1: UIView!
    @IBOutlet weak var principalTextField: UITextField!
    @IBOutlet weak var interestRateTextField: UITextField!
    @IBOutlet weak var tenureTextField: UITextField!
    @IBOutlet weak var emiLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.b1.layer.cornerRadius = self.b1.frame.height / 2
        self.b2.layer.cornerRadius = self.b2.frame.height / 2
        self.b3.layer.cornerRadius = self.b3.frame.height / 2
        self.b1.layer.borderWidth = 1
        self.b2.layer.borderWidth = 1
        self.b3.layer.borderWidth = 1
        self.b1.layer.borderColor = UIColor.white.cgColor
        self.b2.layer.borderColor = UIColor.white.cgColor
        self.b3.layer.borderColor = UIColor.white.cgColor
        
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if #available(iOS 13.0, *) {
            appDelegate.deviceOrientation = .landscapeRight
            let value = UIInterfaceOrientation.landscapeRight.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        } else {
            // Fallback on earlier versions
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if #available(iOS 13.0, *) {
            appDelegate.deviceOrientation = .portrait
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        } else {
            // Fallback on earlier versions
        }
    }
    
    @IBAction func clickBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func calculateEMI(_ sender: UIButton) {
           guard let principalText = principalTextField.text,
                 let interestRateText = interestRateTextField.text,
                 let tenureText = tenureTextField.text,
                 let principal = Double(principalText),
                 let interestRate = Double(interestRateText),
                 let tenure = Double(tenureText) else {
               return
           }

           let monthlyInterestRate = (interestRate / 12) / 100
           let emi = principal * monthlyInterestRate / (1 - pow(1 + monthlyInterestRate, -tenure))
           emiLabel.text = String(format: "EMI: %.2f", emi)
       }


}
