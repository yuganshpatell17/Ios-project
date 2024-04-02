 
import UIKit

class AddCustomerVCC: UIViewController {

    
    @IBOutlet weak var literDailytxt: CustomTextField!
    @IBOutlet weak var conNumTxt: CustomTextField!
    @IBOutlet weak var paymentDate: CustomTextField!
    @IBOutlet weak var priceperLiter: CustomTextField!
    @IBOutlet weak var nameTxt: CustomTextField!
    @IBOutlet weak var dateTxt: CustomTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    @IBAction func clickOnsaveClient(_ sender: UIButton) {
        if self.literDailytxt.text  != "" && self.conNumTxt.text  != "" && self.paymentDate.text  != "" && self.priceperLiter.text != "" && self.nameTxt.text != "" && self.dateTxt.text != "" {
            HelperClass.shared.saveMilkDataData(contectNum: self.conNumTxt.text!, customerName: self.nameTxt.text!, startDate: self.dateTxt.text!, paymentdate: self.paymentDate.text!, literNum: self.literDailytxt.text!, literPrice: self.priceperLiter.text!)
            self.showToast(message: "Client has benn Saved!", font: .systemFont(ofSize: 20), timeInterval: 2)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            showToast(message: "Fill All details to save Client!", font: .systemFont(ofSize: 20), timeInterval: 2)
        }
    }
}
