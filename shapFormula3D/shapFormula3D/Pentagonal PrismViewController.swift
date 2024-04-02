

import UIKit

class Pentagonal_PrismViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var sideLengthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var apothemTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        self.sideLengthTextField.keyboardType = .numberPad
        self.heightTextField.keyboardType = .numberPad
        self.apothemTextField.keyboardType = .numberPad
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        guard let sideLength = Double(sideLengthTextField.text ?? ""),
              let height = Double(heightTextField.text ?? ""),
              let apothem = Double(apothemTextField.text ?? "") else {
            resultLabel.text = "Please enter valid numbers in all fields."
            return
        }
        
        
        let baseArea = (5.0/4.0) * pow(sideLength, 2) / tan(Double.pi / 5.0)
        
        
        let volume = baseArea * height
        let surfaceArea = 5 * sideLength * height + 2 * baseArea
        
        
        resultLabel.text = "Volume: \(volume)\nSurface Area: \(surfaceArea)"
    }
    
    @IBAction func calcuator(_ sender: Any) {
        
        navigateToViewController(main: "Main", storyboard: "calculator", navigationController: self.navigationController)
        
        
    }
    
    @IBAction func backbutoon(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
}
