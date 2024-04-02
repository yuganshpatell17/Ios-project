 

import UIKit

class CustomerDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var nodataLbl: UILabel!
    @IBOutlet weak var tblView: UITableView!

    var milkDataArray = [MilkData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tblView.delegate = self
        self.tblView.dataSource = self
        self.tblView.rowHeight = UITableView.automaticDimension
        self.tblView.register(UINib(nibName: "FirstCell", bundle: nil), forCellReuseIdentifier: "FirstCell")
     
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.milkDataArray = HelperClass.shared.getMilkDataData()
        self.tblView.isHidden = self.milkDataArray.count == 0
        self.nodataLbl.isHidden = self.milkDataArray.count != 0
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.milkDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblView.dequeueReusableCell(withIdentifier: "FirstCell") as! FirstCell
        let model = self.milkDataArray[indexPath.row]
        cell.Customername.text = "Customer Name -: \(model.customerName ?? "")"
        cell.startingDAte.text = "Starting Date -: \(model.startDate ?? "")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if #available(iOS 13.0, *) {
            let vc = self.storyboard!.instantiateViewController(identifier: "ViewAllDAtaVCc") as! ViewAllDAtaVCc
            vc.model = self.milkDataArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
