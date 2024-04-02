

import UIKit

let APP_NAME = "Country Camel"
let APP_NAME_WITHOUT_SPACE = "Country_Camel"

var IS_SANDBOX_TESTING = false
let SHARE_Format: String = "\(APP_NAME) Download this application; You can know more about birds."


let fetchRecords = 500

let APP_URL: String = "https://apps.apple.com/app/id\(APPID)"
let Local_Folder: String = APP_NAME_WITHOUT_SPACE
let Review_URL = "https://apps.apple.com/app/id\(APPID)"
var SHARE_URL_Format: String = "\(APP_NAME) is a Maths app."
let APPID: String = ""
var EmailID: String = "iosapp234@gmail.com"
var EMAIL_URL_format: String = "Greetings from \(APP_NAME) Team. Please specify the deficiencies in the application. We will try to fix it!"

let APP_VERSION = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
let BUILD_VERSION = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
let DISPLAY_VERSION: String = "Version: \(APP_VERSION)"

var USER_NAME : String = ""
var USER_SCORE : Int = 0
var arrQuiz = [Quiz]()
var arrTravel = [Quiz]()

let msgSaveNotes = "Your Note Added Successfully !!"


let FILEPATH_DOCUMENTS = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]

let IS_IPHONE: Bool = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)
let IS_RETINA: Bool = UIScreen.main.scale >= 2.0

let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.size.height
let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.size.width

let SCREEN_MAX_LENGTH: CGFloat = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let SCREEN_MIN_LENGTH: CGFloat = min(SCREEN_WIDTH, SCREEN_HEIGHT)

let IS_IPHONE_4_OR_LESS: Bool = (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
let IS_IPHONE_5: Bool = (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
let IS_IPHONE_6: Bool = (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
let IS_IPHONE_6P: Bool = (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
let IS_IPHONE_X: Bool = (IS_IPHONE && SCREEN_MAX_LENGTH == 812.0)
let IS_IPHONE_XR: Bool = (IS_IPHONE && SCREEN_MAX_LENGTH == 896.0)

let Notification_NotAllow: String = "Not Allow"
let Notification_NotAllow_Msg: String = "You didn’t allow while asking about Local Notification! Please allow it for this function!"
