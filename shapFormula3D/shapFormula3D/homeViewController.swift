
import UIKit
import StoreKit

class homeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn1(_ sender: Any) {
        navigateToViewController(main: "Main", storyboard: "SquarePyramindViewController", navigationController: self.navigationController)
    }
    
    @IBAction func btn2(_ sender: Any) {
        navigateToViewController(main: "Main", storyboard: "cubeViewController", navigationController: self.navigationController)
    }
    
    @IBAction func btn3(_ sender: Any) {
        navigateToViewController(main: "Main", storyboard: "ViewController", navigationController: self.navigationController)
    }
    
    @IBAction func btn4(_ sender: Any) {
        navigateToViewController(main: "Main", storyboard: "Pentagonal_PrismViewController", navigationController: self.navigationController)
    }
    
    @IBAction func btn5(_ sender: Any) {
        navigateToViewController(main: "Main", storyboard: "HemlsphereViewController", navigationController: self.navigationController)
    }
    
    @IBAction func btn6(_ sender: Any) {
        navigateToViewController(main: "Main", storyboard: "CuboidViewController", navigationController: self.navigationController)
    }
    
    
    @IBAction func btn7(_ sender: Any) {
        navigateToViewController(main: "Main", storyboard: "SphereViewController", navigationController: self.navigationController)
    }
    
    
    @IBAction func aboutus(_ sender: Any) {
        
        navigateToViewController(main: "Main", storyboard: "aboutUsViewController", navigationController: self.navigationController)
        
        
       
    }
    
    
        
        
   
}
