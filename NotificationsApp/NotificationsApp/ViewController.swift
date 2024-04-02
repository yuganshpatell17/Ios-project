//
//  ViewController.swift
//  NotificationsApp
//
//  Created by Tihomir RAdeff on 20.02.24.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //to see the notification if the app is opened
        UNUserNotificationCenter.current().delegate = self
        
        //give notifications permission
        givePermission()
        
    }

    @IBAction func buttonAction(_ sender: Any) {
        NotificationsHandler.createNotification(message: "This is the text of my notification")
        print("Notification sent - 5 seconds")
    }
    
    func givePermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if granted {
                print("Permission granted!")
            } else {
                print("Permission not granted!")
            }
        }
    }
    
    //to see the notification while the app is opened
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return .banner
    }
}

