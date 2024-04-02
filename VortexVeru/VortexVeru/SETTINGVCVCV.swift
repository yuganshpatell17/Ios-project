 

import UIKit

class SETTINGVCVCV: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func deleteNoreBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "Are you sure you want to delete your Tour Note?", message: "", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Delete", style: .destructive) { _ in
            Model.Shared.deleteTravelData()
            self.showToast(message: "Tour Details Deleted.", font: .systemFont(ofSize: 20), timeInterval: 3)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.navigationController?.popViewController(animated: true)
            }
        }
        let action2 = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true)
    }
    
    @IBAction func shareApp(_ sender: Any) {
        let shareItems: Array = [APP_URL] as [Any]
        
        let activityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        if !IS_IPHONE {
            if let popup = activityViewController.popoverPresentationController {
                popup.sourceView = self.view
                popup.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
            }
        }

        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func rateApp(_ sender: Any) {
        let url = URL(string: "\(Review_URL)")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    @IBAction func reviewApp(_ sender: Any) {
        let url = URL(string: "\(Review_URL)")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
}
