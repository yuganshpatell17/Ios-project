 
import UIKit

class ADDTRAVELNOTE: UIViewController {
    @IBOutlet weak var dateTxtx: UITextField!
    @IBOutlet weak var aboutPlaceTxtx: UITextView!
    @IBOutlet weak var stayDayTxtx: UITextField!
    @IBOutlet weak var costTxtx: UITextField!
    @IBOutlet weak var placeNameTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

    @IBAction func clickonSave(_ sender: UIButton) {
    
        if self.dateTxtx.text != "" && self.aboutPlaceTxtx.text != "" && self.stayDayTxtx.text != "" && self.costTxtx.text != "" && self.placeNameTxt.text != "" {
            Model.Shared.saveTravelData(des: self.aboutPlaceTxtx.text!, placeName: self.placeNameTxt.text!, date: self.dateTxtx.text!, stayDays: self.stayDayTxtx.text!, costThisPlace: self.costTxtx.text!)
            
            showToast(message: "Tour Note has been saved!", font: .systemFont(ofSize: 20), timeInterval: 2)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            showToast(message: "Please Fill All Tour details", font: .systemFont(ofSize: 20), timeInterval: 2)
        }
        
        
    }
    
}

extension UIViewController {
    
    func showToast(message : String, font: UIFont,timeInterval:TimeInterval) {
        
        let toastLabel = UILabel(frame: CGRect(x: 30, y: self.view.frame.size.height-150, width: self.view.frame.size.width - 60 , height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: timeInterval, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
