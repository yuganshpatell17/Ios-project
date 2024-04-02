//
//  File.swift
//  demo
//
//  Created by yugansh on 23/01/24.
//

import Foundation
import UIKit

func push(vc : UIViewController, name : String) {
    
    let pushVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    vc.navigationController?.pushViewController(pushVC, animated: true)
    
}
