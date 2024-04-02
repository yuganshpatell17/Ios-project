 
import UIKit

class LiterCounterVCc: UIViewController {

    @IBOutlet weak var pricetxt: CustomTextField!
    @IBOutlet weak var literTxt: CustomTextField!
    @IBOutlet weak var resultLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func calculateBtn(_ sender: Any) {
        guard let numberOfLinersText = self.literTxt.text,
              let linerPriceText = self.pricetxt.text,
              let numberOfLiners = Double(numberOfLinersText),
              let linerPrice = Double(linerPriceText) else {
            showAlert(message: "Invalid input. Please enter valid numeric values.")
            return
        }
        let totalLinerPrice = numberOfLiners * linerPrice
        self.resultLbl.text = "Total Price is -: \(totalLinerPrice)"
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
