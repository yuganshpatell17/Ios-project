//
//  ViewController.swift
//  JanaavarAvaaj
//
//  Created by Yash Dhaduk on 11/03/24.
//

import UIKit
var BaseURL = ""
var AppName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String

@available(iOS 13.0, *)

class ViewController: UIViewController {
    
    func share(items : [Any]) {
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = self.view
        self.present(activityController, animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btn_animalvoice(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AnimalVoiceVC") as! AnimalVoiceVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btn_birdvoice(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BirdVoiceVC") as! BirdVoiceVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btn_parts(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InformationVC") as! InformationVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func btn_rate(_ sender: Any) {
    }
    @IBAction func btn_share(_ sender: Any) {
        
        print("Tapped Share", AppName ?? "")
        guard let appName = AppName else { return }
        self.share(items: [appName, URL.init(string: BaseURL) as Any])
    }
    @IBAction func btn_about(_ sender: Any) {
    }
    
}

