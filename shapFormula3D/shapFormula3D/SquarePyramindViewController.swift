

import UIKit

class SquarePyramindViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var baseSideLengthTextField: UITextField!
        @IBOutlet weak var heightTextField: UITextField!
        @IBOutlet weak var slantHeightTextField: UITextField!
        @IBOutlet weak var resultLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.baseSideLengthTextField.keyboardType = .numberPad
        self.heightTextField.keyboardType = .numberPad
        self.slantHeightTextField.keyboardType = .numberPad
        
        
    }
    
    
    @IBAction func calcullat(_ sender: Any) {
        
        
        // Ensure all text fields have valid input
              guard let baseSideLength = Double(baseSideLengthTextField.text ?? ""),
                    let height = Double(heightTextField.text ?? ""),
                    let slantHeight = Double(slantHeightTextField.text ?? "") else {
                  resultLabel.text = "Please enter valid numbers in all fields."
                  return
              }
                  let volume = (1.0/3.0) * pow(baseSideLength, 2) * height
                        let surfaceArea = pow(baseSideLength, 2) + 2 * baseSideLength * slantHeight

        
        
                  resultLabel.text = "Volume: \(volume)\nSurface Area: \(surfaceArea)"
    }
    

    @IBAction func calcuator(_ sender: Any) {
        
        navigateToViewController(main: "Main", storyboard: "calculator", navigationController: self.navigationController)
        
        
    }
    
    @IBAction func backbutoon(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
   
}


