//
//  Utility.swift
//  Amazing GK
//
//  Created by Ashish Mandaliya on 14/11/19.
//  Copyright © 2019 Bhavin godhani. All rights reserved.
//

import UIKit
extension UITextView
{
    
    @IBInspectable var doneAccessory: Bool
        {
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
    
}
extension String
{
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    var htmlToString: String
    {
        return htmlToAttributedString?.string ?? ""
    }
    
}
extension UIView
{
    
    func takeScreenshot() -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if (image != nil) {
            
            return image!
        }
        
        return UIImage()
    }
    
}

@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

extension UIView
{
    
    @IBInspectable
    var cornerRadius: CGFloat
    {
        get {
            
            return layer.cornerRadius
        } set {
            
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat
    {
        get {
            
            return layer.borderWidth
        } set {
            
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor?
    {
        get {
            
            if let color = layer.borderColor {
                
                return UIColor(cgColor: color)
            }
            
            return nil
        } set {
            
            if let color = newValue {
                
                layer.borderColor = color.cgColor
            } else {
                
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat
    {
        get {
            
            return layer.shadowRadius
        } set {
            
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float
    {
        get {
            
            return layer.shadowOpacity
        } set {
            
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize
    {
        get {
            
            return layer.shadowOffset
        } set {
            
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor?
    {
        get {
            
            if let color = layer.shadowColor {
                
                return UIColor(cgColor: color)
            }
            
            return nil
        } set {
            
            if let color = newValue {
                
                layer.shadowColor = color.cgColor
            } else {
                
                layer.shadowColor = nil
            }
        }
    }
}

public extension UIDevice {
    
    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
            #if os(iOS)
            switch identifier {
            case "iPod5,1":                                 return "iPod Touch 5"
            case "iPod7,1":                                 return "iPod Touch 6"
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
            case "iPhone4,1":                               return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
            case "iPhone7,2":                               return "iPhone 6"
            case "iPhone7,1":                               return "iPhone 6 Plus"
            case "iPhone8,1":                               return "iPhone 6s"
            case "iPhone8,2":                               return "iPhone 6s Plus"
            case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
            case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
            case "iPhone8,4":                               return "iPhone SE"
            case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
            case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6":                return "iPhone X"
            case "iPhone11,2":                              return "iPhone XS"
            case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
            case "iPhone11,8":                              return "iPhone XR"
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
            case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
            case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
            case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
            case "iPad6,11", "iPad6,12":                    return "iPad 5"
            case "iPad7,5", "iPad7,6":                      return "iPad 6"
            case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
            case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
            case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
            case "iPad6,3", "iPad6,4":                      return "iPad Pro (9.7-inch)"
            case "iPad6,7", "iPad6,8":                      return "iPad Pro (12.9-inch)"
            case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) (2nd generation)"
            case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
            case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro (11-inch)"
            case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro (12.9-inch) (3rd generation)"
            case "AppleTV5,3":                              return "Apple TV"
            case "AppleTV6,2":                              return "Apple TV 4K"
            case "AudioAccessory1,1":                       return "HomePod"
            case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
            default:                                        return identifier
            }
            #elseif os(tvOS)
            switch identifier {
            case "AppleTV5,3": return "Apple TV 4"
            case "AppleTV6,2": return "Apple TV 4K"
            case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
            default: return identifier
            }
            #endif
        }
        
        return mapToDevice(identifier: identifier)
    }()
    
}

extension NSMutableArray
{
    
    func shuffle()
    {
        for index in 0..<count {
            
            let anotherIndex = Int(arc4random_uniform(UInt32(count - index))) + index
            if anotherIndex != index {
                
                exchangeObject(at: index, withObjectAt: anotherIndex)
            }
        }
    }
    
}

extension Date
{
    
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
}
extension UIColor
{
    
    //Convert RGBA String to UIColor object
    //"rgbaString" must be separated by space "0.5 0.6 0.7 1.0" 50% of Red 60% of Green 70% of Blue Alpha 100%
    public convenience init?(rgbaString : String){
        self.init(ciColor: CIColor(string: rgbaString))
    }
    
    //Convert UIColor to RGBA String
    func toRGBAString()-> String {
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return "\(r) \(g) \(b) \(a)"
        
    }
    //return UIColor from Hexadecimal Color string
    public convenience init?(hexaDecimalString: String) {
        
        let r, g, b, a: CGFloat
        
        let hexColor = hexaDecimalString
        
        if hexColor.count == 8 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }
        
        return nil
    }
    // Convert UIColor to Hexadecimal String
    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return String(
            format: "%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }
}
@available(iOS 13.0, *)
class Utility: NSObject
{
    
    static let objAppDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static let dbname : String = "Quiz.db"
    
    class func getPath(_ fileName:String)->String
    {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let fileURL = documentsURL.appendingPathComponent(fileName)
        
        return fileURL.path
    }

    
    static func UIColorFromHex(_ rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
   
    
    static func copyFile(_ fileName : NSString) {
        
        let dbPath: String = getPath(fileName as String)
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: dbPath) {
        
            let documentsURL = Bundle.main.resourceURL
            let fromPath =
                documentsURL!.appendingPathComponent(fileName as String)
            
            var error : NSError?
            do {
                try fileManager.copyItem(atPath: fromPath.path , toPath: dbPath)
            } catch let error1 as NSError {
                error = error1
            }
            if(error != nil) {
                print("Error Occured")
            }
            else {
                print("Successfully copied")
            }
        }
    }
    static func hexStringToUIColor (hex:String) -> UIColor
    {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func showAlertWithTitleFromVC(vc:UIViewController, title:String, andMessage message:String, buttons:[String], completion:((_ index:Int) -> Void)!) -> Void
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for index in 0 ..< buttons.count {
            
            let action = UIAlertAction(title: buttons[index], style: .default, handler: {
                (alert: UIAlertAction!) in
                
                if completion != nil {
                    
                    completion(index)
                }
            })
            
            alertController.addAction(action)
        }
        
        vc.present(alertController, animated: true, completion: nil)
    }
    
    static func isAlreadyExistsInLocalFolder(name: String) -> Bool
    {
        let fileURL = URL(string: "\(FILEPATH_DOCUMENTS)/\(name)")
        let fileManager = FileManager.default
        
        if IS_SANDBOX_TESTING {
            
            print("LOCAL PATH:")
            print(fileURL!.path)
        }
        
        if fileManager.fileExists(atPath: fileURL!.path) {
            
            return true
        }
        
        return false
    }
    
    static func isReadyLocalFolderForStore() -> Bool
    {
        if !Utility.isAlreadyExistsInLocalFolder(name: Local_Folder) {
            
            let fileURL = URL(string: "\(FILEPATH_DOCUMENTS)")
            let logPath = fileURL?.appendingPathComponent(Local_Folder)
            do {
                try FileManager.default.createDirectory(atPath: logPath!.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                
                return false
            }
        }
        
        return true
    }
    
    static func fetchAllLocalDataFileName() -> [String]
    {
        var arrOutput: [String] = []
        
        do
        {
            let fileURL = URL(string: "\(FILEPATH_DOCUMENTS)")
            print(Local_Folder)
            print(FILEPATH_DOCUMENTS)
            let logPath = fileURL?.appendingPathComponent(Local_Folder)
            let arrFiles = try FileManager.default.contentsOfDirectory(atPath: logPath!.path)
            
            print(arrFiles)
            for item in arrFiles
            {
                if item.contains(".png") {
                    
                    print(item)
                    arrOutput.append(item)
                }
            }
        }
        catch
        { }
        
        return arrOutput
    }
    static func RemoveAllLocalDataFileName(withPath path : String) -> Bool
    {
        
        do
        {
            try FileManager.default.removeItem(atPath: path)
            return true
        }
        catch
        {
            return false
        }
    }
    static func generateRandomString() -> String
    {
        let letters : NSString = "ABCD"
        let len = UInt32(4)
        
        var randomString = ""
        
        for _ in 0 ..< 1 {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
    static func showActionSheetWithTitleFromVC(vc:UIViewController, title:String, andMessage message:String, buttons:[String],canCancel:Bool, completion:((_ index:Int) -> Void)!) -> Void
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        for index in 0 ..< buttons.count  {
            
            let action = UIAlertAction(title: buttons[index], style: .default, handler: {
                (alert: UIAlertAction!) in
                
                if completion != nil {
                    
                    completion(index)
                }
            })
            
            alertController.addAction(action)
        }
        
        if canCancel {
            
            let action = UIAlertAction(title: "Cancel", style: .cancel, handler: {
                (alert: UIAlertAction!) in
                
                if completion != nil {
                    
                    completion(buttons.count)
                }
            })
            
            alertController.addAction(action)
        }
        
        if !IS_IPHONE {
            
            alertController.modalPresentationStyle = .popover
            alertController.popoverPresentationController?.sourceView = vc.view
        }
        
        vc.present(alertController, animated: true, completion: nil)
    }
    
    static func setUserDefaults(withObject object: AnyObject, forKey key: String)
    {
        UserDefaults.standard.set(object, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func getUserDefaults(forKey key: String) -> AnyObject
    {
        return UserDefaults.standard.object(forKey: key) as AnyObject
    }
    
    static func removeUserDefaults(forKey key: String)
    {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    static func isObjectValid(someObject: Any?) -> Any?
    {
        if someObject is String {
            
            if let someObject = someObject as? String {
                
                return someObject
            } else {
                
                return ""
            }
        } else if someObject is Array<Any> {
            
            if let someObject = someObject as? Array<Any> {
                
                return someObject
            } else {
                
                return []
            }
        } else if someObject is Dictionary<AnyHashable, Any> {
            
            if let someObject = someObject as? Dictionary<String, Any> {
                
                return someObject
            } else {
                
                return [:]
            }
        } else if someObject is Data {
            
            if let someObject = someObject as? Data {
                
                return someObject
            } else {
                
                return Data()
            }
        } else if someObject is NSNumber {
            
            if let someObject = someObject as? NSNumber{
                
                return someObject
            } else {
                
                return NSNumber.init(booleanLiteral: false)
            }
        } else if someObject is UIImage {
            
            if let someObject = someObject as? UIImage {
                
                return someObject
            } else {
                
                return UIImage()
            }
        } else {
            
            return "InValid Object"
        }
    }
    
}
