//
//  funcFile.swift
//  sendNoti
//
//  Created by SUJAL on 3/4/24.
//

import Foundation
import UIKit


//func sendLocalNotification(title : String, body : String){
//    let content = UNMutableNotificationContent()
//    content.title = title
//    content.body = body
//    content.sound = UNNotificationSound.default
//    // Set the trigger to display the notification after 5 seconds
//    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5 , repeats: false)
//    
//    // Create a request for the notification
//    let request = UNNotificationRequest(identifier: "myNotification", content: content, trigger: trigger)
//    
//    // Schedule the notification
//    UNUserNotificationCenter.current().add(request) { error in
//        if let error = error {
//            print("Error scheduling notification: \(error.localizedDescription)")
//        } else {
//            print("Notification scheduled successfully")
//        }
//    }
//}


func sendLocalNotificationWithDate(title : String, body : String, year : Int, month : Int , day : Int, hour : Int, minute : Int , identifier : String){
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = UNNotificationSound.default
    
    var components = DateComponents()
    components.year = year
    components.month = month
    components.day = day
    components.hour = hour
    components.minute = minute
    
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
    
    // Create a request for the notification
    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
    
    // Schedule the notification
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error.localizedDescription)")
        } else {
            print("Notification scheduled successfully")
        }
    }
}
