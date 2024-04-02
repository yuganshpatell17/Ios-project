 

import UIKit

class ViewAllDAtaVCc: UIViewController {

    @IBOutlet weak var contectLbl: UILabel!
    @IBOutlet weak var startdate: UILabel!
    @IBOutlet weak var cusNameLbl: UILabel!
    @IBOutlet weak var paymentDAte: UILabel!
    @IBOutlet weak var priceperLitrer: UILabel!
    @IBOutlet weak var literCount: UILabel!
    
    
    var model = MilkData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Client Details"
        self.cusNameLbl.text = "Client Name -: \(model.customerName ?? "")"
        self.startdate.text = "Starting Date -: \(model.startDate ?? "")"
        self.contectLbl.text = "Contect Num -: \(model.contectNum ?? "")"
        self.paymentDAte.text = "Payment Date -: \(model.paymentDate ?? "")"
        self.literCount.text = "Liter Count -: \(model.literNum ?? "")"
        self.priceperLitrer.text = "Liter Price -: \(model.literPrice ?? "")"

    }
    


}
