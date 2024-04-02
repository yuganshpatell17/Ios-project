 
import UIKit
import StoreKit

class KnowMoreVCC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    @IBAction func clickBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteSpacial(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure you want to delete?", message: "", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Delete", style: .destructive) { _ in
            UserDefaults.standard.setValue([""], forKey: "savedNotes")
        }
        let action2 = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true)
    }
    
    @IBAction func rateUS(_ sender: UIButton) {
        if #available(iOS 13.0, *) {
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                DispatchQueue.main.async {
                    if #available(iOS 14.0, *) {
                        SKStoreReviewController.requestReview(in: scene)
                    } else {
                        // Fallback on earlier versions
                    }
                }
            } else {
                print(" - - - - - - Rating view in not present - - - -")
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    @IBAction func shareApp(_ sender: UIButton) {
        let string1 = "itms-apps://itunes.apple.com/app/" // App ID
        let url = URL(string: string1)
        let shareItems = [url as AnyObject]
        let activityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}
