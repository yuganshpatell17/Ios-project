 

import UIKit

class ViewAllDAtaVCc: UIViewController {

    @IBOutlet weak var contectLbl: UILabel!
    @IBOutlet weak var startdate: UILabel!
    @IBOutlet weak var cusNameLbl: UILabel!
    @IBOutlet weak var paymentDAte: UILabel!
    @IBOutlet weak var priceper: UILabel!
    @IBOutlet weak var Count: UILabel!
    
    
    var model = CurdData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Client Details"
        self.cusNameLbl.text = "Client Name -: \(model.customerName ?? "")"
        self.startdate.text = "Starting Date -: \(model.startDate ?? "")"
        self.contectLbl.text = "Contect Num -: \(model.contectNum ?? "")"
        self.paymentDAte.text = "Payment Date -: \(model.paymentDate ?? "")"
        self.Count.text = "Count -: \(model.literNum ?? "")"
        self.priceper.text = "Price -: \(model.literPrice ?? "")"

    }
    


}
