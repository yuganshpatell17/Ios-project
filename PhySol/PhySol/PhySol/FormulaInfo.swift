import UIKit

class FormulaInfo: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txt_value1: UITextField!
    @IBOutlet weak var lbl_ans: UILabel!
    @IBOutlet weak var txt_value2: UITextField!
    @IBOutlet weak var txt_value3: UITextField!
    @IBOutlet weak var lbl_formulaname: UILabel!
    @IBOutlet weak var lbl_formula: UILabel!
    
    var formulaName = String()
    var formulaText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.txt_value1.keyboardType = .decimalPad
        self.txt_value2.keyboardType = .decimalPad
        self.txt_value3.keyboardType = .decimalPad
        self.txt_value1.delegate = self
        self.txt_value2.delegate = self
        self.txt_value3.delegate = self
        self.lbl_formulaname.text = formulaName
        self.lbl_formula.text = formulaText
        
        setupInitialValues()
    }
    
    @IBAction func btn_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_ans(_ sender: Any) {
        guard let value1 = Double(self.txt_value1.text ?? ""),
              let value2 = Double(self.txt_value2.text ?? ""),
              let value3 = Double(self.txt_value3.text ?? "") else {
            self.lbl_ans.text = "Invalid Input"
            return
        }
        
        var ans = 0.0
        
        switch formulaName {
        case "Newton's Second Law":
            ans = value1 * value2
        case "Gravitational Force":
            ans = (value1 * value2) / (value3 * value3)
        case "Kinetic Energy":
            ans = 0.5 * value1 * value2 * value2
        case "Potential Energy":
            ans = value1 * value2 * value3
        case "Power":
            ans = value1 * value2 / value3
        case "Ohm's Law":
            ans = value1 * value2
        case "Electric Power":
            ans = value1 * value2
        case "Frequency":
            ans = 1.0 / value1
        case "Wavelength":
            ans = value1 / value2
        case "Speed of Light":
            ans = value1 * value2
        case "Acceleration":
            ans = (value2 - value1) / value3
        case "Force of Friction":
            ans = value1 * value2
        default:
            break
        }
        
        self.lbl_ans.text = "\(ans)"
    }
    
    func setupInitialValues() {
        switch formulaName {
        case "Newton's Second Law":
            self.txt_value1.placeholder = "Enter mass (m)"
            self.txt_value2.placeholder = "Enter acceleration (a)"
            self.txt_value3.isHidden = true
            self.txt_value3.text = "1"
        case "Gravitational Force":
            self.txt_value1.placeholder = "Enter mass 1 (m1)"
            self.txt_value2.placeholder = "Enter mass 2 (m2)"
            self.txt_value3.placeholder = "Enter distance (r)"
        case "Kinetic Energy":
            self.txt_value1.placeholder = "Enter mass (m)"
            self.txt_value2.placeholder = "Enter velocity (v)"
            self.txt_value3.isHidden = true
            self.txt_value3.text = "1"
        case "Potential Energy":
            self.txt_value1.placeholder = "Enter mass (m)"
            self.txt_value2.placeholder = "Enter gravity (g)"
            self.txt_value3.placeholder = "Enter height (h)"
        case "Power":
            self.txt_value1.placeholder = "Enter work (W)"
            self.txt_value2.placeholder = "Enter time (t)"
            self.txt_value3.isHidden = true
            self.txt_value3.text = "1"
        case "Ohm's Law":
            self.txt_value1.placeholder = "Enter voltage (V)"
            self.txt_value2.placeholder = "Enter current (I)"
            self.txt_value3.isHidden = true
            self.txt_value3.text = "1"
        case "Electric Power":
            self.txt_value1.placeholder = "Enter voltage (V)"
            self.txt_value2.placeholder = "Enter current (I)"
            self.txt_value3.isHidden = true
            self.txt_value3.text = "1"
        case "Frequency":
            self.txt_value1.placeholder = "Enter frequency (f)"
            self.txt_value2.isHidden = true
            self.txt_value3.isHidden = true
            self.txt_value2.text = "1"
            self.txt_value3.text = "1"
        case "Wavelength":
            self.txt_value1.placeholder = "Enter speed (v)"
            self.txt_value2.placeholder = "Enter frequency (f)"
            self.txt_value3.isHidden = true
            self.txt_value3.text = "1"
        case "Speed of Light":
            self.txt_value1.placeholder = "Enter wavelength (λ)"
            self.txt_value2.placeholder = "Enter frequency (f)"
            self.txt_value3.isHidden = true
            self.txt_value3.text = "1"
        case "Acceleration":
            self.txt_value1.placeholder = "Enter initial velocity (vi)"
            self.txt_value2.placeholder = "Enter final velocity (vf)"
            self.txt_value3.placeholder = "Enter time (t)"
        case "Force of Friction":
            self.txt_value1.placeholder = "Enter friction coefficient (μ)"
            self.txt_value2.placeholder = "Enter normal force (N)"
            self.txt_value3.isHidden = true
            self.txt_value3.text = "1"
        default:
            break
        }
    }
}
