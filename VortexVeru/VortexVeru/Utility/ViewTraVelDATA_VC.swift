 
import UIKit

@available(iOS 13.0, *)
class ViewTraVelDATA_VC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var noDatalbl: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    var dataArray = [TravelNote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tblView.delegate = self
        self.tblView.dataSource = self
        self.tblView.register( UINib(nibName: "TraXDvelCell", bundle: nil), forCellReuseIdentifier: "TraXDvelCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.dataArray = Model.Shared.getTravelData()
        
        tblView.isHidden = self.dataArray.count == 0
        noDatalbl.isHidden = self.self.dataArray.count != 0
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "TraXDvelCell", for: indexPath) as! TraXDvelCell
        cell.datelbl.text = self.dataArray[indexPath.row].date
        cell.placeNameLbl.text = self.dataArray[indexPath.row].placeName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "DETAILSVCC") as! DETAILSVCC
        vc.noteData = self.dataArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
