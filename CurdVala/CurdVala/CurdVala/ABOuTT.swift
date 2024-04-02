//
//  ABOuTT.swift
//  CurdVala
//
//  Created by yugansh on 21/03/24.
//

import UIKit
import StoreKit

class ABOuTT: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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


}
