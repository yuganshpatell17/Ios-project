 
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
    }

    @IBAction func cleanRecord(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure you want to delete your All Client?", message: "", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Delete", style: .destructive) { _ in
            HelperClass.shared.deleteMilkDataData()
            self.showToast(message: "All Client has been Deleted!", font: .systemFont(ofSize: 20), timeInterval: 3)
        }
        let action2 = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true)
    }
    
    @IBAction func shareUS(_ sender: Any) {
        let string1 = "itms-apps://itunes.apple.com/app/" // App ID
        let url = URL(string: string1)
        let shareItems = [url as AnyObject]
        let activityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
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
