
import UIKit

class HemlsphereViewController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var radiusTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.radiusTextField.keyboardType = .numberPad
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        guard let radius = Double(radiusTextField.text ?? "") else {
            resultLabel.text = "Please enter a valid number for the radius."
            return
        }
        
        
        let volume = (2.0/3.0) * Double.pi * pow(radius, 3)
        let surfaceArea = 2 * Double.pi * pow(radius, 2)
        
        
        resultLabel.text = "Volume: \(volume)\nSurface Area: \(surfaceArea)"
    }
    
    
    
    @IBAction func calcuator(_ sender: Any) {
        
        navigateToViewController(main: "Main", storyboard: "calculator", navigationController: self.navigationController)
        
        
    }
    
    @IBAction func backbutoon(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
}
