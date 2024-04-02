 
import UIKit

class SIPPPVC: UIViewController {
    
    @IBOutlet weak var b3: UIView!
    @IBOutlet weak var b1: UIView!
    @IBOutlet weak var b2: UIView!
    @IBOutlet weak var monthlyInvestmentTextField: UITextField!
    @IBOutlet weak var expectedAnnualReturnTextField: UITextField!
    @IBOutlet weak var tenureTextField: UITextField!
    @IBOutlet weak var maturityAmountLabel: UILabel!
    
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
    
    @IBAction func calculateMaturityAmount(_ sender: UIButton) {
           guard let monthlyInvestmentText = monthlyInvestmentTextField.text,
                 let expectedAnnualReturnText = expectedAnnualReturnTextField.text,
                 let tenureText = tenureTextField.text,
                 let monthlyInvestment = Double(monthlyInvestmentText),
                 let expectedAnnualReturn = Double(expectedAnnualReturnText),
                 let tenure = Double(tenureText) else {
               return
           }

           let monthlyReturnRate = (expectedAnnualReturn / 12) / 100
           let numberOfMonths = tenure * 12
           let maturityAmount = monthlyInvestment * ((pow(1 + monthlyReturnRate, numberOfMonths) - 1) / monthlyReturnRate) * (1 + monthlyReturnRate)
           maturityAmountLabel.text = String(format: "Maturity Amount: %.2f", maturityAmount)
       }

}
