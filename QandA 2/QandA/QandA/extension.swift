
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
    // MARK: - Capsulwidth -
    
    @IBInspectable var makeACapsulwidth : CGFloat{
        
        get{return self.makeACapsulwidth}
        set{self.layer.cornerRadius = self.frame.width /  newValue}
    }
}
