//
//  ViewController.swift
//  sendNoti
//
//  Created by SUJAL on 3/4/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var notification = UNMutableNotificationContent()
        
        notification.title = "Demo"
        notification.body = "Hello"
        notification.sound = UNNotificationSound.defaultRingtone
        
        
        let target  = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "demo123", content: notification, trigger: target)
        
        UNUserNotificationCenter.current().add(request) { err in
            
            if let err = err {
                print(err.localizedDescription)
            } else {
                print("Done")
            }
            
            
        }
        
//        sendLocalNotificationWithDate(title: "Demo", body: "Hello", year: 2024, month: 03, day: 07, hour: 19, minute: 46, identifier: "demotest1212")
        
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5 , repeats: false)
//        
//        // Create a request for the notification
//        let request = UNNotificationRequest(identifier: "myNotification", content: content, trigger: trigger)
//        
//        // Schedule the notification
//        UNUserNotificationCenter.current().add(request) { error in
//            if let error = error {
//                print("Error scheduling notification: \(error.localizedDescription)")
//            } else {
//                print("Notification scheduled successfully")
//            }
//        }

        
    }

    
    
    

}

