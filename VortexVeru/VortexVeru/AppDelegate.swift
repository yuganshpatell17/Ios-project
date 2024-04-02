 

import UIKit
import IQKeyboardManagerSwift

@available(iOS 13, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        
        arrQuiz = loadJson(filename: "lAND") ?? []
        
        arrTravel = loadJson(filename: "TRAVEL") ?? []
        
        if !UserDefaults.standard.bool(forKey: "is_FirstTimeLaunch") {
            UserDefaults.standard.set(0, forKey: "UserScore")
            UserDefaults.standard.set(true, forKey: "is_FirstTimeLaunch")
        }else {
            USER_SCORE = UserDefaults.standard.value(forKey: "UserScore") as? Int ?? 0
        }
        
        
        return true
    }
    
    func loadJson(filename fileName: String) -> [Quiz]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Quiz].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}



struct Quiz: Codable {
    var questionid: String = ""
    var category: String = ""
    var diff_rank: Int = 0
    var Rank: Int = 0
    var question: String = ""
    var Wronganswer1: String = ""
    var Wronganswer2: String = ""
    var Wronganswer3: String = ""
    var CORRECT: String = ""
    var pic: Int = 0
}
