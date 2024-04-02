//
//  File.swift
//  PhySol
//
//  Created by SUJAL on 3/19/24.
//

import Foundation
import UIKit

extension UIView {
    // MARK: - cornerRadius -
       
    @IBInspectable var cornerRadius : CGFloat{
            
            get{return self.cornerRadius}
            set{self.layer.cornerRadius = newValue}
        }
    // MARK: - CapsulHeigth -
    
    @IBInspectable var makeACapsulHeigth : CGFloat{
        
        get{return self.makeACapsulHeigth}
        set{self.layer.cornerRadius = self.frame.height /  newValue}
    }
}
