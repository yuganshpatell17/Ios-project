


import Foundation
import UIKit





func navigateToViewController(main: String, storyboard: String, navigationController: UINavigationController?) {
    let viewController = UIStoryboard(name: main, bundle: nil).instantiateViewController(withIdentifier: storyboard)
    
    navigationController?.pushViewController(viewController, animated: true)
}


