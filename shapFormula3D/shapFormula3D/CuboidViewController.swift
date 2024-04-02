
import UIKit

class CuboidViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var lengthTextField: UITextField!
        @IBOutlet weak var widthTextField: UITextField!
        @IBOutlet weak var heightTextField: UITextField!
        @IBOutlet weak var resultLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.heightTextField.keyboardType = .numberPad
        self.lengthTextField.keyboardType = .numberPad
        self.widthTextField.keyboardType = .numberPad
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
           
            guard let length = Double(lengthTextField.text ?? ""),
                  let width = Double(widthTextField.text ?? ""),
                  let height = Double(heightTextField.text ?? "") else {
                resultLabel.text = "Please enter valid numbers in all fields."
                return
            }

           
            let volume = length * width * height
            let surfaceArea = 2 * (length * width + length * height + width * height)

            
            resultLabel.text = "Volume: \(volume)\nSurface Area: \(surfaceArea)"
        }
    @IBAction func calcuator(_ sender: Any) {
        
        navigateToViewController(main: "Main", storyboard: "calculator", navigationController: self.navigationController)
        
        
    }
    @IBAction func backbutoon(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
}
