
import UIKit
import StoreKit

var BaseURL = ""
var AppName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String


@available(iOS 13.0, *)
class QuizSetting: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btn_aboutus(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "QuizAboutUs")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btn_share(_ sender: Any) {
        print("Tapped Share", AppName ?? "")
        guard let appName = AppName else { return }
        self.share(items: [appName, URL.init(string: BaseURL) as Any])

    }
    
}

extension UIViewController {
    
    //  Share Items
    func share(items : [Any]) {
        //        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        //        activityController.setValue("Test", forKey: "Subject")
        //        self.present(activityController, animated: true, completion: nil)
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = self.view
        self.present(activityController, animated: true, completion: nil)
    }
}
