
import UIKit

class cubeViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var edgeLengthTextField: UITextField!
       @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgeLengthTextField.keyboardType = .numberPad
        }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
            // Ensure the text field has valid input
            guard let edgeLength = Double(edgeLengthTextField.text ?? "") else {
                resultLabel.text = "Please enter a valid number for the edge length."
                return
            }

            // Calculate volume and surface area of the cube
            let volume = pow(edgeLength, 3)
            let surfaceArea = 6 * pow(edgeLength, 2)

            // Display the results
            resultLabel.text = "Volume: \(volume)\nSurface Area: \(surfaceArea)"
        }

    
    
    @IBAction func calcuator(_ sender: Any) {
        
        navigateToViewController(main: "Main", storyboard: "calculator", navigationController: self.navigationController)
        
        
    }
    
    @IBAction func backbutoon(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
}
