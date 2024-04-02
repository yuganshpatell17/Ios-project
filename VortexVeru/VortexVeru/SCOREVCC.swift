 
import UIKit

@available(iOS 13.0, *)
class SCOREVCC: UIViewController {

    @IBOutlet weak var lblScore: UILabel!
    
    @IBOutlet weak var ViewShareScore: UIView!
    @IBOutlet weak var ViewDeleteScore: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        lblUserName.text = "High Score"
        
        ViewShareScore.center = CGPoint(x: 400, y: 0)
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
           self.ViewShareScore.center = CGPoint(x: 80, y: 0)
        }, completion: nil)
        
        
        ViewDeleteScore.center = CGPoint(x: -300, y: 0)
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
           self.ViewDeleteScore.center = CGPoint(x: 80, y: 0)
        }, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        lblScore.text = "\(USER_SCORE)"
        
    }
    
    @IBAction func btnBack(_ sender: Any)
    {
//        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnShareScore(_ sender: Any)
    {
        let shareItems: Array = ["\(USER_NAME) Score Is \(USER_SCORE)"] as [Any]
        
        let activityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.print, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.addToReadingList]
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func btnClearScore(_ sender: Any)
    {
        
        Utility.showAlertWithTitleFromVC(vc: self, title: "Alert !!", andMessage: "Are You Sure To Clear Your Score.", buttons: ["NO","YES"]) { (index) in
            if index == 1
            {
                USER_SCORE = 0
                UserDefaults.standard.set(0, forKey: "UserScore")
                self.lblScore.text = "\(USER_SCORE)"
            }
        }
        
    }
}
