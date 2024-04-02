
import UIKit

class AddCustomerVCC: UIViewController {

    
    @IBOutlet weak var Dailytxt: UITextField!
    @IBOutlet weak var conNumTxt: UITextField!
    @IBOutlet weak var paymentDate: UITextField!
    @IBOutlet weak var priceper: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var dateTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    @IBAction func clickOnsaveClient(_ sender: UIButton) {
        if self.Dailytxt.text  != "" && self.conNumTxt.text  != "" && self.paymentDate.text  != "" && self.priceper.text != "" && self.nameTxt.text != "" && self.dateTxt.text != "" {
            HelperClass.shared.saveData(contectNum: self.conNumTxt.text!, customerName: self.nameTxt.text!, startDate: self.dateTxt.text!, paymentdate: self.paymentDate.text!, literNum: self.Dailytxt.text!, literPrice: self.priceper.text!)
            self.show(message: "Client has benn Saved!", font: .systemFont(ofSize: 20), timeInterval: 2)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            show(message: "Fill All details to save Client!", font: .systemFont(ofSize: 20), timeInterval: 2)
        }
    }
}
