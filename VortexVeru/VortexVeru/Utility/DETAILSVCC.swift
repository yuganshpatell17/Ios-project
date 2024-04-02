 

import UIKit

class DETAILSVCC: UIViewController {

    @IBOutlet weak var aboutPlacelbl: UILabel!
    @IBOutlet weak var stayLbl: UILabel!
    @IBOutlet weak var costTotallbl: UILabel!
    @IBOutlet weak var placeNamelbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    var noteData = TravelNote()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Tour Details"
        self.costTotallbl.text = "Total Cost :- \(self.noteData.costThisPlace ?? "")"
        self.dateLbl.text = "Date :- \(self.noteData.date ?? "")"
        self.placeNamelbl.text = "Place Name :- \(self.noteData.placeName ?? "")"
        self.stayLbl.text = "Stay Days :- \(self.noteData.stayDays ?? "")"
        self.aboutPlacelbl.text = "About Place :- \(self.noteData.aboutPlace ?? "")"
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
