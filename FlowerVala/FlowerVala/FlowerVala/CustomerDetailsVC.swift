 

import UIKit

class CustomerDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var nodataLbl: UILabel!
    @IBOutlet weak var Table_View: UITableView!

    var GrocerDataArray = [FlowerData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.Table_View.delegate = self
        self.Table_View.dataSource = self
        self.Table_View.rowHeight = UITableView.automaticDimension
        self.Table_View.register(UINib(nibName: "FirstCell", bundle: nil), forCellReuseIdentifier: "FirstCell")
     
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.GrocerDataArray = HelperClass.shared.getData()
        self.Table_View.isHidden = self.GrocerDataArray.count == 0
        self.nodataLbl.isHidden = self.GrocerDataArray.count != 0
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.GrocerDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.Table_View.dequeueReusableCell(withIdentifier: "FirstCell") as! FirstCell
        let model = self.GrocerDataArray[indexPath.row]
        cell.Customername.text = "Customer Name -: \(model.customerName ?? "")"
        cell.startingDAte.text = "Starting Date -: \(model.startDate ?? "")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if #available(iOS 13.0, *) {
            let vc = self.storyboard!.instantiateViewController(identifier: "ViewAllDAtaVCc") as! ViewAllDAtaVCc
            vc.model = self.GrocerDataArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
