 

import UIKit

class MathMEter: UIViewController {

    //MARK: Outlets
    
    @IBOutlet weak var removeLastLbl: UIButton!
    @IBOutlet weak var sequence: UILabel!
    @IBOutlet weak var cornerView: UIView!
    @IBOutlet weak var display: UILabel!
    
    //MARK: Variables
    
    private var brain = BrainVC()
    private var userIsInTheMiddleOfTyping = false
    
    
    private var displayValue: Double {
        get {
            return Double(display.text ?? Constants.emptyString) ?? Double.nan
        }
        set {
            let tmp = String(newValue).removeAfterPointIfZero()
            display.text = tmp.setMaxLength(of: 8)
        }
    }
    
    @IBOutlet weak var clickBack: UIButton!
    
    @IBAction func clickBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onclickRemoveLast(_ sender: UIButton) {
        (self.sequence.text == "") ? self.display.text?.removeLast() : self.sequence.text?.removeLast()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cornerView.layer.cornerRadius = Constants.cornerRadius
        cornerView.layer.masksToBounds = true
    
    }
    
    //MARK: IBAction(s)
    
    @IBAction func touchDigit(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        if userIsInTheMiddleOfTyping {
            guard let textCurrentlyInDisplay = display.text else { return }
            if digit == "." && (textCurrentlyInDisplay.range(of: Constants.decimalPoint) != nil) {
                return
            } else {
                let tmp = (textCurrentlyInDisplay ?? "") + digit // Safely unwrap optional
                display.text = tmp.setMaxLength(of: Constants.maxStringLength)
            }
        } else {
            if digit == Constants.decimalPoint {
                display.text = Constants.pointAfterZero
            } else {
                display.text = digit
            }
            userIsInTheMiddleOfTyping = true
        }
        sequence.text = brain.description
    }

    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            print("User Type Oprands")
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        
        if let result = brain.result {
            displayValue = result
        }
        
        sequence.text = brain.description
    }
    
    @IBAction func btn_Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension MathMEter {
    struct Constants {
        static let cornerRadius: CGFloat = 35.0
        static let decimalPoint: String = "."
        static let emptyString: String = ""
        static let maxStringLength: Int = 8
        static let pointAfterZero: String = "0."
    }
}
