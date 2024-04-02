 
import UIKit
import DropDown

class DemolationVCCC: UIViewController {
    
    
    @IBOutlet weak var base: UIView!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var lbl_drop: UILabel!
    @IBOutlet weak var denominationLabel: UILabel!
    
    @IBOutlet weak var base1: UIView!
    @IBOutlet weak var base2: UIView!
    
    var selectedString = "USD"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.base1.layer.cornerRadius = 20
        self.base2.layer.cornerRadius = 20
        
    }
    
    @IBAction func clickBAck(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dropdown(_ sender: UIButton) {
        setupDropDown(dropView: self.base, selectionCloser: { index, item in
            self.selectedString = item
            self.lbl_drop.text = item
        }, arr: ["USD","JPY","GBP","CAD","AUD","RUB","BRL"])
    }
    
    
    @IBAction func calculateDenomination(_ sender: UIButton) {
        guard let amountText = amountTextField.text, let amount = Double(amountText)
        else {
            denominationLabel.text = "Invalid input"
            return
        }
        let currencyCode = self.selectedString.uppercased()
        
        let denomination: String
        
        switch currencyCode {
        case "USD":
            denomination = calculateDenomination(amount: amount, denominations: [100, 50, 20, 10, 5, 1], currencySymbol: "$")
        case "JPY":
            denomination = calculateDenomination(amount: amount, denominations: [10000, 5000, 2000, 1000, 500, 100, 50, 10, 5, 1], currencySymbol: "¥")
        case "GBP":
            denomination = calculateDenomination(amount: amount, denominations: [50, 20, 10, 5, 2, 1], currencySymbol: "£")
        case "CAD":
            denomination = calculateDenomination(amount: amount, denominations: [100, 50, 20, 10, 5, 2, 1], currencySymbol: "$")
        case "AUD":
            denomination = calculateDenomination(amount: amount, denominations: [100, 50, 20, 10, 5, 2, 1], currencySymbol: "$")
        case "RUB":
            denomination = calculateDenomination(amount: amount, denominations: [1000, 500, 100, 50, 10, 5, 2, 1], currencySymbol: "₽")
        case "BRL":
            denomination = calculateDenomination(amount: amount, denominations: [100, 50, 20, 10, 5, 2, 1], currencySymbol: "R$")
        default:
            denomination = "Currency not supported"
        }
        
        denominationLabel.text = "Denomination:\n\(denomination)"
    }
    
    
    
    func calculateDenomination(amount: Double, denominations: [Int], currencySymbol: String) -> String {
        var remainingAmount = amount
        var denominationText = ""
        
        for denomination in denominations {
            if remainingAmount >= Double(denomination) {
                let count = Int(remainingAmount) / denomination
                remainingAmount -= Double(count * denomination)
                denominationText += "\(count) x \(currencySymbol)\(denomination)\n"
            }
        }
        
        return denominationText
    }
    
    //    MARK: - Dropdown Function
    func setupDropDown(dropView: UIView, selectionCloser :@escaping SelectionClosure, arr: [String]) {
        let dropdown = DropDown()
        dropdown.anchorView = dropView
        dropdown.bottomOffset =  CGPoint(x:0, y: dropView.frame.height + 10)
        dropdown.dataSource = arr
        dropdown.selectionAction = selectionCloser
        dropdown.backgroundColor = .white
        dropdown.cornerRadius = 15
        dropdown.shadowOpacity = 0.30
        dropdown.direction = .bottom
        dropdown.separatorColor = .gray.withAlphaComponent(0.50)
        dropdown.customCellConfiguration = { (index, item, cell) in
            //        cell.optionLabel.adjustsFontSizeToFitWidth = true
            cell.separatorInset.right = 10
            cell.separatorInset.left = 10
        }
        dropdown.textColor = UIColor(red: 0.413, green: 0.45, blue: 0.583, alpha: 1)
        dropdown.textFont =  UIFont.systemFont(ofSize: 18)
        dropdown.show()
    }
    
    
}
