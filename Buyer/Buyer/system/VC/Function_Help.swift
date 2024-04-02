//
//  Function_Help.swift
//  Buyer
//
//  Created by yugansh on 20/02/24.
//

import Foundation
import UIKit

extension UIViewController
{
    func popVC(animated:Bool = true)
    {
        self.navigationController?.popViewController(animated: animated)
    }
    
    func pushVC (Storybord: String , identifier: String , VC: UIViewController) 
    {
        let vc = UIStoryboard(name: Storybord, bundle: nil).instantiateViewController(identifier: identifier)
        VC.navigationController?.pushViewController(vc, animated: true)
    }
}
