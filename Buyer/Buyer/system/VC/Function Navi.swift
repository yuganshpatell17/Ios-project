////
////  Function Navi.swift
////  Buyer
////
////  Created by yugansh on 16/02/24.
////
//
//import UIKit
//
//extension UIViewController 
//{
//    
//    enum NameViewController: String 
//    {
//        case ScreenVC = "ScreenVC"
//        case LoginVC = "LoginVC"
//        case EnterNewPinVC = "EnterNewPinVC"
//        case OtpVC3 = "OtpVC3"
//        case EnterPinVC = "EnterPinVC"
//        case CreateNewPinVC = "CreateNewPinVC"
//        case OtpVC2 = "OtpVC2"
//        case RegisterVC = "RegisterVC"
//        case OtpVC = "OtpVC"
//        case Add_Inventory_vc = "Add_Inventory_vc"
//        case Car_Detail_vc = "Car_Detail_vc"
//        case HomeVC = "HomeVC"
//        case HomeVC5 = "HomeVC5"
//        case HomeVC4 = "HomeVC4"
//        case HomeVC3 = "HomeVC3"
//        case HomeVC2 = "HomeVC2"
//        
//        func storyboardName() -> StoryboardName 
//        {
//            switch self 
//            {
//            case .ScreenVC, .LoginVC, .EnterNewPinVC, .OtpVC3, .EnterPinVC, .CreateNewPinVC, .OtpVC2, .RegisterVC, .OtpVC, .Add_Inventory_vc, .Car_Detail_vc, .HomeVC, .HomeVC5, .HomeVC4, .HomeVC3, .HomeVC2:
//                
//                return .Main
//            }
//        }
//    }
//    
//    enum StoryboardName: String 
//    {
//        case Main = "Main"
//
//        var instance: UIStoryboard 
//        {
//            return UIStoryboard(name: self.rawValue, bundle: .main)
//        }
//        
//        func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T 
//        {
//            let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
//            return instance.instantiateViewController(withIdentifier: storyboardID) as! T
//        }
//        
//        func initialViewController() -> UIViewController? 
//        {
//            return instance.instantiateInitialViewController()
//        }
//    }
//    
//    class var storyboardID: String 
//    {
//        return "\(self)"
//    }
//    
//    static func instantiate() -> Self 
//    {
//        let storyboardID = (self as UIViewController.Type).storyboardID
//        let storyboard = NameViewController(rawValue: storyboardID)!.storyboardName()
//        return storyboard.viewController(viewControllerClass: self)
//    }
//    
//    func pushVC(vc: UIViewController, animation: Bool)
//    {
//        self.navigationController?.pushViewController(vc, animated: animation)
//    }
//    
//    func popVC(animated:Bool = true) 
//    {
//        self.navigationController?.popViewController(animated: animated)
//    }
//    
//    func popViewController(vcIndex : Int?, animated:Bool = true) 
//    {
//        let array = navigationController?.viewControllers
//        
//        if let object = array?[vcIndex!] {
//            navigationController?.popToViewController(object, animated: animated)
//        }
//    }
//}
