
import UIKit

class ViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var radiusTextField: UITextField!
        @IBOutlet weak var heightTextField: UITextField!
        @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.heightTextField.keyboardType = .numberPad
        self.radiusTextField.keyboardType = .numberPad
        
        
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
           
           guard let radius = Double(radiusTextField.text ?? ""),
                 let height = Double(heightTextField.text ?? "") else {
               resultLabel.text = "Please enter valid numbers in both fields."
               return
           }

           
           let volume = (1.0/3.0) * Double.pi * pow(radius, 2) * height
           let slantHeight = sqrt(pow(radius, 2) + pow(height, 2))
           let surfaceArea = Double.pi * pow(radius, 2) + Double.pi * radius * slantHeight

          
           resultLabel.text = "Volume: \(volume)\nSurface Area: \(surfaceArea)"
       }
    
    
    @IBAction func calcuator(_ sender: Any) {
        
        navigateToViewController(main: "Main", storyboard: "calculator", navigationController: self.navigationController)
        
        
    }
    
    @IBAction func backbutoon(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
}

